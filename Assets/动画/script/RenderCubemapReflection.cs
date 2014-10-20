using UnityEngine;
using System.Collections;

internal class RenderCubemapReflection : MonoBehaviour
{
    // Fields
    public Camera _camera;
    public Cubemap _cubeMap;
    private int _nFaces;
    public static bool m_RenderOneFacePerFrame;
    public bool oneFacePerFrame;

    // Methods
    private void Start()
    {
        if (this._camera != null)
        {
            this._camera.enabled = false;
        }
    }

    private void Update()
    {
        if ((this._camera != null) && (this._cubeMap != null))
        {
            if (this.oneFacePerFrame)
            {
                if (this._nFaces >= 5)
                {
                    this._nFaces = 0;
                }
                int faceMask = ((int) 1) << this._nFaces;
                this._camera.RenderToCubemap(this._cubeMap, faceMask);
                faceMask = ((int) 1) << (this._nFaces + 1);
                this._camera.RenderToCubemap(this._cubeMap, faceMask);
                faceMask = ((int) 1) << (this._nFaces + 2);
                this._camera.RenderToCubemap(this._cubeMap, faceMask);
                this._nFaces += 3;
            }
            else
            {
                this._camera.RenderToCubemap(this._cubeMap);
            }
        }
    }
}

 
