using UnityEngine;
using System.Collections;

public class changecolor : MonoBehaviour {
	
	public  Material CarM1;
	public Material CarM2;
	 float time1;
	float time2;
	public int IsChangecolor;
	public Material TempCarM;
	// Use this for initialization
	void Start () {
		
		IsChangecolor=0;
		time1 = 0;
		time2 = 0;
	}
	
	// Update is called once per frame
	void Update () {
		
		Changeblack();
	}
	 public bool Changeblack()
	{
		if(IsChangecolor == 1)
		{
			time1 += Time.deltaTime;
			
			CarM2.Lerp(CarM2,CarM1,time1%1f);
			if(time1>1f)
			{
			IsChangecolor=0;
				time1=0;
				return true;
			}
		}
		else if(IsChangecolor == 2)
		{
			time2 += Time.deltaTime;
			
			CarM2.Lerp(CarM2,TempCarM,time2%1f);
			if(time2>1f)
			{
			IsChangecolor=0;
				time2=0;
				return true;
			}
		}
		return false;
			
	}
	
}
