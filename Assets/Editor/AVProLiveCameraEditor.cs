using UnityEngine;
using UnityEditor;
using System.Collections;

//-----------------------------------------------------------------------------
// Copyright 2012 RenderHeads Ltd.  All rights reserved.
//-----------------------------------------------------------------------------

[CustomEditor(typeof(AVProLiveCamera))]
public class AVProLiveCameraEditor : Editor
{
	private AVProLiveCamera _camera;
	private bool _preview = true;
	
	public override void OnInspectorGUI()
	{
		_camera = (this.target) as AVProLiveCamera;
		
		//EditorGUIUtility.LookLikeInspector();
		//DrawDefaultInspector();
		
		if (!Application.isPlaying)
		{		
			EditorGUILayout.LabelField("Search for Capture Device:", "");
			EditorGUILayout.Space();
			
			GUILayout.BeginHorizontal();
			EditorGUILayout.PrefixLabel("Device Select By");
			GUILayout.BeginVertical();
			
			AVProLiveCamera.SelectDeviceBy newDeviceSelection = (AVProLiveCamera.SelectDeviceBy)EditorGUILayout.EnumPopup("", _camera._deviceSelection);
			switch (newDeviceSelection)
			{
			case AVProLiveCamera.SelectDeviceBy.Default:
				break;
			case AVProLiveCamera.SelectDeviceBy.Name:
				if (_camera._deviceSelection != newDeviceSelection  && _camera._desiredDeviceNames.Count == 0)
					_camera._desiredDeviceNames.Add("Enter Camera Name");				
				EditorGUILayout.BeginVertical();
				for (int index = 0; index < _camera._desiredDeviceNames.Count; index++)
				{
					EditorGUILayout.BeginHorizontal();
					
					
					/*EditorGUILayout.BeginHorizontal(GUILayout.Width(96));
					if (index != 0)
					{
						if (GUILayout.Button("Up"))
						{
							string temp = _camera._desiredDeviceNames[index - 1];
							_camera._desiredDeviceNames[index - 1] = _camera._desiredDeviceNames[index];
							_camera._desiredDeviceNames[index] = temp;
							HandleUtility.Repaint();
						}				
					}
					if (index + 1 < _camera._desiredDeviceNames.Count)
					{
						if (GUILayout.Button("Down"))
						{
							string temp = _camera._desiredDeviceNames[index + 1];
							_camera._desiredDeviceNames[index + 1] = _camera._desiredDeviceNames[index];
							_camera._desiredDeviceNames[index] = temp;
							HandleUtility.Repaint();
						}
					}
					EditorGUILayout.EndHorizontal();*/
					
					if (GUILayout.Button("-"))
					{
						_camera._desiredDeviceNames.RemoveAt(index);
						break;
					}
					else
					{
						_camera._desiredDeviceNames[index] = EditorGUILayout.TextField(_camera._desiredDeviceNames[index]);
					}
					EditorGUILayout.EndHorizontal();
				}
				if (GUILayout.Button("+"))
				{
					_camera._desiredDeviceNames.Add(string.Empty);
					this.Repaint();
				}			
				EditorGUILayout.EndVertical();
				break;
			case AVProLiveCamera.SelectDeviceBy.Index:
				_camera._desiredDeviceIndex = EditorGUILayout.IntField(_camera._desiredDeviceIndex);
				break;
			}
			_camera._deviceSelection = newDeviceSelection;
			GUILayout.EndVertical();
			GUILayout.EndHorizontal();
			EditorGUILayout.Space();
			
			
			
			GUILayout.BeginHorizontal();
			EditorGUILayout.PrefixLabel("Mode Select By");
			GUILayout.BeginVertical();
			AVProLiveCamera.SelectModeBy newResolutionSelection = (AVProLiveCamera.SelectModeBy)EditorGUILayout.EnumPopup("", _camera._modeSelection);
			switch (newResolutionSelection)
			{
			case AVProLiveCamera.SelectModeBy.Default:
				break;
			case AVProLiveCamera.SelectModeBy.Resolution:
				if (_camera._modeSelection != newResolutionSelection && _camera._desiredResolutions.Count == 0)
					_camera._desiredResolutions.Add(new Vector2(640, 360));
				EditorGUILayout.BeginVertical();
				_camera._maintainAspectRatio = EditorGUILayout.Toggle("Maintain Aspect Ratio", _camera._maintainAspectRatio);
				for (int index = 0; index < _camera._desiredResolutions.Count; index++)
				{
					EditorGUILayout.BeginHorizontal();
					if (GUILayout.Button("-"))
					{
						_camera._desiredResolutions.RemoveAt(index);
						break;
					}
					else
					{
						Vector2 res = _camera._desiredResolutions[index];
						res.x = EditorGUILayout.FloatField(res.x, GUILayout.Width(64));
						EditorGUILayout.LabelField("x", "", GUILayout.Width(24));
						res.y = EditorGUILayout.FloatField(res.y, GUILayout.Width(64));
						_camera._desiredResolutions[index] = res;
					}
					EditorGUILayout.EndHorizontal();
				}
				if (GUILayout.Button("+"))
				{
					_camera._desiredResolutions.Add(new Vector2(640, 360));
					this.Repaint();
				}
				
				EditorGUILayout.EndVertical();
				break;
			case AVProLiveCamera.SelectModeBy.Index:
				_camera._desiredModeIndex = EditorGUILayout.IntField(_camera._desiredModeIndex);
				break;
			}
			_camera._modeSelection = newResolutionSelection;
			GUILayout.EndVertical();
			GUILayout.EndHorizontal();
			EditorGUILayout.Space();
			
			
		
			GUILayout.BeginHorizontal();
			EditorGUILayout.PrefixLabel("Video Input Select By");
			GUILayout.BeginVertical();
			AVProLiveCamera.SelectDeviceBy newVideoInputSelection = (AVProLiveCamera.SelectDeviceBy)EditorGUILayout.EnumPopup("", _camera._videoInputSelection);
			switch (newVideoInputSelection)
			{
			case AVProLiveCamera.SelectDeviceBy.Default:
				break;
			case AVProLiveCamera.SelectDeviceBy.Name:
				if (_camera._videoInputSelection != newVideoInputSelection && _camera._desiredVideoInputs.Count == 0)
					_camera._desiredVideoInputs.Add(AVProLiveCameraPlugin.VideoInput.Video_Serial_Digital);
				EditorGUILayout.BeginVertical();
				for (int index = 0; index < _camera._desiredVideoInputs.Count; index++)
				{
					EditorGUILayout.BeginHorizontal();
					if (GUILayout.Button("-"))
					{
						_camera._desiredVideoInputs.RemoveAt(index);
						break;
					}
					else
					{
						_camera._desiredVideoInputs[index] = (AVProLiveCameraPlugin.VideoInput)EditorGUILayout.EnumPopup(_camera._desiredVideoInputs[index]);
					}
					EditorGUILayout.EndHorizontal();
				}
				if (GUILayout.Button("+"))
				{
					_camera._desiredVideoInputs.Add(AVProLiveCameraPlugin.VideoInput.Video_Serial_Digital);
					this.Repaint();
				}			
				EditorGUILayout.EndVertical();
				break;
			case AVProLiveCamera.SelectDeviceBy.Index:
				_camera._desiredVideoInputIndex = EditorGUILayout.IntField(_camera._desiredVideoInputIndex);
				break;
			}
			_camera._videoInputSelection = newVideoInputSelection;
			GUILayout.EndVertical();
			GUILayout.EndHorizontal();
			EditorGUILayout.Space();		
			
			_camera._playOnStart = EditorGUILayout.Toggle("Play On Start", _camera._playOnStart);	
			_camera._deinterlace = EditorGUILayout.Toggle("Deinterlace", _camera._deinterlace);	
		}	
		else
		{
			if (_camera.Device != null)
			{
				_preview = GUILayout.Toggle(_preview, "Inspector Preview");

				AVProLiveCameraDevice device = _camera.Device;
				
			
				if (_preview && device.OutputTexture != null)
				{
					Rect textureRect = GUILayoutUtility.GetRect(64.0f, 64.0f, GUILayout.MinWidth(64.0f), GUILayout.MinHeight(64.0f));
					GUI.DrawTexture(textureRect, device.OutputTexture, ScaleMode.ScaleToFit);
				}

				GUILayout.Label("Device: " + device.Name);
				GUILayout.Label(string.Format("Mode: {0}x{1} {2}", device.CurrentWidth, device.CurrentHeight, device.CurrentFormat));
				
				if (device.FramesTotal > 30)
				{
					GUILayout.Label("Displaying at " + device.DisplayFPS.ToString("F1") + " fps");
				}
				else
				{
					GUILayout.Label("Displaying at ... fps");	
				}				
							
				if (device.IsRunning)
				{
					GUILayout.BeginHorizontal();
					if (GUILayout.Button("Stop Camera"))
					{
						device.Close();
					}
					if (device.IsPaused)
					{
						if (GUILayout.Button("Unpause Stream"))
						{
							device.Play();
						}						
					}
					else
					{
						if (GUILayout.Button("Pause Stream"))
						{
							device.Pause();
						}
					}
					GUILayout.EndHorizontal();
				}
				else
				{
					if (GUILayout.Button("Start Camera"))
					{
						_camera.Begin();
					}
				}
				
				GUI.enabled = device.CanShowConfigWindow();
		   		if (GUILayout.Button("Show Config Window"))
				{
					device.ShowConfigWindow();
				}
				GUI.enabled = false;
				
				//EditorGUILayout.Toggle("Running:", device.IsRunning);
			}
			
			if (_preview)
			{
				//HandleUtility.Repaint();
				this.Repaint();
			}			
		}
	}
}