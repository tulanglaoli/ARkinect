using System.Text;
using System.Runtime.InteropServices;

//-----------------------------------------------------------------------------
// Copyright 2012 RenderHeads Ltd.  All rights reserved.
//-----------------------------------------------------------------------------

public class AVProLiveCameraPlugin
{
	public enum VideoFrameFormat
	{
		RAW_BGRA32,
		
		YUV_422_YUY2,
		YUV_422_UYVY,
		YUV_422_YVYU,
		YUV_422_HDYC,

		YUV_420_PLANAR_YV12,
		YUV_420_PLANAR_I420,

		RAW_RGB24,
		RAW_MONO8,
	}
	
	public enum VideoInput
	{
		None,
		Video_Tuner,
		Video_Composite,
		Video_SVideo,
		Video_RGB,
		Video_YRYBY,
		Video_Serial_Digital,
		Video_Parallel_Digital,
		Video_SCSI,
		Video_AUX,
		Video_1394,
		Video_USB,
		Video_Decoder,
		Video_Encoder,
		Video_SCART,
		Video_Black,
	}
	
	// Used by GL.IssuePluginEvent
	public const int PluginID = 0xFA20000;
	public enum PluginEvent
	{
		UpdateAllTextures = 0,
	}
	
	//////////////////////////////////////////////////////////////////////////
	// System Initialisation

#if UNITY_64
	[DllImport("AVProLiveCamera-x64")]
#else
	[DllImport("AVProLiveCamera")]
#endif
	public static extern bool Init(bool supportUnity35OpenGL, bool supportInternalConversion);


#if UNITY_64
	[DllImport("AVProLiveCamera-x64")]
#else
	[DllImport("AVProLiveCamera")]
#endif
	public static extern void Deinit();

#if UNITY_64
	[DllImport("AVProLiveCamera-x64")]
#else
	[DllImport("AVProLiveCamera")]
#endif
	public static extern float GetPluginVersion();
	
	//////////////////////////////////////////////////////////////////////////
	// Device Enumeration & Configuration

#if UNITY_64
	[DllImport("AVProLiveCamera-x64")]
#else
	[DllImport("AVProLiveCamera")]
#endif
	public static extern int GetNumDevices();

#if UNITY_64
	[DllImport("AVProLiveCamera-x64")]
#else
	[DllImport("AVProLiveCamera")]
#endif
	public static extern bool HasDeviceConfigWindow(int index);

#if UNITY_64
	[DllImport("AVProLiveCamera-x64")]
#else
	[DllImport("AVProLiveCamera")]
#endif	
	public static extern bool ShowDeviceConfigWindow(int index);

#if UNITY_64
	[DllImport("AVProLiveCamera-x64")]
#else
	[DllImport("AVProLiveCamera")]
#endif
	private static extern bool GetDeviceName(int index, StringBuilder s);
	
	public static bool GetDeviceName(int index, out string name)
	{
		StringBuilder nameStr = new StringBuilder(512);
		if (GetDeviceName(index, nameStr))
		{
			name = nameStr.ToString();
			return true;
		}
		name = string.Empty;
		return false;
	}
	
#if UNITY_64
	[DllImport("AVProLiveCamera-x64")]
#else
	[DllImport("AVProLiveCamera")]
#endif
	private static extern bool GetDeviceGUID(int index, StringBuilder s);
	
	public static bool GetDeviceGUID(int index, out string name)
	{
		StringBuilder nameStr = new StringBuilder(512);
		if (GetDeviceGUID(index, nameStr))
		{
			name = nameStr.ToString();
			return true;
		}
		name = string.Empty;
		return false;
	}	
	
#if UNITY_64
	[DllImport("AVProLiveCamera-x64")]
#else
	[DllImport("AVProLiveCamera")]
#endif
	public static extern bool IsDeviceConnected(int index);
	
#if UNITY_64
	[DllImport("AVProLiveCamera-x64")]
#else
	[DllImport("AVProLiveCamera")]
#endif
	public static extern bool UpdateDevicesConnected();
		

#if UNITY_64
	[DllImport("AVProLiveCamera-x64")]
#else
	[DllImport("AVProLiveCamera")]
#endif
	public static extern int GetNumModes(int index);

#if UNITY_64
	[DllImport("AVProLiveCamera-x64")]
#else
	[DllImport("AVProLiveCamera")]
#endif
	private static extern bool GetModeInfo(int deviceIndex, int modeIndex, out int width, out int height, out float fps, StringBuilder format);
	
	public static bool GetModeInfo(int deviceIndex, int modeIndex, out int width, out int height, out float fps, out string format)
	{
		StringBuilder formatStr = new StringBuilder(512);
		if (GetModeInfo(deviceIndex, modeIndex, out width, out height, out fps, formatStr))
		{
			format = formatStr.ToString();
			return true;
		}
		format = string.Empty;
		return false;
	}
	
#if UNITY_64
	[DllImport("AVProLiveCamera-x64")]
#else
	[DllImport("AVProLiveCamera")]
#endif
	public static extern int GetNumVideoInputs(int deviceIndex);
	
#if UNITY_64
	[DllImport("AVProLiveCamera-x64")]
#else
	[DllImport("AVProLiveCamera")]
#endif
	private static extern bool GetVideoInputName(int deviceIndex, int inputIndex, StringBuilder name);
	
	public static bool GetVideoInputName(int deviceIndex, int inputIndex, out string name)
	{
		StringBuilder nameStr = new StringBuilder(512);
		if (GetVideoInputName(deviceIndex, inputIndex, nameStr))
		{
			name = nameStr.ToString();
			return true;
		}
		name = string.Empty;
		return false;
	}	
	
#if UNITY_64
	[DllImport("AVProLiveCamera-x64")]
#else
	[DllImport("AVProLiveCamera")]
#endif
	public static extern void SetVideoInputByIndex(int deviceIndex, int inputIndex);

	//////////////////////////////////////////////////////////////////////////
	// Open & Close Devices

#if UNITY_64
	[DllImport("AVProLiveCamera-x64")]
#else
	[DllImport("AVProLiveCamera")]
#endif
	public static extern bool StartDevice(int index, int modeIndex, int videoInputIndex);

#if UNITY_64
	[DllImport("AVProLiveCamera-x64")]
#else
	[DllImport("AVProLiveCamera")]
#endif
	public static extern void StopDevice(int index);
	
	//////////////////////////////////////////////////////////////////////////
	// Play & Pause

#if UNITY_64
	[DllImport("AVProLiveCamera-x64")]
#else
	[DllImport("AVProLiveCamera")]
#endif
	public static extern bool Play(int index);

#if UNITY_64
	[DllImport("AVProLiveCamera-x64")]
#else
	[DllImport("AVProLiveCamera")]
#endif
	public static extern void Pause(int index);	
	
	//////////////////////////////////////////////////////////////////////////
	// Current State of Device

#if UNITY_64
	[DllImport("AVProLiveCamera-x64")]
#else
	[DllImport("AVProLiveCamera")]
#endif
	public static extern int GetWidth(int index);

#if UNITY_64
	[DllImport("AVProLiveCamera-x64")]
#else
	[DllImport("AVProLiveCamera")]
#endif
	public static extern int GetHeight(int index);

#if UNITY_64
	[DllImport("AVProLiveCamera-x64")]
#else
	[DllImport("AVProLiveCamera")]
#endif
	public static extern float GetFrameRate(int index);

#if UNITY_64
	[DllImport("AVProLiveCamera-x64")]
#else
	[DllImport("AVProLiveCamera")]
#endif
	public static extern long GetFrameDurationHNS(int index);

#if UNITY_64
	[DllImport("AVProLiveCamera-x64")]
#else
	[DllImport("AVProLiveCamera")]
#endif
	public static extern int GetFormat(int index);

#if UNITY_64
	[DllImport("AVProLiveCamera-x64")]
#else
	[DllImport("AVProLiveCamera")]
#endif
	public static extern bool IsFrameTopDown(int index);

#if UNITY_64
	[DllImport("AVProLiveCamera-x64")]
#else
	[DllImport("AVProLiveCamera")]
#endif
	public static extern uint GetLastFrame(int index);

	//////////////////////////////////////////////////////////////////////////
	// Frame Updating

#if UNITY_64
	[DllImport("AVProLiveCamera-x64")]
#else
	[DllImport("AVProLiveCamera")]
#endif
	public static extern bool SetActive(int index, bool active);

#if UNITY_64
	[DllImport("AVProLiveCamera-x64")]
#else
	[DllImport("AVProLiveCamera")]
#endif
	public static extern bool IsNextFrameReadyForGrab(int index);
	
#if UNITY_64
	[DllImport("AVProLiveCamera-x64")]
#else
	[DllImport("AVProLiveCamera")]
#endif
	public static extern int GetLastFrameUploaded(int handle);	

#if UNITY_64
	[DllImport("AVProLiveCamera-x64")]
#else
	[DllImport("AVProLiveCamera")]
#endif
	public static extern bool UpdateTextureGL(int index, int textureID);

#if UNITY_64
	[DllImport("AVProLiveCamera-x64")]
#else
	[DllImport("AVProLiveCamera")]
#endif
	public static extern bool GetFramePixels(int index, System.IntPtr buffer, int bufferIndex, int bufferWidth, int bufferHeight);
	
#if UNITY_64
	[DllImport("AVProLiveCamera-x64")]
#else
	[DllImport("AVProLiveCamera")]
#endif
	public static extern void SetTexturePointer(int index, int bufferIndex, System.IntPtr texturePtr);
	
#if UNITY_64
	[DllImport("AVProLiveCamera-x64")]
#else
	[DllImport("AVProLiveCamera")]
#endif
	public static extern bool GetFrameAsColor32(int index, System.IntPtr bufferPtr, int bufferWidth, int bufferHeight);	
	
	//////////////////////////////////////////////////////////////////////////
	// Live Stats

#if UNITY_64
	[DllImport("AVProLiveCamera-x64")]
#else
	[DllImport("AVProLiveCamera")]
#endif
	public static extern float GetCaptureFrameRate(int deviceIndex);

#if UNITY_64
	[DllImport("AVProLiveCamera-x64")]
#else
	[DllImport("AVProLiveCamera")]
#endif
	public static extern uint GetCaptureFramesDropped(int deviceIndex);

	//////////////////////////////////////////////////////////////////////////
	// Internal Frame Buffering
	
#if UNITY_64
	[DllImport("AVProLiveCamera-x64")]
#else
	[DllImport("AVProLiveCamera")]
#endif
	public static extern void SetFrameBufferSize(int deviceIndex, int read, int write);
	
#if UNITY_64
	[DllImport("AVProLiveCamera-x64")]
#else
	[DllImport("AVProLiveCamera")]
#endif
	public static extern long GetLastFrameBufferedTime(int deviceIndex);

#if UNITY_64
	[DllImport("AVProLiveCamera-x64")]
#else
	[DllImport("AVProLiveCamera")]
#endif
	public static extern System.IntPtr GetLastFrameBuffered(int deviceIndex);
	
#if UNITY_64
	[DllImport("AVProLiveCamera-x64")]
#else
	[DllImport("AVProLiveCamera")]
#endif
	public static extern System.IntPtr GetFrameFromBufferAtTime(int deviceIndex, long time);
}