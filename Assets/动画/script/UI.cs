using UnityEngine;
using System.Collections;

public class UI : MonoBehaviour {
	public Texture2D textureToDisplay;

void OnGUI(){
		GUI.Label(new Rect(920, -5,117,100), textureToDisplay);
		GUI.Box(new Rect(1150,-2, 130, 900), "");
	}
	

}
