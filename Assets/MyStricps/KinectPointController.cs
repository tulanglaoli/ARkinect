/*
 * KinectModelController.cs - Moves every 'bone' given to match
 * 				the position of the corresponding bone given by
 * 				the kinect. Useful for viewing the point tracking
 * 				in 3D.
 * 
 * 		Developed by Peter Kinney -- 6/30/2011
 * 
 */

using UnityEngine;
using System;
using System.Collections;


public class KinectPointController : MonoBehaviour {
	
	//Assignments for a bitmask to control which bones to look at and which to ignore
	public enum BoneMask
	{
		None = 0x0,
		Hip_Center = 0x1,
		Spine = 0x2,
		Shoulder_Center = 0x4,
		Head = 0x8,
		Shoulder_Left = 0x10,
		Elbow_Left = 0x20,
		Wrist_Left = 0x40,
		Hand_Left = 0x80,
		Shoulder_Right = 0x100,
		Elbow_Right = 0x200,
		Wrist_Right = 0x400,
		Hand_Right = 0x800,
		Hip_Left = 0x1000,
		Knee_Left = 0x2000,
		Ankle_Left = 0x4000,
		Foot_Left = 0x8000,
		Hip_Right = 0x10000,
		Knee_Right = 0x20000,
		Ankle_Right = 0x40000,
		Foot_Right = 0x80000,
		All = 0xFFFFF,
		Torso = 0x10000F, //the leading bit is used to force the ordering in the editor
		Left_Arm = 0x1000F0,
		Right_Arm = 0x100F00,
		Left_Leg = 0x10F000,
		Right_Leg = 0x1F0000,
		R_Arm_Chest = Right_Arm | Spine,
		No_Feet = All & ~(Foot_Left | Foot_Right)
	}
	
	///public SkeletonWrapper sw;
	
	public GameObject Hip_Center;
	public GameObject Spine;
	public GameObject Shoulder_Center;
	public GameObject Head;
	public GameObject Shoulder_Left;
	public GameObject Elbow_Left;
	public GameObject Wrist_Left;
	public GameObject Hand_Left;
	public GameObject Shoulder_Right;
	public GameObject Elbow_Right;
	public GameObject Wrist_Right;
	public GameObject Hand_Right;
	public GameObject Hip_Left;
	public GameObject Knee_Left;
	public GameObject Ankle_Left;
	public GameObject Foot_Left;
	public GameObject Hip_Right;
	public GameObject Knee_Right;
	public GameObject Ankle_Right;
	public GameObject Foot_Right;
	public Camera Maincamera; 
	public GameObject Car;
	public  GameObject Point;
	public GameObject GetDebugPlane;
	public GUITexture Gui;
	public GUITexture Guihand;
	private GameObject[] _bones; //internal handle for the bones of the model
	//private Vector4[] _bonePos; //internal handle for the bone positions from the kinect
	
	public int player;
	public BoneMask Mask = BoneMask.All;
	 dragmouse tempdrag;
	public GUITexture guge;
	MyKinectManager MkM;
	// Use this for initialization
	void Start () {
		//store bones in a list for easier access
		///Kinect.NuiSkeletonPositionIndex.Count
		_bones = new GameObject[(int)20] {Hip_Center, Spine, Shoulder_Center, Head,
			Shoulder_Left, Elbow_Left, Wrist_Left, Hand_Left,
			Shoulder_Right, Elbow_Right, Wrist_Right, Hand_Right,
			Hip_Left, Knee_Left, Ankle_Left, Foot_Left,
			Hip_Right, Knee_Right, Ankle_Right, Foot_Right};
		//_bonePos = new Vector4[(int)BoneIndex.Num_Bones];
		GP=(GetPostion)(Car.GetComponent<GetPostion>());//Car.GetComponent("GetPostion")
		WS=(WtoStest)(Point.GetComponent<WtoStest>());//Point.GetComponent("WtoStest")
        TimeCount = 0;
		GP.a = 1;
		WS.A=1;
		tempdrag = (dragmouse)GetDebugPlane.GetComponent<dragmouse>();//GameObject.GetComponent<T>()GetComponent("dragmouse")
		MkM = (MyKinectManager)Maincamera.GetComponent<MyKinectManager> ();
		moverange = new Vector2 (1,3);
	}
	
	// Update is called once per frame
	Vector3 Temp;
	Vector3 ScreenVector;
	float TimeCount;
	Vector3 LastVector;
	GetPostion GP;
	WtoStest WS;
	Vector3 bones0Vector;
	bool IsChangePlayer=false;
//	Vector3 ChangeBones;
//	Vector3 LastBones;
//	bool InitChangeBones=false;
	float ChangePlayerTimeCount=0;
	public bool IsEnabled = false;
	Vector3 screenPos;
	bool IsIndebug=false;
	bool Iscarsuoxiao = false;
	public float Maxdis = 0f;
	public WtoStest WtS;
	public float Stopfloat;
	public Vector2 moverange;
	void Update () {
        
		if(tempdrag.ReturnDebug()==1)
		{
			IsIndebug=true;
			guge.transform.localPosition = new Vector3(0.892f,0.108f,0);
			
		}
		else
		{
			IsIndebug = false;
			guge.transform.localPosition = new Vector3(-0.982f,0.108f,0);
		}
		
		//如果一秒内，都没有数据，说明绝对没有人，绑定结束，吧模型和鼠标放到看不到的地方，背景打开
		if(TimeCount >2)
			{
			MkM.BeenTopeople = false;

			GP.a = 1;
			WS.A=1;
			
				//Car.transform.localPosition = new Vector3(0,0.08f,1.25f);
			if(Iscarsuoxiao==true)
			{
				WtS.init();
				Car.GetComponent<Animation>().Play("senssuoxiao");//GetComponent<Animation>() 
				//Car.transform.localScale.Set (0,0,0);
				Iscarsuoxiao =false;
			}
			Point.transform.position= new Vector3(-1,-1,-1);
			Gui.enabled = true;
			Guihand.enabled = true;
			IsEnabled=false;
			
			}
		//否则背景不打开
		Vector3 tempscreenpos = Maincamera.WorldToScreenPoint(_bones[1].transform.position);
		Debug.Log (MkM.returnZ () < moverange.x || MkM.returnZ () > moverange.y);
		//如果上一次的骨骼位置没有发生变化，说明可能没有人，开始TimeCount计时
        //if ((_bones[6].transform.position ==LastVector)||(_bones[7].transform.position.y<_bones[1].transform.position.y+Stopfloat &&_bones[11].transform.position.y<_bones[1].transform.position.y+Stopfloat)||_bones[1].transform.localPosition.z>Maxdis)//||!(ScreenVector.x>Maincamera.pixelWidth*0.3&&ScreenVector.x<Maincamera.pixelWidth*0.7&&ScreenVector.y>Maincamera.pixelHeight*0.3&&ScreenVector.y<Maincamera.pixelHeight*0.7))
		if(Maincamera.GetComponent<MyKinectManager>().IsUserGet()==0||
		   (Maincamera.GetComponent<MyKinectManager>().IsUserGet()>0&&
		 ((tempscreenpos.x<Maincamera.pixelWidth*0.2||tempscreenpos.x>Maincamera.pixelWidth*0.8)
		 ||(MkM.angle_left()<12f+Stopfloat&&MkM.angle_Right()<12f+Stopfloat)||//_bones[7].transform.position.y<_bones[12].transform.position.y+Stopfloat&&_bones[11].transform.position.y<_bones[16].transform.position.y+Stopfloat
		 (MkM.returnZ()<moverange.x||MkM.returnZ()>moverange.y))))
		{

            TimeCount += Time.deltaTime;
			//Debug.Log(TimeCount+":"+Maincamera.GetComponent<MyKinectManager>().IsUserGet());
            
        }
		//否则说明有人，TimeCount清零，模型开始绑定到手上
        else
        {
			
			if(IsEnabled ==true)
			{
				WtS.initbutton();
	            GP.a = 0;
	            WS.A = 0;
				Gui.enabled = false;
				Guihand.enabled = false;
				Iscarsuoxiao=true;
				Car.transform.localScale.Set (0.71f,0.71f,0.71f);
			}
			
            TimeCount = 0;
			//Debug.Log(TimeCount+":"+Maincamera.GetComponent<MyKinectManager>().IsUserGet());
        }
		//记录下上这次的模型骨骼坐标，作为下一次比较的对象
		LastVector = _bones[6].transform.position;
        //Debug.Log("LastVector:" + LastVector+">>>>TimeCount:" + TimeCount);
		//update all of the bones positions

        ///if (sw.pollSkeleton())
        {
			//如果模型绑定关闭，说明某个player上没有识别到人，ChangePlayerTimeCount开始计时
          	  if (GP.a == 1)
            {
//				ChangePlayerTimeCount+=Time.deltaTime;
				//如果超过0.5秒没有人则把识别对象换成另一个玩家（0.5秒是为了保证不出现两个模型相互切换导致的上面骨骼位置判断有问题）
//				if(ChangePlayerTimeCount>0.5)
//				{
//				 if (player == 0)
//					{
//	                    player = 1;
//					}
//	                else 
//					{
//	                    player = 0;
//						
//					}
//					//同时直接更新LastVector
//				IsChangePlayer=true;
//					ChangePlayerTimeCount=0;
//				}
				//先判断切换后的player是否会动
//				if(IsChangePlayer==false)
//				{
//					if(InitChangeBones=false)
//					{
//						InitChangeBones=true;
//						 if (player == 0)
//							ChangeBones = new Vector3(sw.bonePos[1, 0].x, sw.bonePos[1, 0].y, -sw.bonePos[1, 0].z);
//						else 
//							ChangeBones = new Vector3(sw.bonePos[0, 0].x, sw.bonePos[0, 0].y, -sw.bonePos[0, 0].z);
//					}
//					else
//					{
//						 if (player == 0)
//							LastBones = new Vector3(sw.bonePos[1, 0].x, sw.bonePos[1, 0].y, -sw.bonePos[1, 0].z);
//						else 
//							LastBones = new Vector3(sw.bonePos[0, 0].x, sw.bonePos[0, 0].y, -sw.bonePos[0, 0].z);
//						if( LastBones !=ChangeBones)
//						{
//							IsChangePlayer = true;
//						}
//						InitChangeBones = false;
//					}
//				}
//				else
//				{
//	                if (player == 0)
//					{
//	                    player = 1;
//						//IsChangePlayer=false;
//						
//					}
//	                else 
//					{
//	                    player = 0;
//						//IsChangePlayer=false;
//						
//					}
//				}
            }
			//Temp = new Vector3(sw.bonePos[player, 0].x, sw.bonePos[player, 0].y, -sw.bonePos[player, 0].z);
			 //ScreenVector = Maincamera.WorldToScreenPoint(Temp);
			//if(ScreenVector.x>Maincamera.pixelWidth*0.3&&ScreenVector.x<Maincamera.pixelWidth*0.7&&ScreenVector.y>Maincamera.pixelHeight*0.3&&ScreenVector.y<Maincamera.pixelHeight*0.7)
            
			for (int ii = 0; ii < (int)20/*Kinect.NuiSkeletonPositionIndex.Count*/; ii++)
            {
                //_bonePos[ii] = sw.getBonePos(ii);
                if (((uint)Mask & (uint)(1 << ii)) > 0)//&& (ii==0||ii == 6 || ii == 7 || ii == 10 || ii == 11))
                {
                    
                    ///_bones[ii].transform.localPosition =Vector3.Lerp( Temp,new Vector3(sw.bonePos[player, ii].x, sw.bonePos[player, ii].y, -sw.bonePos[player, ii].z),0.1f);
					///Temp = new Vector3(sw.bonePos[player, ii].x, sw.bonePos[player, ii].y, -sw.bonePos[player, ii].z);
					//说明出现了人员切换，所以直接把LastVector更新
///					if(IsChangePlayer==true&&ii==6)
///				{
///						LastVector =_bones[ii].transform.position;
///						IsChangePlayer=false;
///				}
					if(IsEnabled == false)
						if(ii==7||ii==11)
						{
							screenPos = Maincamera.WorldToScreenPoint(_bones[ii].transform.position);
//						    Debug.Log(screenPos.ToString());
							if(screenPos.x>Maincamera.pixelWidth*0.4&&screenPos.x<Maincamera.pixelWidth*0.6&&screenPos.y>Maincamera.pixelHeight*0.55&&screenPos.y<Maincamera.pixelHeight*0.7)
							{
								MkM.BeenTopeople = true;
								IsEnabled = true;
							}
						}
					if(IsIndebug==true)
						_bones[ii].GetComponent<Renderer>().enabled = true;
					else
						_bones[ii].GetComponent<Renderer>().enabled = false;
                }
            }
        }
	}
	public int returnPlayer()
	{
		return player;
	}

	
	void OnGUI()
	{
		//GUI.Box(new Rect(0.4f*Maincamera.pixelWidth,0.30f*Maincamera.pixelHeight,0.2f*Maincamera.pixelWidth,0.15f*Maincamera.pixelHeight),"Button");
	}
}
