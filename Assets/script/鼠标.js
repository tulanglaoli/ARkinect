#pragma strict

var myCursor : Texture2D;

var myClickCursor : Texture2D;

var cursorWidth : float;

var cursorHeight : float;



private var isClicked : boolean = false;



function Start () {

Cursor.visible = false;

}



function Update () {

if (Input.GetMouseButton(0)) 

isClicked = true;



else

isClicked = false;

}



function OnGUI () {

var mousePos = Input.mousePosition;

GUI.depth = 0.2f;

if (isClicked)

GUI.DrawTexture(Rect(mousePos.x - cursorWidth / 2, Screen.height - mousePos.y - cursorHeight / 2,

cursorWidth, cursorHeight), myClickCursor);

else

GUI.DrawTexture(Rect(mousePos.x - cursorWidth / 2, Screen.height - mousePos.y - cursorHeight / 2,

cursorWidth, cursorHeight), myCursor);

}