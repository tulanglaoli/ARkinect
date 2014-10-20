// Support for DirectX and OpenGL native texture updating, from Unity 4.0 upwards
#if UNITY_4_3 || UNITY_4_2 || UNITY_4_1 || UNITY_4_0_1 || UNITY_4_0
#define AVPRO_UNITY_4_X
#endif

// Support for power-of-2 texture detection, from Unity 4.1 upwards
#if UNITY_4_3 || UNITY_4_2 || UNITY_4_1
#define AVPRO_UNITY_POT
#endif

using UnityEngine;
using System.Text;
using System.Collections.Generic;
using System.Runtime.InteropServices;

//-----------------------------------------------------------------------------
// Copyright 2012-2013 RenderHeads Ltd.  All rights reserved.
//-----------------------------------------------------------------------------

public class AVProLiveCameraPixelBuffer
{
	// Format conversion and texture output
	public Texture2D _texture;
	public int _innerWidth;
	public int _innerHeight;
	private int _lastFrameUploaded = -1;

#if !AVPRO_UNITY_4_X
	// For DirectX texture updates
	private GCHandle _frameHandle;
	private Color32[] _frameData;
	private System.IntPtr _framePointer;
#endif
	
	// Conversion params
	public int _width;
	public int _height;
	public TextureFormat _format;
	private int _deviceIndex;
	private int _bufferIndex;
		
	public AVProLiveCameraPixelBuffer(int deviceIndex, int bufferIndex)
	{
		_deviceIndex = deviceIndex;
		_bufferIndex = bufferIndex;
	}
	
	public void Reset()
	{
		_lastFrameUploaded = 0;
	}
	
	public bool Build(int width, int height, TextureFormat format = TextureFormat.RGBA32)
	{
		Reset();
		
		_width = width;
		_height = height;
		_format = format;
		
		CreateTexture();

		switch (AVProLiveCameraManager.Instance.TextureConversionMethod)
		{
#if AVPRO_UNITY_4_X
			case AVProLiveCameraManager.ConversionMethod.Unity4:
				AVProLiveCameraPlugin.SetTexturePointer(_deviceIndex, _bufferIndex, _texture.GetNativeTexturePtr());
				break;
#endif
			case AVProLiveCameraManager.ConversionMethod.Unity34_OpenGL:
				// We set the texture per-frame
				break;
#if UNITY_3_5
			case AVProLiveCameraManager.ConversionMethod.Unity35_OpenGL:
				AVProLiveCameraPlugin.SetTexturePointer(_deviceIndex, _bufferIndex, new System.IntPtr(_texture.GetNativeTextureID()));
				break;
#endif
#if !AVPRO_UNITY_4_X
			case AVProLiveCameraManager.ConversionMethod.UnityScript:
				CreateBuffer();
				break;
#endif
		}
						
		return true;
	}
	
	public bool Update()
	{
		bool result = false;

		AVProLiveCameraManager.ConversionMethod method = AVProLiveCameraManager.Instance.TextureConversionMethod;

#if AVPRO_UNITY_4_X || UNITY_3_5
		if (method == AVProLiveCameraManager.ConversionMethod.Unity4 ||
			method == AVProLiveCameraManager.ConversionMethod.Unity35_OpenGL)
		{
			// We update all the textures from AVProLiveCameraManager.Update()
			// so just check if the update was done
			int lastFrameUploaded = AVProLiveCameraPlugin.GetLastFrameUploaded(_deviceIndex);
			if (_lastFrameUploaded != lastFrameUploaded)
			{			
				_lastFrameUploaded = lastFrameUploaded;
				result = true;
			}
			return result;
		}
#endif

#if UNITY_3_4
		// Update the OpenGL texture directly
		if (method == AVProLiveCameraManager.ConversionMethod.Unity34_OpenGL)
		{
			result = AVProLiveCameraPlugin.UpdateTextureGL(_deviceIndex, _texture.GetNativeTextureID());
			GL.InvalidateState();
		}
#endif

#if !AVPRO_UNITY_4_X
		// Update the texture using Unity scripting, this is the slowest method
		if (method == AVProLiveCameraManager.ConversionMethod.UnityScript)
		{
			result = AVProLiveCameraPlugin.GetFramePixels(_deviceIndex, _framePointer, _bufferIndex, _texture.width, _texture.height);
			if (result)
			{
				_texture.SetPixels32(_frameData);
				_texture.Apply(false, false);
			}
		}
#endif
		
		return result;
	}
	
	public void Close()
	{		
		if (_texture != null)
		{
			Texture2D.Destroy(_texture);
			_texture = null;
		}

#if !AVPRO_UNITY_4_X
		if (_frameHandle.IsAllocated)
		{
			_frameHandle.Free();
			_frameData = null;
		}
		_framePointer = System.IntPtr.Zero;
#endif
	}

	private void CreateTexture()
	{
		// Calculate texture size
		int textureWidth = _width;
		int textureHeight = _height;
		_innerWidth = textureWidth;
		_innerHeight = textureHeight;

		bool requiresPOT = true;
#if AVPRO_UNITY_POT
		requiresPOT = (SystemInfo.npotSupport == NPOTSupport.None);
#endif
		// If the texture isn't a power of 2
		if (requiresPOT)
		{
			if (!Mathf.IsPowerOfTwo(_width) || !Mathf.IsPowerOfTwo(_height))
			{
				// We use a power-of-2 texture as Unity makes these internally anyway and not doing it seems to break things for texture updates
				textureWidth = Mathf.NextPowerOfTwo(textureWidth);
				textureHeight = Mathf.NextPowerOfTwo(textureHeight);
			}
		}
		//Debug.Log("[AVProLiveCamera] Using texture " + textureWidth + "x" + textureHeight + " for stream " + _width + "x" + _height);
		
		// Create texture that stores the initial raw frame
		// If there is already a texture, only destroy it if it isn't of desired size
		if (_texture != null)
		{
			if (_texture.width != textureWidth || _texture.height != textureHeight)
			{
				Texture2D.Destroy(_texture);
				_texture = null;
			}
		}
		if (_texture == null)
		{
			_texture = new Texture2D(textureWidth, textureHeight, _format, false);
			_texture.hideFlags = HideFlags.HideAndDontSave;
			_texture.wrapMode = TextureWrapMode.Clamp;
			_texture.filterMode = FilterMode.Point;
			_texture.Apply(false, false);
		}
	}

#if !AVPRO_UNITY_4_X
	private void CreateBuffer()
	{
		// Allocate buffer for non-opengl updates
		if (_frameHandle.IsAllocated && _frameData != null)
		{
			if (_frameData.Length < _texture.width * _texture.height)
			{
				_frameHandle.Free();
				_frameData = null;
				_framePointer = System.IntPtr.Zero;
			}
		}
		if (_frameData == null)
		{
			_frameData = new Color32[_texture.width * _texture.height];
			_frameHandle = GCHandle.Alloc(_frameData, GCHandleType.Pinned);
			_framePointer = _frameHandle.AddrOfPinnedObject();
		}
	}
#endif
}