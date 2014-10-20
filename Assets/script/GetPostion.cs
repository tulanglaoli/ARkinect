using UnityEngine;
using System.Collections;

public class GetPostion : MonoBehaviour {
	
	
	private Vector3 postionVectorA;
	public Vector3 postionVectorB;
	private Vector3 postionVectorC;
	public GameObject ObjectB;
	public GameObject ObjectB2;
	public GameObject center;
	public GameObject sen1;
	public GameObject sen2;
	float YBtemp;
	public Camera Maincamera;
	public GUITexture closewarn;
	Vector3 startscale;
	// Use this for initialization
	void Start () {
		index = 1;
		handVector = new Vector3[2];
	}
	
	// Update is called once per frame
	public int index;//换手记录
	Vector3[] handVector;
	public int a;
	
	int F;
	bool IsScale;
	public bool Whichhand=false;//是否还手
	bool isChange = false;//是否已经换手
	public float MinCarz=0.5f;
	Vector3 cartempvector;
	public float Rate = 1;
	public float tmp  ;
	float Timecount = 0f;
	void Update () {
		handVector[0] = ObjectB.transform.position;
		handVector[1] = ObjectB2.transform.position;
		//程序
		if(Vector3.Distance(handVector[0],handVector[1])<5)//if(tempVector2.y>tempVector1.y&&Mathf.Abs(tempVector2.y-tempVector1.y)>0.2)
		{
			if(Whichhand==false&&isChange == false)
			{
				Whichhand=true;
				
			}
		}
		else
		{
			Timecount += Time.deltaTime;
			if(Timecount>0.5f)
			{
				Timecount = 0f;
				Whichhand = false;
				isChange = false;
			}
		}
		
		if(a==1)//jieshu
		{
			IsScale=false;
			
		}
		
		if(a==0)//kaishi
		{
			if(IsScale==false)
			{
				sen1.gameObject.GetComponent<Animation>().Play("suoxiao");
				sen2.gameObject.GetComponent<Animation>().Play("fanda");
				this.gameObject.GetComponent<Animation>().Play("senefanda");
				IsScale = true;
			}
			
			
			//Vector3.Lerp(ObjectA2.transform.localPosition,ObjectB2.transform.localPosition,0.5f);
			
			
			if(Whichhand==true&& isChange ==false)
			{
				if(index ==0)
				{
					index =1;
				}
				else
				{
					index =0;
				}
				isChange = true;
			}
			
			this.transform.position = Vector3.Lerp(handVector[index],this.transform.position,0.9f);
			
		}
	}
	
	
	
}
