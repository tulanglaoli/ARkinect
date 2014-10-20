using UnityEngine;
 
using System.Collections;
 
using System.IO;
 
using System;
 

public class WebCameraScript : MonoBehaviour {
 
	public GameObject plan;

    private texture myCam;

	public GUITexture myCameraTexture;
 
    private WebCamTexture webCameraTexture;

 

    void Start () {

		myCam = (texture)plan.GetComponent<texture>();//GameObject.GetComponent<T>()

        // Checks how many and which cameras are available on the device
 if(WebCamTexture.devices.Length>1)
        for (int cameraIndex = 0; cameraIndex < WebCamTexture.devices.Length; cameraIndex++)
 
        {
 
            // We want the back camera
 
            if (WebCamTexture.devices[cameraIndex].name!="Integrated Camera")
 
            {
 
                //webCameraTexture = new WebCamTexture(cameraIndex, Screen.width, Screen.height);
 
                                webCameraTexture = new WebCamTexture(WebCamTexture.devices[cameraIndex].name,1000,1000);
 

                // Here we flip the GuiTexture by applying a localScale transformation
 
                // works only in Landscape mode
 
                //myCameraTexture.transform.localScale = new Vector3(1,1,1);
 
            }
        }  
		else
			webCameraTexture = new WebCamTexture(WebCamTexture.devices[0].name,1000,1000,60);

		 		myCam.textures = webCameraTexture;

		
 		myCam.textures = webCameraTexture;
		//print(webCameraTexture.height);
		//print(webCameraTexture.width);
        // Starts the camera
 
        webCameraTexture.Play();
 
    }
 

//    public void ShowCamera()
// 
//    {
// 
//        myCameraTexture.guiTexture.enabled = true;
//        webCameraTexture.Play();
// 
//    }
// 
//
//    public void HideCamera()
// 
//    {
// 
//
//        myCameraTexture.guiTexture.enabled = false;
//        webCameraTexture.Stop();
// 
//
//    }
 

//    void OnGUI()
// 
//    {
// 
//                
//        // A button to demonstrate how to turn the camera on and off, in case you need it
// 
//        if(GUI.Button(new Rect(0,0,100,100),"ON/OFF"))
// 
//        {
// 
//            if(webCameraTexture.isPlaying)
// 
//                this.HideCamera();
// 
//            else
// 
//                this.ShowCamera();
// 
//        }
// 
//    } 
        
        void Update()
 
        {
		//print(webCameraTexture.height);
		//print(webCameraTexture.width);
 			//myCam.textures = myCameraTexture.texture;
                
        }
 
}