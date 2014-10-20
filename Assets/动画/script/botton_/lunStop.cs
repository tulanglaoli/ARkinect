using UnityEngine;
using System.Collections;

public class lunStop : MonoBehaviour {
	
	public GameObject chelun01;
	public GameObject chelun02;
	
	public GameObject lu;
	
    void OnCollisionEnter(Collision collision) {
		if(collision.collider.tag=="EditorOnly"){
		
       
			chelun01.GetComponent<Animation>() .Play ("go");
			chelun02.GetComponent<Animation>() .Play ("go"); 
		}
    }

}