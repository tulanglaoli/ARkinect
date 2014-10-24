using UnityEngine;
using System.Collections;
//using Kinect;
using XMLCLass;

public class dragmouse : MonoBehaviour {
	
	
	public Camera MainC;
	int Debugmod;
	Vector3 mouserecord;
	public GameObject dragobj;
	public long kinectAngle;
	public WtoStest Wts;
	public GetPostion GP;
	public KinectPointController kpc;
	public GameObject center;
	public GameObject handL;
	public GameObject handR;
	public Texture Testview;
	Rect usersClrRect;
	// Use this for initialization
	void Start () {
		tempV = new Vector3 (0, 0, 0);
	}
	
	// Update is called once per frame
	void Update () {
		
		if(Input.GetKeyDown(KeyCode.F))
		{
			if(Debugmod==0)
			
				Debugmod = 1;
			else
				Debugmod = 0;
		}
		else 
			
//		if(Input.GetKey(KeyCode.Q))
//		{
//			dragobj.transform.localPosition +=new Vector3(0,0,0.01f);
//			//dragobj.transform.localScale += new Vector3(0.01f,0,0);
//		}
//		else 
//		if(Input.GetKey(KeyCode.A))
//		{
//			dragobj.transform.localPosition +=new Vector3(0.01f,0,0);
//			//dragobj.transform.localScale += new Vector3(0,0.01f,0);
//		}
//		else 
//		if(Input.GetKey(KeyCode.E))
//		{
//			dragobj.transform.localPosition -=new Vector3(0,0,0.01f);
//			//dragobj.transform.localScale += new Vector3(0,0,0.01f);
//		}
//		else 
//		if(Input.GetKey(KeyCode.W))
//		{
//			dragobj.transform.localPosition +=new Vector3(0,0.01f,0);
//			//dragobj.transform.localScale -= new Vector3(0.01f,0,0);
//		}
//		else 
//		if(Input.GetKey(KeyCode.D))
//		{
//			dragobj.transform.localPosition -=new Vector3(0.01f,0,0);
//			//dragobj.transform.localScale -= new Vector3(0,0.01f,0);
//		}
//		else 
//		if(Input.GetKey(KeyCode.S))
//		{
//			dragobj.transform.localPosition -=new Vector3(0,0.01f,0);
//			//dragobj.transform.localScale -= new Vector3(0,0,0.01f);
//		}
//		else 
//		if(Input.GetKey(KeyCode.X))
//		{
//			dragobj.transform.Rotate(0.2f,0,0,Space.World);
//			//dragobj.transform.localScale -= new Vector3(0,0,0.01f);
//		}
//		else 
//		if(Input.GetKey(KeyCode.Z))
//		{
//			dragobj.transform.Rotate(-0.2f,0,0,Space.World);
//			//dragobj.transform.localScale -= new Vector3(0,0,0.01f);
//		}
		mouserecord = new Vector3(Input.mousePosition.x/MainC.pixelWidth,Input.mousePosition.y/MainC.pixelHeight,0);
	}
	
	void OnMouseDrag() {
		if(Debugmod==1)
		{
			if(mouserecord.x ==0&&mouserecord.y ==0)
			{
				mouserecord = new Vector3(Input.mousePosition.x/MainC.pixelWidth,Input.mousePosition.y/MainC.pixelHeight,0);
			}
			else
			{
				
        		dragobj.transform.localPosition += new Vector3(Input.mousePosition.x/MainC.pixelWidth-mouserecord.x,Input.mousePosition.y/MainC.pixelHeight-mouserecord.y,0-mouserecord.z);
				mouserecord = new Vector3(Input.mousePosition.x/MainC.pixelWidth,Input.mousePosition.y/MainC.pixelHeight,0);
			}
		}
    }
//	void OnMouseEnter()
//	{
//		mouserecord = new Vector3(Input.mousePosition.x/MainC.pixelWidth,Input.mousePosition.y/MainC.pixelHeight,6.52f);
//	}
	
	public int ReturnDebug()
	{
		return Debugmod;
	}
	string stringToEdit ="0";
	string StringToEdit2 = "0";
	string stringToEdit3 = "0";
	string stringtoedit4 = "1";
	string stringtodeit5 = "0";
	Vector3 tempV;
	void OnGUI()
	{
		if(Debugmod==1)
		{
			//测试画面
			GUI.DrawTexture(new Rect(Camera.main.pixelRect.width*0.55f,Camera.main.pixelRect.height*0.75f,Camera.main.pixelRect.width*0.45f,Camera.main.pixelRect.height*0.25f),Testview);
			//按钮位置
			GUI.Box(new Rect(0.4f*MainC.pixelWidth,0.30f*MainC.pixelHeight,0.2f*MainC.pixelWidth,0.15f*MainC.pixelHeight),"Button");
//			GUI.TextField(new Rect(70,370,100,30),"center:"+center.transform.position.y.ToString());
//			GUI.TextField(new Rect(70,410,100,30),"left:"+handL.transform.position.y.ToString());
//			GUI.TextField(new Rect(70,450,100,30),"right:"+handR.transform.position.y.ToString());
//			if (GUI.Button (new Rect(10,10,100,30), "changeangle"))
//			{
//				kinectAngle=long.Parse(stringToEdit);
//				//NativeMethods.NuiCameraSetAngle(kinectAngle);
//				//dragobj.transform.Rotate(float.Parse(StringToEdit2),0,0,Space.World);
//				StringToEdit2 = dragobj.transform.rotation.eulerAngles.x.ToString();
//				
//			}
			GUI.TextField(new Rect(10,50,100,30),"range_In:");
			tempV.x = float.Parse(GUI.TextArea(new Rect(120,50,70,30),tempV.x.ToString(),100));
			GUI.TextField(new Rect(10,90,100,30),"range_Leave:");
			tempV.y = float.Parse(GUI.TextArea(new Rect(120,90,70,30),tempV.y.ToString(),100));
			if(GUI.Button (new Rect(10,130,100,30), "changeheight"))
			{
			    Wts.buttonheight = float.Parse(stringToEdit3);
				kpc.moverange.x = tempV.x;
				kpc.moverange.y = tempV.y;

				//GP.Rate = float.Parse( stringtoedit4);
				//kpc.Stopfloat= float.Parse( stringtodeit5);
			}
			GUI.TextField(new Rect(10,170,100,30),"button_height:");
			stringToEdit3 = GUI.TextArea(new Rect(120,170,70,30),stringToEdit3,100);
//			GUI.TextField(new Rect(10,290,100,30),"JIBian:");
//			stringtoedit4 = GUI.TextArea(new Rect(120,290,70,30),stringtoedit4,100);
			GUI.TextField(new Rect(10,330,100,30),"Stop:");
			stringtodeit5 = GUI.TextArea(new Rect(120,330,70,30),stringtodeit5,100);
			if(GUI.Button(new Rect(10,210,100,30), "save"))
			{
				stringtodeit5 = kpc.Stopfloat.ToString();
//				Class1.XMLWrite("init","anglecam",0,stringToEdit);
//				Class1.XMLWrite("init","anglekin",0,StringToEdit2);
				Class1.XMLWrite("init","height",0,stringToEdit3);
//				tempp = dragobj.transform.localPosition.x;
				Class1.XMLWrite("init","postionx",0,tempV.x.ToString());
//				tempp = dragobj.transform.localPosition.y;
				Class1.XMLWrite("init","postiony",0,tempV.y.ToString());
//				tempp = dragobj.transform.localPosition.z;
//				Class1.XMLWrite("init","postionz",0,tempp.ToString());
//				stringtoedit4 = GP.Rate.ToString();
//				Class1.XMLWrite("init","Rate",0,stringtoedit4);

				Class1.XMLWrite("init","stopfloat",0,stringtodeit5);

			}
			if(GUI.Button(new Rect(10,250,100,30), "load"))
			{
//				stringToEdit=Class1.XMLRead("init","anglecam",0);
//				StringToEdit2=Class1.XMLRead("init","anglekin",0);
				stringToEdit3=Class1.XMLRead("init","height",0);
				tempV.x = float.Parse( Class1.XMLRead("init","postionx",0));
				tempV.y = float.Parse( Class1.XMLRead("init","postiony",0));
//				tempV.z = float.Parse( Class1.XMLRead("init","postionz",0));
//				stringtoedit4 = Class1.XMLRead("init","Rate",0);
				stringtodeit5 = Class1.XMLRead("init","stopfloat",0);
//				dragobj.transform.localPosition = tempV;
//				kinectAngle=long.Parse(stringToEdit);
				//NativeMethods.NuiCameraSetAngle(kinectAngle);
//				StringToEdit2 = dragobj.transform.rotation.eulerAngles.x.ToString();
				//dragobj.transform.Rotate(float.Parse(StringToEdit2),0,0,Space.World);
				Wts.buttonheight = float.Parse(stringToEdit3);
//				GP.Rate = float.Parse( stringtoedit4);
				kpc.Stopfloat= float.Parse( stringtodeit5);
			}
		}
	}

 
}
