using UnityEngine;
using System.Collections;
using Depthdeep;

public class WtoStest : MonoBehaviour {
	public float buttonheight=0;
		int a=0;
	int b=0;
	int c=0;
	int d=0;
	int e=0;
	int f=0;
	public GameObject len01;
	public GameObject len02;
	public GameObject carRotate;
	public GameObject sen01;
	public GameObject sen02;
	public GameObject lu;
	public GameObject tempGUI ;
	public GameObject changecolor;
	public GameObject road;
	public GameObject road2;

	GameObject tempGUI2;
	buttonani[] bani = new buttonani[6];
	public GameObject Car;
	GetPostion carpostion;
	public GameObject GUGEhand;
	MyKinectManager mkm;
	// Use this for initialization
	void Start () {
		
		sen01. transform.localScale = new Vector3(0.0F, 0.00f, 0.00f);
		mkm = cameraA.GetComponent<MyKinectManager> ();
//		go=ListTexture[1];
//		light=ListTexture[3];
//		rotate =ListTexture[5];
//		sen =ListTexture[7];
//		ButtonTexture[0].texture = ListTexture[1];
//		ButtonTexture[1].texture = ListTexture[3];
//		ButtonTexture[2].texture = ListTexture[4];
//		ButtonTexture[3].texture = ListTexture[6];
		//ButtonTexture[4].texture = ListTexture[6];
		ButtonPostion = new Vector3[6];
		ButtonPostion[0]=new Vector3(cameraA.pixelWidth*0.1f,cameraA.pixelHeight*(0.70f-buttonheight),1f);
		ButtonPostion[1]=new Vector3(cameraA.pixelWidth*0.2f,cameraA.pixelHeight*(0.83f-buttonheight),1f);
		ButtonPostion[5]=new Vector3(cameraA.pixelWidth*0.38f,cameraA.pixelHeight*(0.90f-buttonheight),1f);
		ButtonPostion[3]=new Vector3(cameraA.pixelWidth*0.62f,cameraA.pixelHeight*(0.90f-buttonheight),1f);
		ButtonPostion[4]=new Vector3(cameraA.pixelWidth*0.8f,cameraA.pixelHeight*(0.83f-buttonheight),1f);
		ButtonPostion[2]=new Vector3(cameraA.pixelWidth*0.9f,cameraA.pixelHeight*(0.70f-buttonheight),1f);
		
		chelun01.GetComponent<Animation>() .Stop ();
		chelun02.GetComponent<Animation>() .Stop ();
		lu.GetComponent<Animation>().Stop("lu");
		len01.active=false ;
		len02.active=false ;
		c=2;
		bani[0]= (buttonani)(ButtonTexture[0].GetComponent<buttonani>());
		bani[1]=(buttonani)(ButtonTexture[1].GetComponent<buttonani>());
		bani[2]=(buttonani)(ButtonTexture[2].GetComponent<buttonani>());
		bani[3]=(buttonani)(ButtonTexture[3].GetComponent<buttonani>());
		bani[4]=(buttonani)(ButtonTexture[4].GetComponent<buttonani>());
		bani[5]=(buttonani)(ButtonTexture[5].GetComponent<buttonani>());
		bani[0].init();
		bani[1].init();
		bani[2].init();
		bani[3].init();
		bani[4].init();
		bani[5].init();
		ButtonTexture[3].GetComponent<GUITexture>().texture= sens01texture;
		Tempchangecolor=(changecolor)changecolor.GetComponent<changecolor>();
		ButtonTexture[5].transform.localPosition = new Vector3(0.1f,(0.70f-buttonheight),1f);
		ButtonTexture[1].transform.localPosition = new Vector3(0.1f,(0.70f-buttonheight),1f);;
		ButtonTexture[0].transform.localPosition = new Vector3(0.28f,(0.83f-buttonheight),1f);;
		ButtonTexture[3].transform.localPosition = new Vector3(0.5f,(0.90f-buttonheight),1f);;
		ButtonTexture[4].transform.localPosition = new Vector3(0.72f,(0.83f-buttonheight),1f);;
		ButtonTexture[2].transform.localPosition = new Vector3(0.9f,(0.70f-buttonheight),1f);;
		carpostion = (GetPostion)Car.GetComponent<GetPostion>();
		ButtonTexture[5].GetComponent<GUITexture>().texture= sens01texture;
	}
	////原始顺序015342
	public void init()
	{
		//buttonweizhi
		ButtonPostion[5]=new Vector3(cameraA.pixelWidth*0.1f,cameraA.pixelHeight*(0.70f),1f);
		ButtonPostion[1]=new Vector3(cameraA.pixelWidth*0.1f,cameraA.pixelHeight*(0.70f),1f);
		ButtonPostion[0]=new Vector3(cameraA.pixelWidth*0.28f,cameraA.pixelHeight*(0.83f),1f);
		ButtonPostion[3]=new Vector3(cameraA.pixelWidth*0.5f,cameraA.pixelHeight*(0.90f),1f);
		ButtonPostion[4]=new Vector3(cameraA.pixelWidth*0.72f,cameraA.pixelHeight*(0.83f),1f);
		ButtonPostion[2]=new Vector3(cameraA.pixelWidth*0.9f,cameraA.pixelHeight*(0.70f),1f);
		ButtonTexture[5].transform.localPosition = new Vector3(0.1f,(0.70f),1f);
		ButtonTexture[1].transform.localPosition = new Vector3(0.1f,(0.70f),1f);;
		ButtonTexture[0].transform.localPosition = new Vector3(0.28f,(0.83f),1f);;
		ButtonTexture[3].transform.localPosition = new Vector3(0.5f,(0.90f),1f);;
		ButtonTexture[4].transform.localPosition = new Vector3(0.72f,(0.83f),1f);;
		ButtonTexture[2].transform.localPosition = new Vector3(0.9f,(0.70f),1f);;
		bani[0].init();
		bani[1].init();
		bani[2].init();
		bani[3].init();
		bani[4].init();
		bani[5].init();
		

		chelun01.GetComponent<Animation>() .Stop ();
		chelun02.GetComponent<Animation>() .Stop ();
		lu.GetComponent<Animation>().Stop("lu");
		road.GetComponent<Renderer>().enabled = false;
		road2.GetComponent<Renderer>().enabled = false;
		lu.GetComponent<Renderer>().enabled = false;
				//road.gameObject.SetActive(false);
				IsAni[0]=false;
		ButtonTexture[0].GetComponent<Animation>().Play();
		

		len01.active=false ;
				len02.active=false ;
				//light =ListTexture[3];
				//ButtonTexture[1].texture = ListTexture[3];
		ButtonTexture[1].GetComponent<Animation>().Play();
				IsAni[1]=false;
		

		CarIsrotate = false;
				//carRotate.animation.Stop();
				//rotate  =ListTexture[5];
				//ButtonTexture[2].texture = ListTexture[5];
		ButtonTexture[2].GetComponent<Animation>().Play();
				IsAni[2]=false;
		
//			if(IsAni[3]==true)
//		{
//		sen01.animation .Play ("fanda");
//				sen02.animation .Play ("suoxiao");
//				//sen=ListTexture[7];
//				//ButtonTexture[3].texture = ListTexture[7];
		ButtonTexture[3].GetComponent<Animation>().Play();
//					IsAni[3]=true;
//					IschangeSens=true;
//					ButtonTexture[0].guiTexture.texture= sens01texture;
//					ButtonTexture[1].guiTexture.texture= sens01texture;
//					//ButtonTexture[2].guiTexture.texture= sens01texture;
//					//ButtonTexture[3].guiTexture.texture= sens01texture;
//					ButtonTexture[4].guiTexture.texture= sens01texture;
//					ButtonTexture[3].guiTexture.texture= sens01texture;
//		}

		Tempchangecolor.IsChangecolor = 2;
			//	ButtonTexture[4].animation.Play();
				//CarIsrotate = true;
				//rotate  =ListTexture[5];
				//ButtonTexture[2].texture = ListTexture[5];
		ButtonTexture[4].GetComponent<Animation>().Play();
				IsAni[4]=false;
		
		

		//sen01.animation .Play ("suoxiao");
			//	sen02.animation .Play ("fanda");
				//sen=ListTexture[6];
				//ButtonTexture[3].texture = ListTexture[6];
		ButtonTexture[5].GetComponent<Animation>().Play();
					IsAni[5]=false;
					IschangeSens=false;
					bani[0].updatebutton();
					bani[1].updatebutton();
					bani[2].updatebutton();
					bani[3].updatebutton();
					bani[4].updatebutton();
		ButtonTexture[5]. GetComponent<GUITexture>().texture= sens01texture;
		
		
		
	}
	
	float tempy;
	public void initbutton()
	{
		
		tempy = cameraA.WorldToScreenPoint(ReturnHumanPostion()).y/cameraA.pixelHeight;
		if(IschangeSens){//015342
		ButtonPostion[0]= new Vector3(cameraA.pixelWidth*0.1f,cameraA.pixelHeight*(0.00f-buttonheight+tempy),1f);
		ButtonPostion[1]=new Vector3(cameraA.pixelWidth*0.2f,cameraA.pixelHeight*(0.13f-buttonheight+tempy),1f);
		ButtonPostion[5]=new Vector3(cameraA.pixelWidth*0.38f,cameraA.pixelHeight*(0.2f-buttonheight+tempy),1f);
		ButtonPostion[2]=new Vector3(cameraA.pixelWidth*0.62f,cameraA.pixelHeight*(0.2f-buttonheight+tempy),1f);
		ButtonPostion[4]=new Vector3(cameraA.pixelWidth*0.8f,cameraA.pixelHeight*(0.13f-buttonheight+tempy),1f);
		ButtonPostion[3]=new Vector3(cameraA.pixelWidth*0.9f,cameraA.pixelHeight*(0.00f-buttonheight+tempy),1f);
		ButtonTexture[0].transform.localPosition =Vector3.Lerp(ButtonTexture[0].transform.localPosition ,new Vector3(0.1f,(0.00f-buttonheight+tempy),1f),0.1f);
		ButtonTexture[1].transform.localPosition =Vector3.Lerp(ButtonTexture[1].transform.localPosition , new Vector3(0.2f,(0.13f-buttonheight+tempy),1f),0.1f);
		ButtonTexture[5].transform.localPosition =Vector3.Lerp(ButtonTexture[5].transform.localPosition , new Vector3(0.38f,(0.2f-buttonheight+tempy),1f),0.1f);
		ButtonTexture[2].transform.localPosition =Vector3.Lerp(ButtonTexture[2].transform.localPosition ,new Vector3(0.62f,(0.2f-buttonheight+tempy),1f),0.1f);
		ButtonTexture[4].transform.localPosition =Vector3.Lerp(ButtonTexture[4].transform.localPosition , new Vector3(0.8f,(0.13f-buttonheight+tempy),1f),0.1f);
		ButtonTexture[3].transform.localPosition =Vector3.Lerp(ButtonTexture[3].transform.localPosition , new Vector3(0.9f,(0.00f-buttonheight+tempy),1f),0.1f);
		}
		else{
			ButtonPostion[5]= new Vector3(cameraA.pixelWidth*0.1f,cameraA.pixelHeight*(0.00f-buttonheight+tempy),1f);
			ButtonPostion[1]=new Vector3(cameraA.pixelWidth*0.1f,cameraA.pixelHeight*(0.00f-buttonheight+tempy),1f);
			ButtonPostion[0]=new Vector3(cameraA.pixelWidth*0.28f,cameraA.pixelHeight*(0.13f-buttonheight+tempy),1f);
			ButtonPostion[3]=new Vector3(cameraA.pixelWidth*0.5f,cameraA.pixelHeight*(0.2f-buttonheight+tempy),1f);
			ButtonPostion[4]=new Vector3(cameraA.pixelWidth*0.72f,cameraA.pixelHeight*(0.13f-buttonheight+tempy),1f);
			ButtonPostion[2]=new Vector3(cameraA.pixelWidth*0.9f,cameraA.pixelHeight*(0.00f-buttonheight+tempy),1f);
			ButtonTexture[5].transform.localPosition =Vector3.Lerp(ButtonTexture[5].transform.localPosition ,new Vector3(0.1f,(0.00f-buttonheight+tempy),1f),0.1f);
			ButtonTexture[1].transform.localPosition =Vector3.Lerp(ButtonTexture[1].transform.localPosition , new Vector3(0.1f,(0.00f-buttonheight+tempy),1f),0.1f);
			ButtonTexture[0].transform.localPosition =Vector3.Lerp(ButtonTexture[0].transform.localPosition , new Vector3(0.28f,(0.13f-buttonheight+tempy),1f),0.1f);
			ButtonTexture[3].transform.localPosition =Vector3.Lerp(ButtonTexture[3].transform.localPosition ,new Vector3(0.5f,(0.2f-buttonheight+tempy),1f),0.1f);
			ButtonTexture[4].transform.localPosition =Vector3.Lerp(ButtonTexture[4].transform.localPosition , new Vector3(0.72f,(0.13f-buttonheight+tempy),1f),0.1f);
			ButtonTexture[2].transform.localPosition =Vector3.Lerp(ButtonTexture[2].transform.localPosition , new Vector3(0.9f,(0.00f-buttonheight+tempy),1f),0.1f);
		}
//		ButtonPostion[0]= Vector3.Lerp(ButtonPostion[0],new Vector3(cameraA.pixelWidth*0.1f,cameraA.pixelHeight*(0.00f-buttonheight+tempy),1f),0.9f);
//		ButtonPostion[1]=Vector3.Lerp(ButtonPostion[1],new Vector3(cameraA.pixelWidth*0.3f,cameraA.pixelHeight*(0.07f-buttonheight+tempy),1f),0.9f);
//		ButtonPostion[2]=Vector3.Lerp(ButtonPostion[2],new Vector3(cameraA.pixelWidth*0.5f,cameraA.pixelHeight*(0.11f-buttonheight+tempy),1f),0.9f);
//		ButtonPostion[3]=Vector3.Lerp(ButtonPostion[3],new Vector3(cameraA.pixelWidth*0.7f,cameraA.pixelHeight*(0.07f-buttonheight+tempy),1f),0.9f);
//		ButtonPostion[4]=Vector3.Lerp(ButtonPostion[4],new Vector3(cameraA.pixelWidth*0.9f,cameraA.pixelHeight*(0.00f-buttonheight+tempy),1f),0.9f);
//		ButtonTexture[0].transform.localPosition =  Vector3.Lerp(ButtonPostion[0],new Vector3(0.1f,(0.00f-buttonheight+tempy),1f),0.9f);
//		ButtonTexture[1].transform.localPosition = Vector3.Lerp(ButtonPostion[1],new Vector3(0.3f,(0.07f-buttonheight+tempy),1f),0.9f);
//		ButtonTexture[2].transform.localPosition = Vector3.Lerp(ButtonPostion[2],new Vector3(0.5f,(0.11f-buttonheight+tempy),1f),0.9f);
//		ButtonTexture[3].transform.localPosition = Vector3.Lerp(ButtonPostion[3],new Vector3(0.7f,(0.07f-buttonheight+tempy),1f),0.9f);
//		ButtonTexture[4].transform.localPosition = Vector3.Lerp(ButtonPostion[4],new Vector3(0.9f,(0.00f-buttonheight+tempy),1f),0.9f);
	}
	
	// Update is called once per frame
	public GameObject[] WorldObject;

	public Camera cameraA;
	Vector3 screenPos;
	Vector3 screenpix;
	//public Texture2D[] ListTexture = new Texture2D[8];
	public GameObject chelun01;
	public GameObject chelun02;
	public int A;
	public GUITexture[] ButtonTexture = new GUITexture[6];
	bool CarIsrotate = false;
	bool IsXIfu=false;
	bool isinpostion=true;
     void Update() {
		if(A==0)
		{
			screenPos = cameraA.WorldToScreenPoint(WorldObject[carpostion.index].transform.position);

		screenpix.Set(screenPos.x/cameraA.pixelWidth,screenPos.y/cameraA.pixelHeight,2);
			if( isinpostion==true)
			{
		this.transform.position = screenpix;
			}
		}
		Penzhuan();
		
		if (CarIsrotate==true){
		carRotate.transform.Rotate(Vector3.up, Time.deltaTime*30, Space.World);
		}
		
    }

	
	Vector3[] ButtonPostion;
	private changecolor Tempchangecolor;
	bool[] IsAni = new bool[6]{false,false,false,false,false,false};
	bool IschangeSens=false;
	public Texture2D sens01texture;
	public float Maxdis=0.08f;//banjin
	void Penzhuan(){
		//车轮自传****************************************************************************************************************************************
		//if (screenPos.x>cameraA.pixelWidth*0.5&&screenPos.x<cameraA.pixelWidth*0.6&&screenPos.y>cameraA.pixelHeight*0.84&&screenPos.y<cameraA.pixelHeight*0.97)
			if(Vector3.Distance(screenPos,ButtonPostion[0])<cameraA.pixelWidth*Maxdis&&IschangeSens==false)
			{
			isinpostion = false;
			
			//this.transform.position.Set (ButtonPostion[0].x,ButtonPostion[0].y,2f);
			if(a==0)
			{
				a=1;
				if(bani[0].i==0)
				bani[0].i=1;
			}
			if(a==2)
			{
				a=3;
				if(bani[0].i==0)
				bani[0].i=1;
			}
			if(bani[0].updatebutton())
				if(IsAni[0]==false)
			{
				chelun01.GetComponent<Animation>().Play ();
				chelun02.GetComponent<Animation>() .Play ();
				lu.GetComponent<Animation>().Play("lu");
				road.GetComponent<Renderer>().enabled = true;
				road2.GetComponent<Renderer>().enabled = true;
				lu.GetComponent<Renderer>().enabled = true;
				IsAni[0]=true;
				
				//go=ListTexture[0];
				//ButtonTexture[0].texture = ListTexture[0];
				ButtonTexture[0].GetComponent<Animation>().Play("weel");
			}
			else if(IsAni[0]==true)
			{
				chelun01.GetComponent<Animation>() .Stop ();
				chelun02.GetComponent<Animation>() .Stop ();
				lu.GetComponent<Animation>().Stop("lu");
				road.GetComponent<Renderer>().enabled = false;
				road2.GetComponent<Renderer>().enabled = false;
				lu.GetComponent<Renderer>().enabled = false;
				//road.gameObject.SetActive(false);
				IsAni[0]=false;
				
				
				//go=ListTexture[1];
				//ButtonTexture[0].texture = ListTexture[1];
				ButtonTexture[0].GetComponent<Animation>().Play("weel");
			}
			this.transform.position =new Vector3(ButtonPostion[0].x/cameraA.pixelWidth,ButtonPostion[0].y/cameraA.pixelHeight,2f);
			;
			}
		
		
		//if (screenPos.x<cameraA.pixelWidth*0.5||screenPos.x>cameraA.pixelWidth*0.6||screenPos.y<cameraA.pixelHeight*0.84||screenPos.y>cameraA.pixelHeight*0.97)
		if(Vector3.Distance(screenPos,ButtonPostion[0])>cameraA.pixelWidth*Maxdis&&IschangeSens==false)
		{
			isinpostion = true;
			bani[0].updatebutton2();
			if(a==1)
			{
				a=2;
			}
			if(a==3)
			{
				a=0;
			}
		}
		
		
		//车灯开关****************************************************************************************************************************************
		//if (screenPos.x>cameraA.pixelWidth*0.61&&screenPos.x<cameraA.pixelWidth*0.71&&screenPos.y>cameraA.pixelHeight*0.84&&screenPos.y<cameraA.pixelHeight*0.97){
		if(Vector3.Distance(screenPos,ButtonPostion[1])<cameraA.pixelWidth*Maxdis&&IschangeSens==false)
		{
			isinpostion = false;
			//this.transform.position = ButtonPostion[1];
			
			//this.transform.position.Set (ButtonPostion[1].x,ButtonPostion[1].y,2f);
			if (b==0){
				
				b=1;
				if(bani[1].i==0)
				bani[1].i=1;
			}
			if (b==2){
				
				b=3;
				if(bani[1].i==0)
				bani[1].i=1;
			}
			
			if(bani[1].updatebutton())
				if(IsAni[1]==false)
			{
				len01.active=true  ;
				len02.active=true  ;
				//light=ListTexture[2];
				//ButtonTexture[1].texture = ListTexture[2];
				ButtonTexture[1].GetComponent<Animation>().Play("light");
				IsAni[1]=true;
			}
			else if(IsAni[1]==true)
			{
				len01.active=false ;
				len02.active=false ;
				//light =ListTexture[3];
				//ButtonTexture[1].texture = ListTexture[3];
				ButtonTexture[1].GetComponent<Animation>().Play("light");
				IsAni[1]=false;
			}
			this.transform.position =new Vector3(ButtonPostion[1].x/cameraA.pixelWidth,ButtonPostion[1].y/cameraA.pixelHeight,2f);
		}
		//if (screenPos.x<cameraA.pixelWidth*0.61||screenPos.x>cameraA.pixelWidth*0.71||screenPos.y<cameraA.pixelHeight*0.84||screenPos.y>cameraA.pixelHeight*0.97)
		if(Vector3.Distance(screenPos,ButtonPostion[1])>cameraA.pixelWidth*Maxdis&&IschangeSens==false)
		{
			isinpostion = true;
			bani[1].updatebutton2();
			if(b==1)
			{
				b=2;
			}
			if(b==3)
			{
				b=0;
			}
		}
		//车身自传****************************************************************************************************************************************
		//if (screenPos.x>cameraA.pixelWidth*0.72&&screenPos.x<cameraA.pixelWidth*0.82&&screenPos.y>cameraA.pixelHeight*0.84&&screenPos.y<cameraA.pixelHeight*0.97)
		if(Vector3.Distance(screenPos,ButtonPostion[2])<cameraA.pixelWidth*Maxdis)//&&IschangeSens==false)
		{
			isinpostion = false;
			//this.transform.position = ButtonPostion[2];
			
			//this.transform.position.Set (ButtonPostion[2].x,ButtonPostion[2].y,2f);
			if (c==0){
				
				c=1;
				if(bani[2].i==0)
				bani[2].i=1;
			}
			if (c==2){
				
				c=3;
				if(bani[2].i==0)
				bani[2].i=1;
			}
			
			if(bani[2].updatebutton())
			if(IsAni[2]==false)
			{
				CarIsrotate = true;
				//carRotate.animation.Play();
				//rotate  =ListTexture[4];
				//ButtonTexture[2].texture = ListTexture[4];
				ButtonTexture[2].GetComponent<Animation>().Play("rotate");
				IsAni[2]=true;
			}
			else if(IsAni[2]==true)
			{
				CarIsrotate = false;
				//carRotate.animation.Stop();
				//rotate  =ListTexture[5];
				//ButtonTexture[2].texture = ListTexture[5];
				ButtonTexture[2].GetComponent<Animation>().Play("rotate");
				IsAni[2]=false;
			}
			this.transform.position =new Vector3(ButtonPostion[2].x/cameraA.pixelWidth,ButtonPostion[2].y/cameraA.pixelHeight,2f);
			
		}
		//if (screenPos.x<cameraA.pixelWidth*0.72||screenPos.x>cameraA.pixelWidth*0.82||screenPos.y<cameraA.pixelHeight*0.84||screenPos.y>cameraA.pixelHeight*0.97)
		if(Vector3.Distance(screenPos,ButtonPostion[2])>cameraA.pixelWidth*Maxdis)//&&IschangeSens==false)
		{
			isinpostion = true;
			bani[2].updatebutton2();
			if(c==1)
			{
				c=2;
				//CarIsrotate = false;
			}
			if(c==3)
			{
				c=0;
				//CarIsrotate = true;
			}
		}
		
		//场景切换1****************************************************************************************************************************************
		
		//if (screenPos.x>cameraA.pixelWidth*0.83&&screenPos.x<cameraA.pixelWidth*0.93&&screenPos.y>cameraA.pixelHeight*0.84&&screenPos.y<cameraA.pixelHeight*0.97)
		if(Vector3.Distance(screenPos,ButtonPostion[3])<cameraA.pixelWidth*Maxdis&&IschangeSens==false)
		{
			isinpostion = false;
			//this.transform.position = ButtonPostion[3];
			
			//this.transform.position.Set (ButtonPostion[3].x,ButtonPostion[3].y,2f);
			if (d==0){
				
				d=1;
				if(bani[3].i==0)
				bani[3].i=1;
			}
			if (d==2){
				
				d=3;
				if(bani[3].i==0)
				bani[3].i=1;
			}
			if(bani[3].updatebutton())
			{
				if(IsAni[3]==false)
			{
					sen01.GetComponent<Animation>().Play ("fanda");
					sen02.GetComponent<Animation>().Play ("suoxiao");
				//sen=ListTexture[7];
				//ButtonTexture[3].texture = ListTexture[7];
					ButtonTexture[3].GetComponent<Animation>().Play();
					IsAni[3]=true;
					IschangeSens=true;
					ButtonTexture[0].GetComponent<GUITexture>().texture= sens01texture;
					ButtonTexture[1].GetComponent<GUITexture>().texture= sens01texture;
					//ButtonTexture[2].guiTexture.texture= sens01texture;
					//ButtonTexture[3].guiTexture.texture= sens01texture;
					ButtonTexture[4].GetComponent<GUITexture>().texture= sens01texture;
					ButtonTexture[3].GetComponent<GUITexture>().texture= sens01texture;
					
			}
			else if(IsAni[3]==true)
			{
					sen01.GetComponent<Animation>() .Play ("fanda");
					sen02.GetComponent<Animation>() .Play ("suoxiao");
				//sen=ListTexture[7];
				//ButtonTexture[3].texture = ListTexture[7];
					ButtonTexture[3].GetComponent<Animation>().Play();
					IsAni[3]=true;
					IschangeSens=true;
					ButtonTexture[0].GetComponent<GUITexture>().texture= sens01texture;
					ButtonTexture[1].GetComponent<GUITexture>().texture= sens01texture;
					//ButtonTexture[2].guiTexture.texture= sens01texture;
					//ButtonTexture[3].guiTexture.texture= sens01texture;
					ButtonTexture[4].GetComponent<GUITexture>().texture= sens01texture;
					ButtonTexture[3].GetComponent<GUITexture>().texture= sens01texture;
			}
			}
			this.transform.position =new Vector3(ButtonPostion[3].x/cameraA.pixelWidth,ButtonPostion[3].y/cameraA.pixelHeight,2f);
		}
		//if (screenPos.x<cameraA.pixelWidth*0.83||screenPos.x>cameraA.pixelWidth*0.93||screenPos.y<cameraA.pixelHeight*0.84||screenPos.y>cameraA.pixelHeight*0.97)
		if(Vector3.Distance(screenPos,ButtonPostion[3])>cameraA.pixelWidth*Maxdis&&IschangeSens==false)
		{
			isinpostion = true;
			bani[3].updatebutton2();
			if(d==1)
			{
				
				d=2;
			}
			if(d==3)
			{
				
				d=0;
			}
		}
		
		//车身颜色****************************************************************************************************************************************
		//if (screenPos.x>cameraA.pixelWidth*0.72&&screenPos.x<cameraA.pixelWidth*0.82&&screenPos.y>cameraA.pixelHeight*0.84&&screenPos.y<cameraA.pixelHeight*0.97)
		if(Vector3.Distance(screenPos,ButtonPostion[4])<cameraA.pixelWidth*Maxdis&&IschangeSens==false)
		{
			isinpostion = false;
			//this.transform.position = ButtonPostion[4];
			
			//this.transform.position.Set (ButtonPostion[4].x,ButtonPostion[4].y,2f);
			if (e==0){
				
				e=1;
				if(bani[4].i==0)
				bani[4].i=1;
			}
			if (e==2){
				
				e=3;
				if(bani[4].i==0)
				bani[4].i=1;
			}
			
			if(bani[4].updatebutton())
			if(IsAni[4]==false)
			{
				 
				Tempchangecolor.IsChangecolor = 1;
				ButtonTexture[4].GetComponent<Animation>().Play();
				//CarIsrotate = false;
				//rotate  =ListTexture[4];
				//ButtonTexture[2].texture = ListTexture[4];
				//ButtonTexture[4].animation.Play("rotate");
				IsAni[4]=true;
			}
			else if(IsAni[4]==true)
			{
				
				Tempchangecolor.IsChangecolor = 2;
				ButtonTexture[4].GetComponent<Animation>().Play();
				//CarIsrotate = true;
				//rotate  =ListTexture[5];
				//ButtonTexture[2].texture = ListTexture[5];
				//ButtonTexture[4].animation.Play("rotate");
				IsAni[4]=false;
			}
			this.transform.position =new Vector3(ButtonPostion[4].x/cameraA.pixelWidth,ButtonPostion[4].y/cameraA.pixelHeight,2f);
		}
		//if (screenPos.x<cameraA.pixelWidth*0.72||screenPos.x>cameraA.pixelWidth*0.82||screenPos.y<cameraA.pixelHeight*0.84||screenPos.y>cameraA.pixelHeight*0.97)
		if(Vector3.Distance(screenPos,ButtonPostion[4])>cameraA.pixelWidth*Maxdis&&IschangeSens==false)
		{
			isinpostion = true;
			bani[4].updatebutton2();
			if(e==1)
			{
				e=2;
				//CarIsrotate = false;
			}
			if(e==3)
			{
				e=0;
				//CarIsrotate = true;
			}
		}
		
		//场景切换2****************************************************************************************************************************************
		
		//if (screenPos.x>cameraA.pixelWidth*0.83&&screenPos.x<cameraA.pixelWidth*0.93&&screenPos.y>cameraA.pixelHeight*0.84&&screenPos.y<cameraA.pixelHeight*0.97)
		if(Vector3.Distance(screenPos,ButtonPostion[5])<cameraA.pixelWidth*Maxdis&&IschangeSens==true)
		{
			isinpostion = false;
			//this.transform.position = ButtonPostion[3];
			
			//this.transform.position.Set (ButtonPostion[3].x,ButtonPostion[3].y,2f);
			if (f==0){
				
				f=1;
				if(bani[5].i==0)
				bani[5].i=1;
			}
			if (f==2){
				
				f=3;
				if(bani[5].i==0)
				bani[5].i=1;
			}
			if(bani[5].updatebutton())
			{
				if(IsAni[5]==false)
			{
					sen01.GetComponent<Animation>() .Play ("suoxiao");
					sen02.GetComponent<Animation>() .Play ("fanda");
				//sen=ListTexture[6];
				//ButtonTexture[3].texture = ListTexture[6];
					ButtonTexture[5].GetComponent<Animation>().Play();
					IsAni[5]=false;
					IschangeSens=false;
					bani[0].updatebutton();
					bani[1].updatebutton();
					bani[2].updatebutton();
					bani[3].updatebutton();
					bani[4].updatebutton();
					ButtonTexture[5].GetComponent<GUITexture>().texture= sens01texture;
					
			}
			else if(IsAni[5]==true)
			{
					sen01.GetComponent<Animation>() .Play ("suoxiao");
					sen02.GetComponent<Animation>() .Play ("fanda");
				//sen=ListTexture[6];
				//ButtonTexture[3].texture = ListTexture[6];
					ButtonTexture[5].GetComponent<Animation>().Play();
					IsAni[5]=false;
					IschangeSens=false;
					bani[0].updatebutton();
					bani[1].updatebutton();
					bani[2].updatebutton();
					bani[3].updatebutton();
					bani[4].updatebutton();
					ButtonTexture[5].GetComponent<GUITexture>().texture= sens01texture;
			}
			}
			this.transform.position =new Vector3(ButtonPostion[5].x/cameraA.pixelWidth,ButtonPostion[5].y/cameraA.pixelHeight,2f);
		}
		//if (screenPos.x<cameraA.pixelWidth*0.83||screenPos.x>cameraA.pixelWidth*0.93||screenPos.y<cameraA.pixelHeight*0.84||screenPos.y>cameraA.pixelHeight*0.97)
		if(Vector3.Distance(screenPos,ButtonPostion[5])>cameraA.pixelWidth*Maxdis&&IschangeSens==true)
		{
			isinpostion = true;
			bani[5].updatebutton2();
			if(f==1)
			{
				
				f=2;
			}
			if(f==3)
			{
				
				f=0;
			}
		}
		
	}
	
	
	
	
	 Texture2D go;
	 Texture2D light;
	 Texture2D rotate;
	 Texture2D sen;
	
	
	
	public Texture2D  kuang;
	
	void OnGUI(){
		
		
		GUI.Label(new Rect(3,1160,1080,768),kuang);
		
//		GUI.Button (new Rect(ButtonPostion[0].x,cameraA.pixelHeight-ButtonPostion[0].y,cameraA.pixelWidth*0.01f,cameraA.pixelWidth*0.01f),light);
//		GUI.Button (new Rect(ButtonPostion[1].x,cameraA.pixelHeight-ButtonPostion[1].y,cameraA.pixelWidth*0.01f,cameraA.pixelWidth*0.01f),rotate);
//		GUI.Button (new Rect(ButtonPostion[2].x,cameraA.pixelHeight-ButtonPostion[2].y,cameraA.pixelWidth*0.01f,cameraA.pixelWidth*0.01f),sen);
//		GUI.Button (new Rect(ButtonPostion[3].x,cameraA.pixelHeight-ButtonPostion[3].y,cameraA.pixelWidth*0.01f,cameraA.pixelWidth*0.01f),sen);
//		GUI.Button (new Rect(ButtonPostion[4].x,cameraA.pixelHeight-ButtonPostion[4].y,cameraA.pixelWidth*0.01f,cameraA.pixelWidth*0.01f),sen);
//		
	}

	Vector3[] ListPostion = new Vector3[10];
	int vectori=0;
	Vector3 ReturnHumanPostion()
	{
		vectori = (1+vectori);
		ListPostion [vectori%10] = Vector3Postionmean ();
		if(vectori>10)
		{
			return new Vector3((ListPostion[0].x+ListPostion[1].x+ListPostion[2].x+ListPostion[3].x+ListPostion[4].x+
			                   ListPostion[5].x+ListPostion[6].x+ListPostion[7].x+ListPostion[8].x+ListPostion[9].x)/10,
			                   (ListPostion[0].y+ListPostion[1].y+ListPostion[2].y+ListPostion[3].y+ListPostion[4].y+
			                   ListPostion[5].y+ListPostion[6].y+ListPostion[7].y+ListPostion[8].y+ListPostion[9].y)/10,
			                   (ListPostion[0].z+ListPostion[1].z+ListPostion[2].z+ListPostion[3].z+ListPostion[4].z+
			                   ListPostion[5].z+ListPostion[6].z+ListPostion[7].z+ListPostion[8].z+ListPostion[9].z)/10
			                   );
		}
		else
			return Vector3Postionmean();

	}

	Vector3 Vector3Postionmean()
	{
		return new Vector3((mkm.TestGobject[0].transform.position.x+mkm.TestGobject[1].transform.position.x
		                    +mkm.TestGobject[2].transform.position.x+mkm.TestGobject[3].transform.position.x)/4,
		                    (mkm.TestGobject[0].transform.position.y+mkm.TestGobject[1].transform.position.y
		                    +mkm.TestGobject[2].transform.position.y+mkm.TestGobject[3].transform.position.y)/4,
		                    (mkm.TestGobject[0].transform.position.z+mkm.TestGobject[1].transform.position.z
		                    +mkm.TestGobject[2].transform.position.z+mkm.TestGobject[3].transform.position.z)/4);
	}
	
	
	
}
