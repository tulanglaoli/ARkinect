using UnityEngine;
using System.Collections;

public class texture : MonoBehaviour {

	public Texture textures;
	// Use this for initialization
	void Start () {
//	textures = new Texture2D();
	}
	
	// Update is called once per frame
	void Update () {
		
		GetComponent<Renderer>().material.mainTexture = textures;
	}
}
