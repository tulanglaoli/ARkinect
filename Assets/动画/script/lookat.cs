using UnityEngine;
using System.Collections;

public class lookat : MonoBehaviour {
    public Transform target;
    void Update() {
        transform.LookAt(target);
    }
}