using UnityEngine;
using System.Collections;

public class lunGO : MonoBehaviour {
	public GameObject chelun01;
	public GameObject chelun02;

    void OnCollisionEnter(Collision collision) {
		if(collision.collider.tag=="EditorOnly"){
			
        
			chelun01.GetComponent<Animation>() .Stop ("go");
			chelun02.GetComponent<Animation>() .Stop ("go");
		}
    }
	
}