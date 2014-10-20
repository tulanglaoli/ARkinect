using UnityEngine;
using System.Collections;

public class buttonani : MonoBehaviour {
	
	public Texture2D[] ani= new Texture2D[38];
	public Texture2D[] ani2= new Texture2D[38];
	float TimeCount=0;
	public int i=0;
	public int ONButton;
	public GameObject chelun01;
	public GameObject chelun02;
	public GameObject len01;
	public GameObject len02;
	public GameObject carRotate;
	public GameObject sen01;
	public GameObject sen02;
	public GameObject lu;

	public int Buttonclass;
	int Rotatecar;
	// Use this for initialization
	public void init () {
	TimeCount=0;
		i=0;
		ONButton = 0;
	}
	
	public bool updatebutton()
	{
		TimeCount += Time.deltaTime;
		if(TimeCount>0.03f&&i>0)
		{
			if(ONButton==1)
				this.GetComponent<GUITexture>().texture = ani2[i%38];
			else
				this.GetComponent<GUITexture>().texture = ani[i%38];
			TimeCount=0;
			if(i<38)
			i++;
			else
			{
				i=0;
				if(ONButton==0)
				{
					ONButton =1;
					this.GetComponent<GUITexture>().texture = ani2[i%38];
				}
				else
				{
					ONButton=0;
					this.GetComponent<GUITexture>().texture = ani[i%38];
				}
				return true;
			}
		}
		return false;
	}
	
	public bool updatebutton2()
	{
		TimeCount += Time.deltaTime;
		if(i==0)
			if(ONButton==1)
				this.GetComponent<GUITexture>().texture = ani2[i%38];
				else
			this.GetComponent<GUITexture>().texture = ani[i%38];
		if(TimeCount>0.02f&&i>0)
		{
			if(ONButton==1)
				this.GetComponent<GUITexture>().texture = ani2[i%38];
			else
				this.GetComponent<GUITexture>().texture = ani[i%38];
			TimeCount=0;
			if(i>0)
			i--;
			else
			{
				i=0;
				
				return true;
			}
		}
		return false;
	}
	
	// Update is called once per frame
//	void Update () {
//		TimeCount += Time.deltaTime;
//		if(i==0)
//			{
//				if(ONButton==1)
//					this.guiTexture.texture = ani2[i%38];
//				else
//					this.guiTexture.texture = ani[i%38];
//			}
//		if(TimeCount>0.03f&&i>0)
//		{
//			
//			if(ONButton==1)
//				this.guiTexture.texture = ani[i%38];
//			else
//				this.guiTexture.texture = ani2[i%38];
//			TimeCount=0;
//			if(i<38)
//			i++;
//			else
//			{
//				i=0;
//				if(ONButton==1)
//					this.guiTexture.texture = ani2[i%38];
//				else
//					this.guiTexture.texture = ani[i%38];
//				if(Buttonclass==1)
//				{
//					if(ONButton==1)
//					{
//						chelun01.animation.Play ("go");
//						chelun02.animation .Play ("go");
//						lu.animation.Play("lu");
//					}
//				else
//					{
//						chelun01.animation .Stop ("go");
//						chelun02.animation .Stop ("go");
//						lu.animation.Stop("lu");
//					}
//				}
//					
//					else if(Buttonclass==2)
//						{
//							if(ONButton==1)
//							{
//								len01.active=true  ;
//								len02.active=true  ;
//							}
//						else
//							{
//								len01.active=false ;
//								len02.active=false ;
//							}
//				}
//						else if(Buttonclass==3)
//							{
//									if(ONButton==1)
//									{
//										Rotatecar=1;
//									}
//								else
//									{
//										Rotatecar=0;
//									}
//						}
//							else if(Buttonclass==4)
//								{
//										if(ONButton==1)
//										{
//											sen01.animation .Play ("fanda");
//											sen02.animation .Play ("suoxiao");
//										}
//									else
//										{
//											sen01.animation .Play ("suoxiao");
//											sen02.animation .Play ("fanda");
//										}
//							}
//			}
//		}
//		if (Rotatecar==1){
//		carRotate.transform.Rotate(Vector3.up, Time.deltaTime*30, Space.World);
//		}
//	
//	}
}
