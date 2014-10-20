using UnityEngine;
using System.Collections;



public class control : MonoBehaviour {
	
	float  speed = 2.0f;
	Vector3 rotation = Vector3.zero;
	

	
	public GameObject chelun01;
	public GameObject chelun02;
	public GameObject len01;
	public GameObject len02;
	public GameObject carRotate;
	public GameObject lu;
	
	public GameObject sen01;
	public GameObject sen02;
	
	public ParticleSystem  lizi;
	 
	public GUISkin uiskin;
	



	
	
	
	public MovieTexture movTexture;
	
	public int m=0; // 判断生成 播放视频 按钮   0=显示                   2=隐藏
	public int l=0; // 判断生成 车灯开关 按钮   0=On      1=Off         2=隐藏
	
	public int c=0; // 判断生成 车轮转动 按钮   0=Go      1=Stop，      2=隐藏
	public int z=0; // 判断生成 车体自传 按钮   0=Rotate  1=Stop        2=隐藏
	
    public int i=0; // 判断车轮转动  当i=1时，车轮转动
	public int r=0; // 判断车体自传  当r=1时，车体自传
	public int v=0; // 判断视频播放  当v=1时，播放视频
	
	public int e=0;
	public int e2=0;
	
	public float tt=0.0f;
	void Awake() {
		lu. GetComponent<Renderer>().material.color=new Color(0.3F, 0.4F, 0.6F,0.0F);
		lizi .startSize =0.0f;
    }
	
	//初始状态*************************************************************************************
	void Start (){
		len01.active=false;
		len02.active=false;
		l=0 ;
		//movTexture.loop = true;
		m=0;
		z=0;
		e=1;
		e2 =0;
		
		sen01. transform.localScale = new Vector3(0.0F, 0.00f, 0.00f);
		
		//renderer.material.shader = Shader.Find("Specular");
        //print(renderer.material.GetFloat("_Shininess"));
		
	
		
	}
	//*******************************************************************************************
	void OnGUI() {
		GUI.skin =uiskin ;
		if(e==1){
			if(GUI.Button(new Rect(1170, 250, 90, 50), "sen01")){
				sen01.GetComponent<Animation>() .Play ("fanda");
				sen02.GetComponent<Animation>() .Play ("suoxiao");
				e2 =1;
				e=0;
				len01.active=false   ;
				len02.active=false  ;
				
			}
		}
		if(e2==1){
			if(GUI.Button(new Rect(1170, 250, 90, 50), "sen02")){
				sen01.GetComponent<Animation>() .Play ("suoxiao");
				sen02.GetComponent<Animation>() .Play ("fanda");
				e=1;
				e2 =0;
				lizi .startSize =0.0f;
				len01.active=false   ;
				len02.active=false  ;
			}
		}
		
	    
		
		if (v==1) {
			GUI.DrawTexture (new Rect (0,0, Screen.width, Screen.height),movTexture,ScaleMode.StretchToFill);
			movTexture.Play();
			l=2 ;
			c=2;
			z=2;
			m=2;
			
			if (Input.anyKey){
				movTexture.Stop();
				v=0;
				m=0;
				if (i==0){
					c=0;
				}
				if (i==2){
					c=0;
				}
				else if (i==1){
					c=1;
				}
				
				if (r==0){
					z=0;
				}
				else if (r==1){
					z=1;
				}
				
				if (len01.active==false ){
					l=0;
				}
				else if (len01.active==true){
					l=1;
				}
				
				if (len02.active==false ){
					l=0;
				}
				else if (len02.active==true){
					l=1;
				}
			}
		}
      
		//车轮动画控制*******************************************************
		if (c==0){
				if(GUI.Button(new Rect(1170, 10, 90, 50), "Go")){
				    tt+=tt+1;
				    //lu. renderer.material.color=new Color(1.0F, 1.0F, 1.0F,0.4f);
					i=1;
					c=1;
					//lizi .startSize =0.008f;
					//lu2 .animation .Play ("lu");
				}
		}
		if (c==1)
				if(GUI.Button(new Rect(1170, 10, 90, 50), "Stop")){
					//lu. renderer.material.color=new Color(1.0F, 1.0F, 0.6F,0.0F);
					lizi .startSize =0.0f;
					//lu2 .animation .Stop ("lu");
					i=2;
					c=0;
					
				}
		//车灯动画控制*******************************************************
		if (l==0){	
			if(GUI.Button(new Rect(1170, 70, 90, 50), "Light On")){
				len01.active=true   ;
				len02.active=true  ;
				l=1;	
			}
		}
		if (l==1){	
			if(GUI.Button(new Rect(1170, 70, 90, 50), "Light Off")){
				len01.active=false   ;
				len02.active=false  ;
				l=0;	
			}
		}
		
		//  视频播放控制  ****************************************************
		if(m==0){
			if(GUI.Button(new Rect(1170, 130, 90, 50), "Movie")){
				
				v=1 ;
			}
		}
		
		//  车体自传控制  ****************************************************
		if(z==0){
			if(GUI.Button(new Rect(1170, 190, 90, 50), "Rotate")){
			
				r=1;
				z=1;
			}
		}
		if(z==1){
			if(GUI.Button(new Rect(1170, 190, 90, 50), "Stop")){
			
				r=0;
				z=0;
			}
		}
		
		
	}
	
	
		
	
	
	
	
	
	//  车轮动画  ************************************************************
	void Update () {
		
    	if (i==1){
	        rotation = new Vector3(0,0,speed)*Time.deltaTime*speed;
	        chelun01.transform.Rotate(rotation);
			chelun02.transform.Rotate(rotation);
	        if(speed <= 40)
	        {
	            speed += 0.05f*(speed+1);
	        }
			
			
		}
		
		if (i==2){
			rotation = new Vector3(0,0,speed)*Time.deltaTime*speed;
	        chelun01.transform.Rotate(rotation);
			chelun02.transform.Rotate(rotation);
	        if(speed >=1)
	        {
	            speed -= 0.02f*speed;
			}
			if (speed <1.5){
				speed=0;
			}
    	}
		if (r==1)
		   carRotate.transform.Rotate(Vector3.up, Time.deltaTime*10, Space.World);
		

		
	}

}
