using UnityEngine;
using System.Collections;
 


public class RotateMode : MonoBehaviour {

	public float speed = 0.5F;
	private float flag;
	private bool bRotate;
	int s=0;

	
                
	
	
	// Use this for initialization
	void Start () {
		bRotate = true;
		s=1;
	}
	
	void OnGUI(){
		if(Event.current.type == EventType.MouseDrag){
			if(s==1){
			transform.Rotate(new Vector3(0, -Input.GetAxis("Mouse X"), 0)*Time.deltaTime*speed);
			
			}
		}
	}
 
	// Update is called once per frame
	/*void Update () {
		
		// 这里乘以Time.deltaTime 函数是为了使旋转效果更加平滑。
		//flag = Input.GetAxis("Mouse 0");
		
		if (Input.GetKey("left")){
			this.transform.Rotate(Vector3.up*Time.deltaTime*-speed);
		}
		if (Input.GetKey("right")){
			this.transform.Rotate(Vector3.up*Time.deltaTime*speed);
		}
	}*/
	
	
	
	/*void OnMouseEnter(){
		
		clickObj scriptObj = (clickObj)gameObject.GetComponent("clickObj");
		bool bFlag = clickObj.bDrag;
		if(!bFlag)
			bRotate = true;
	//	print("Enter in horse model");
	}*/
	
	
	/*void OnMouseExit(){
		bRotate = false;
	//	print("Exit horse area");
	}
	
	void OnCollisionEnter(){
		print("On collision enter");
	}
	void OnTriggerEnter(){
		print("On trigger enter");
	}*/
	
	
}
