#pragma strict
var doora :GameObject  ;
var doorb :GameObject  ;
var i=0;

 

function Start(){
	doora.GetComponent(Animation).Stop("车门2—开");
	doorb.GetComponent(Animation).Stop("车门1—开");
	
}

function OnMouseDown(){

	if (!doora.GetComponent(Animation).isPlaying){
		
			if (i==2){
			   
			   doora.GetComponent(Animation).Play("车门2—关");
			   doorb.GetComponent(Animation).Play("车门1—关");
			   i=i-1;
			   
			}
		
			else if (i==1){
				
				doora.GetComponent(Animation).Play("车门2—开");
				doorb.GetComponent(Animation).Play("车门1—开");
				i=i+1;
				
			}
	}
}
  


        
