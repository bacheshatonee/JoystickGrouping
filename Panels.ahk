SendMode Input


;   Class Definitions
;***********************
class VPANEL
{
	;instance variable definitions
	panelName := "test"
	joystickID := 0
	masterState := 1
	vButtons := Object()
}

class VBUTTON		;class definition for button on a panel
{
	;instance variable definitions
	isContinuous := 0										;bool defining if this is a single send per button press "0", or if it continuously sends an input "1"
	isMaster := 0											;bool defining if this is a master button
	physicalID := 0											;the physical id of the button on the joystick
	valueArray := Object()										;arrray contianing value pairs using parent's master state as keys
	currentState := 0										;current state of button
	signalFrequency := 30										;frequency used for continuous input
	PARENT := Object()										;Parent object, used for reference
	buttonRef :=											;string reference for this particular button
	
	;Static Variable Definition
	
	;Method definitions

	__New(inPARENT, inPhysicalID, inIsMaster:=0, inIsContinuous:=0, newVal:=1, inSignalFrequency:=30)
	{
		
		
		;Store the parameter values in the object member variables
		this.PARENT := inPARENT
		this.physicalID := inPhysicalID
		this.isMaster := inIsMaster
		this.isContinuous := inIsContinuous
		this.valueArray[this.PARENT.masterState] := newVal
		this.signalFrequency := inSignalFrequency
		
		
		
		
		;amalgamate the reference name for the button and store it in buttonRef
		this.buttonRef := this.PARENT.joystickID . "Joy" . this.physicalID
		
		;MsgBox, 0, vButton Creation,% "Button being created: " . this.buttonRef . " | Key: " . this.PARENT.masterState . " | Stored Value: " . this.valueArray[this.PARENT.masterState]
					
		;Set the current state in case the button is currently on
		this.currentState := GetKeyState(this.buttonRef)
		
		;if the switch is a master, set the parents master state
		if this.isMaster
		{
			this.PARENT.masterState := this.buttonRef			;if this is a master switch, change the master state of the parent panel
		}
					
		if this.currentState
		{
			this.ButtonDown()
		}
		
		return this
	}
	
	SetValue(newVal)
	{
		if (not isMaster)
		{
			;MsgBox, 0, Set a new value,% "Button being set: " . this.buttonRef . " | Key: " . this.PARENT.masterState . " | Value to be stored: " . newVal
			this.valueArray[this.PARENT.masterState] := newVal
			;MsgBox, 0, Set a new value,% "Button being set: " . this.buttonRef . " | Key: " . this.PARENT.masterState . " | Stored Value: " . this.valueArray[this.PARENT.masterState]
			return 1
		}
		return 0
	}
	
	GetValue()
	{
		return this.valueArray[this.PARENT.masterState]
	}

	ButtonDown()
	{
		sleep 25
		if not GetKeyState(this.buttonRef)
		{
			MsgBox, 0, Ghost,% "Button being pressed: " . this.buttonRef
			return 0
		}
		this.currentState := 1
		
		if this.isMaster
		{
			this.PARENT.masterState := this.buttonRef			;if this is a master switch, change the master state of the parent panel
			this.currentState := 0
			return
		}
		panelState := this.PARENT.masterState
		
		;MsgBox, 0, Button Press,% "Button being pressed: " . this.buttonRef . " | Master State Key: " . panelState . " | Stored Value: " . this.valueArray[panelState]
		
		sendValue := this.valueArray[panelState]
		
		Send %sendValue%   ; Send the initial keystroke
		
		if this.isContinuous				;if this is a continuous button, send the input again
		{
			while GetKeyState(this.buttonRef)
			{
				Send %sendValue%  ; Send another keystroke.
				Sleep this.signalFrequency
			}
		}
		this.currentState := 0
		return 1
	}
}
this.valueArray[panelState] downthis.valueArray[panelState] up
;Build panels

buttonMatrix := Object()

;*******************************************************************************************************************
;Create Panel 1
Panel1 := Object()
Panel1 := new VPANEL

Panel1.joystickID :=1
Panel1.masterState := "1joy33"

(Panel1.vButtons)["1joy1"] := new VBUTTON(Panel1,1,0,0,"1",30)
buttonMatrix["1joy1"] := (Panel1.vButtons)["1joy1"]

(Panel1.vButtons)["1joy2"] := new VBUTTON(Panel1,2,0,0,"2",30)
buttonMatrix["1joy2"] := (Panel1.vButtons)["1joy2"]

(Panel1.vButtons)["1joy3"] := new VBUTTON(Panel1,3,0,0,"3",30)
buttonMatrix["1joy3"] := (Panel1.vButtons)["1joy3"]

(Panel1.vButtons)["1joy4"] := new VBUTTON(Panel1,4,0,0,"4",30)
buttonMatrix["1joy4"] := (Panel1.vButtons)["1joy4"]

(Panel1.vButtons)["1joy5"] := new VBUTTON(Panel1,5,0,0,"5",30)
buttonMatrix["1joy5"] := (Panel1.vButtons)["1joy5"]

(Panel1.vButtons)["1joy6"] := new VBUTTON(Panel1,6,0,0,"6",30)
buttonMatrix["1joy6"] := (Panel1.vButtons)["1joy6"]

(Panel1.vButtons)["1joy7"] := new VBUTTON(Panel1,7,0,0,"7",30)
buttonMatrix["1joy7"] := (Panel1.vButtons)["1joy7"]

(Panel1.vButtons)["1joy8"] := new VBUTTON(Panel1,8,0,0,"8",30)
buttonMatrix["1joy8"] := (Panel1.vButtons)["1joy8"]

(Panel1.vButtons)["1joy9"] := new VBUTTON(Panel1,9,0,0,"9",30)
buttonMatrix["1joy9"] := (Panel1.vButtons)["1joy9"]

(Panel1.vButtons)["1joy10"] := new VBUTTON(Panel1,10,0,0,"10",30)
buttonMatrix["1joy10"] := (Panel1.vButtons)["1joy10"]

(Panel1.vButtons)["1joy11"] := new VBUTTON(Panel1,11,0,0,"11",30)
buttonMatrix["1joy11"] := (Panel1.vButtons)["1joy11"]

(Panel1.vButtons)["1joy12"] := new VBUTTON(Panel1,12,0,0,"12",30)
buttonMatrix["1joy12"] := (Panel1.vButtons)["1joy12"]

(Panel1.vButtons)["1joy13"] := new VBUTTON(Panel1,13,0,0,"13",30)
buttonMatrix["1joy13"] := (Panel1.vButtons)["1joy13"]

(Panel1.vButtons)["1joy14"] := new VBUTTON(Panel1,14,0,0,"14",30)
buttonMatrix["1joy14"] := (Panel1.vButtons)["1joy14"]

(Panel1.vButtons)["1joy15"] := new VBUTTON(Panel1,15,0,0,"15",30)
buttonMatrix["1joy15"] := (Panel1.vButtons)["1joy15"]

(Panel1.vButtons)["1joy16"] := new VBUTTON(Panel1,16,0,0,"16",30)
buttonMatrix["1joy16"] := (Panel1.vButtons)["1joy16"]

(Panel1.vButtons)["1joy17"] := new VBUTTON(Panel1,17,0,0,"17",30)
buttonMatrix["1joy17"] := (Panel1.vButtons)["1joy17"]

(Panel1.vButtons)["1joy18"] := new VBUTTON(Panel1,18,0,0,"18",30)
buttonMatrix["1joy18"] := (Panel1.vButtons)["1joy18"]

(Panel1.vButtons)["1joy19"] := new VBUTTON(Panel1,19,0,0,"19",30)
buttonMatrix["1joy19"] := (Panel1.vButtons)["1joy19"]

(Panel1.vButtons)["1joy20"] := new VBUTTON(Panel1,20,0,0,"20",30)
buttonMatrix["1joy20"] := (Panel1.vButtons)["1joy20"]

(Panel1.vButtons)["1joy21"] := new VBUTTON(Panel1,21,0,0,"21",30)
buttonMatrix["1joy21"] := (Panel1.vButtons)["1joy21"]

(Panel1.vButtons)["1joy22"] := new VBUTTON(Panel1,22,0,0,"22",30)
buttonMatrix["1joy22"] := (Panel1.vButtons)["1joy22"]

(Panel1.vButtons)["1joy23"] := new VBUTTON(Panel1,23,0,0,"23",30)
buttonMatrix["1joy23"] := (Panel1.vButtons)["1joy23"]

(Panel1.vButtons)["1joy24"] := new VBUTTON(Panel1,24,0,0,"24",30)
buttonMatrix["1joy24"] := (Panel1.vButtons)["1joy24"]

(Panel1.vButtons)["1joy25"] := new VBUTTON(Panel1,25,0,0,"25",30)
buttonMatrix["1joy25"] := (Panel1.vButtons)["1joy25"]

(Panel1.vButtons)["1joy26"] := new VBUTTON(Panel1,26,0,0,"26",30)
buttonMatrix["1joy26"] := (Panel1.vButtons)["1joy26"]

(Panel1.vButtons)["1joy27"] := new VBUTTON(Panel1,27,0,0,"27",30)
buttonMatrix["1joy27"] := (Panel1.vButtons)["1joy27"]

(Panel1.vButtons)["1joy28"] := new VBUTTON(Panel1,28,0,0,"28",30)
buttonMatrix["1joy28"] := (Panel1.vButtons)["1joy28"]

(Panel1.vButtons)["1joy29"] := new VBUTTON(Panel1,29,0,0,"29",30)
buttonMatrix["1joy29"] := (Panel1.vButtons)["1joy29"]

(Panel1.vButtons)["1joy30"] := new VBUTTON(Panel1,30,0,0,"30",30)
buttonMatrix["1joy30"] := (Panel1.vButtons)["1joy30"]

(Panel1.vButtons)["1joy31"] := new VBUTTON(Panel1,31,0,0,"31",30)
buttonMatrix["1joy31"] := (Panel1.vButtons)["1joy31"]

(Panel1.vButtons)["1joy32"] := new VBUTTON(Panel1,32,0,0,"32",30)
buttonMatrix["1joy32"] := (Panel1.vButtons)["1joy32"]




;Create Panel 2
Panel2 := Object()
Panel2 := new VPANEL

Panel2.joystickID :=2
Panel2.masterState := "2joy33"

(Panel2.vButtons)["2joy1"] := new VBUTTON(Panel2,1,0,0,"1",30)
buttonMatrix["2joy1"] := (Panel2.vButtons)["2joy1"]

(Panel2.vButtons)["2joy2"] := new VBUTTON(Panel2,2,0,0,"2",30)
buttonMatrix["2joy2"] := (Panel2.vButtons)["2joy2"]

(Panel2.vButtons)["2joy3"] := new VBUTTON(Panel2,3,0,0,"3",30)
buttonMatrix["2joy3"] := (Panel2.vButtons)["2joy3"]

(Panel2.vButtons)["2joy4"] := new VBUTTON(Panel2,4,0,0,"4",30)
buttonMatrix["2joy4"] := (Panel2.vButtons)["2joy4"]

(Panel2.vButtons)["2joy5"] := new VBUTTON(Panel2,5,0,0,"5",30)
buttonMatrix["2joy5"] := (Panel2.vButtons)["2joy5"]

(Panel2.vButtons)["2joy6"] := new VBUTTON(Panel2,6,0,0,"6",30)
buttonMatrix["2joy6"] := (Panel2.vButtons)["2joy6"]

(Panel2.vButtons)["2joy7"] := new VBUTTON(Panel2,7,0,0,"7",30)
buttonMatrix["2joy7"] := (Panel2.vButtons)["2joy7"]

(Panel2.vButtons)["2joy8"] := new VBUTTON(Panel2,8,0,0,"8",30)
buttonMatrix["2joy8"] := (Panel2.vButtons)["2joy8"]

(Panel2.vButtons)["2joy9"] := new VBUTTON(Panel2,9,0,0,"9",30)
buttonMatrix["2joy9"] := (Panel2.vButtons)["2joy9"]

(Panel2.vButtons)["2joy10"] := new VBUTTON(Panel2,10,0,0,"10",30)
buttonMatrix["2joy10"] := (Panel2.vButtons)["2joy10"]

(Panel2.vButtons)["2joy11"] := new VBUTTON(Panel2,11,0,0,"11",30)
buttonMatrix["2joy11"] := (Panel2.vButtons)["2joy11"]

(Panel2.vButtons)["2joy12"] := new VBUTTON(Panel2,12,0,0,"12",30)
buttonMatrix["2joy12"] := (Panel2.vButtons)["2joy12"]

(Panel2.vButtons)["2joy13"] := new VBUTTON(Panel2,13,0,0,"13",30)
buttonMatrix["2joy13"] := (Panel2.vButtons)["2joy13"]

(Panel2.vButtons)["2joy14"] := new VBUTTON(Panel2,14,0,0,"14",30)
buttonMatrix["2joy14"] := (Panel2.vButtons)["2joy14"]

(Panel2.vButtons)["2joy15"] := new VBUTTON(Panel2,15,0,0,"15",30)
buttonMatrix["2joy15"] := (Panel2.vButtons)["2joy15"]

(Panel2.vButtons)["2joy16"] := new VBUTTON(Panel2,16,0,0,"16",30)
buttonMatrix["2joy16"] := (Panel2.vButtons)["2joy16"]

(Panel2.vButtons)["2joy17"] := new VBUTTON(Panel2,17,0,0,"17",30)
buttonMatrix["2joy17"] := (Panel2.vButtons)["2joy17"]

(Panel2.vButtons)["2joy18"] := new VBUTTON(Panel2,18,0,0,"18",30)
buttonMatrix["2joy18"] := (Panel2.vButtons)["2joy18"]

(Panel2.vButtons)["2joy19"] := new VBUTTON(Panel2,19,0,0,"19",30)
buttonMatrix["2joy19"] := (Panel2.vButtons)["2joy19"]

(Panel2.vButtons)["2joy20"] := new VBUTTON(Panel2,20,0,0,"20",30)
buttonMatrix["2joy20"] := (Panel2.vButtons)["2joy20"]

(Panel2.vButtons)["2joy21"] := new VBUTTON(Panel2,21,0,0,"21",30)
buttonMatrix["2joy21"] := (Panel2.vButtons)["2joy21"]

(Panel2.vButtons)["2joy22"] := new VBUTTON(Panel2,22,0,0,"22",30)
buttonMatrix["2joy22"] := (Panel2.vButtons)["2joy22"]

(Panel2.vButtons)["2joy23"] := new VBUTTON(Panel2,23,0,0,"23",30)
buttonMatrix["2joy23"] := (Panel2.vButtons)["2joy23"]

(Panel2.vButtons)["2joy24"] := new VBUTTON(Panel2,24,0,0,"24",30)
buttonMatrix["2joy24"] := (Panel2.vButtons)["2joy24"]

(Panel2.vButtons)["2joy25"] := new VBUTTON(Panel2,25,0,0,"25",30)
buttonMatrix["2joy25"] := (Panel2.vButtons)["2joy25"]

(Panel2.vButtons)["2joy26"] := new VBUTTON(Panel2,26,0,0,"26",30)
buttonMatrix["2joy26"] := (Panel2.vButtons)["2joy26"]

(Panel2.vButtons)["2joy27"] := new VBUTTON(Panel2,27,0,0,"27",30)
buttonMatrix["2joy27"] := (Panel2.vButtons)["2joy27"]

(Panel2.vButtons)["2joy28"] := new VBUTTON(Panel2,28,0,0,"28",30)
buttonMatrix["2joy28"] := (Panel2.vButtons)["2joy28"]

(Panel2.vButtons)["2joy29"] := new VBUTTON(Panel2,29,0,0,"29",30)
buttonMatrix["2joy29"] := (Panel2.vButtons)["2joy29"]

(Panel2.vButtons)["2joy30"] := new VBUTTON(Panel2,30,0,0,"30",30)
buttonMatrix["2joy30"] := (Panel2.vButtons)["2joy30"]

(Panel2.vButtons)["2joy31"] := new VBUTTON(Panel2,31,0,0,"31",30)
buttonMatrix["2joy31"] := (Panel2.vButtons)["2joy31"]

(Panel2.vButtons)["2joy32"] := new VBUTTON(Panel2,32,0,0,"32",30)
buttonMatrix["2joy32"] := (Panel2.vButtons)["2joy32"]




;Create Panel 3
Panel3 := Object()
Panel3 := new VPANEL

Panel3.joystickID :=3
Panel3.masterState := "3joy33"

(Panel3.vButtons)["3joy1"] := new VBUTTON(Panel3,1,0,0,"1",30)
buttonMatrix["3joy1"] := (Panel3.vButtons)["3joy1"]

(Panel3.vButtons)["3joy2"] := new VBUTTON(Panel3,2,0,0,"2",30)
buttonMatrix["3joy2"] := (Panel3.vButtons)["3joy2"]

(Panel3.vButtons)["3joy3"] := new VBUTTON(Panel3,3,0,0,"3",30)
buttonMatrix["3joy3"] := (Panel3.vButtons)["3joy3"]

(Panel3.vButtons)["3joy4"] := new VBUTTON(Panel3,4,0,0,"4",30)
buttonMatrix["3joy4"] := (Panel3.vButtons)["3joy4"]

(Panel3.vButtons)["3joy5"] := new VBUTTON(Panel3,5,0,0,"5",30)
buttonMatrix["3joy5"] := (Panel3.vButtons)["3joy5"]

(Panel3.vButtons)["3joy6"] := new VBUTTON(Panel3,6,0,0,"6",30)
buttonMatrix["3joy6"] := (Panel3.vButtons)["3joy6"]

(Panel3.vButtons)["3joy7"] := new VBUTTON(Panel3,7,0,0,"7",30)
buttonMatrix["3joy7"] := (Panel3.vButtons)["3joy7"]

(Panel3.vButtons)["3joy8"] := new VBUTTON(Panel3,8,0,0,"8",30)
buttonMatrix["3joy8"] := (Panel3.vButtons)["3joy8"]

(Panel3.vButtons)["3joy9"] := new VBUTTON(Panel3,9,0,0,"9",30)
buttonMatrix["3joy9"] := (Panel3.vButtons)["3joy9"]

(Panel3.vButtons)["3joy10"] := new VBUTTON(Panel3,10,0,0,"10",30)
buttonMatrix["3joy10"] := (Panel3.vButtons)["3joy10"]

(Panel3.vButtons)["3joy11"] := new VBUTTON(Panel3,11,0,0,"11",30)
buttonMatrix["3joy11"] := (Panel3.vButtons)["3joy11"]

(Panel3.vButtons)["3joy12"] := new VBUTTON(Panel3,12,0,0,"12",30)
buttonMatrix["3joy12"] := (Panel3.vButtons)["3joy12"]

(Panel3.vButtons)["3joy13"] := new VBUTTON(Panel3,13,0,0,"13",30)
buttonMatrix["3joy13"] := (Panel3.vButtons)["3joy13"]

(Panel3.vButtons)["3joy14"] := new VBUTTON(Panel3,14,0,0,"14",30)
buttonMatrix["3joy14"] := (Panel3.vButtons)["3joy14"]

(Panel3.vButtons)["3joy15"] := new VBUTTON(Panel3,15,0,0,"15",30)
buttonMatrix["3joy15"] := (Panel3.vButtons)["3joy15"]

(Panel3.vButtons)["3joy16"] := new VBUTTON(Panel3,16,0,0,"16",30)
buttonMatrix["3joy16"] := (Panel3.vButtons)["3joy16"]

(Panel3.vButtons)["3joy17"] := new VBUTTON(Panel3,17,0,0,"17",30)
buttonMatrix["3joy17"] := (Panel3.vButtons)["3joy17"]

(Panel3.vButtons)["3joy18"] := new VBUTTON(Panel3,18,0,0,"18",30)
buttonMatrix["3joy18"] := (Panel3.vButtons)["3joy18"]

(Panel3.vButtons)["3joy19"] := new VBUTTON(Panel3,19,0,0,"19",30)
buttonMatrix["3joy19"] := (Panel3.vButtons)["3joy19"]

(Panel3.vButtons)["3joy20"] := new VBUTTON(Panel3,20,0,0,"20",30)
buttonMatrix["3joy20"] := (Panel3.vButtons)["3joy20"]

(Panel3.vButtons)["3joy21"] := new VBUTTON(Panel3,21,0,0,"21",30)
buttonMatrix["3joy21"] := (Panel3.vButtons)["3joy21"]

(Panel3.vButtons)["3joy22"] := new VBUTTON(Panel3,22,0,0,"22",30)
buttonMatrix["3joy22"] := (Panel3.vButtons)["3joy22"]

(Panel3.vButtons)["3joy23"] := new VBUTTON(Panel3,23,0,0,"23",30)
buttonMatrix["3joy23"] := (Panel3.vButtons)["3joy23"]

(Panel3.vButtons)["3joy24"] := new VBUTTON(Panel3,24,0,0,"24",30)
buttonMatrix["3joy24"] := (Panel3.vButtons)["3joy24"]

(Panel3.vButtons)["3joy25"] := new VBUTTON(Panel3,25,0,0,"25",30)
buttonMatrix["3joy25"] := (Panel3.vButtons)["3joy25"]

(Panel3.vButtons)["3joy26"] := new VBUTTON(Panel3,26,0,0,"26",30)
buttonMatrix["3joy26"] := (Panel3.vButtons)["3joy26"]

(Panel3.vButtons)["3joy27"] := new VBUTTON(Panel3,27,0,0,"27",30)
buttonMatrix["3joy27"] := (Panel3.vButtons)["3joy27"]

(Panel3.vButtons)["3joy28"] := new VBUTTON(Panel3,28,0,0,"28",30)
buttonMatrix["3joy28"] := (Panel3.vButtons)["3joy28"]

(Panel3.vButtons)["3joy29"] := new VBUTTON(Panel3,29,0,0,"29",30)
buttonMatrix["3joy29"] := (Panel3.vButtons)["3joy29"]

(Panel3.vButtons)["3joy30"] := new VBUTTON(Panel3,30,0,0,"30",30)
buttonMatrix["3joy30"] := (Panel3.vButtons)["3joy30"]

(Panel3.vButtons)["3joy31"] := new VBUTTON(Panel3,31,0,0,"31",30)
buttonMatrix["3joy31"] := (Panel3.vButtons)["3joy31"]

(Panel3.vButtons)["3joy32"] := new VBUTTON(Panel3,32,0,0,"32",30)
buttonMatrix["3joy32"] := (Panel3.vButtons)["3joy32"]




;Create Panel 4
Panel4 := Object()
Panel4 := new VPANEL

Panel4.joystickID :=4
Panel4.masterState := "4joy33"

(Panel4.vButtons)["4joy1"] := new VBUTTON(Panel4,1,0,0,"1",30)
buttonMatrix["4joy1"] := (Panel4.vButtons)["4joy1"]

(Panel4.vButtons)["4joy2"] := new VBUTTON(Panel4,2,0,0,"2",30)
buttonMatrix["4joy2"] := (Panel4.vButtons)["4joy2"]

(Panel4.vButtons)["4joy3"] := new VBUTTON(Panel4,3,0,0,"3",30)
buttonMatrix["4joy3"] := (Panel4.vButtons)["4joy3"]

(Panel4.vButtons)["4joy4"] := new VBUTTON(Panel4,4,0,0,"4",30)
buttonMatrix["4joy4"] := (Panel4.vButtons)["4joy4"]

(Panel4.vButtons)["4joy5"] := new VBUTTON(Panel4,5,0,0,"5",30)
buttonMatrix["4joy5"] := (Panel4.vButtons)["4joy5"]

(Panel4.vButtons)["4joy6"] := new VBUTTON(Panel4,6,0,0,"6",30)
buttonMatrix["4joy6"] := (Panel4.vButtons)["4joy6"]

(Panel4.vButtons)["4joy7"] := new VBUTTON(Panel4,7,0,0,"7",30)
buttonMatrix["4joy7"] := (Panel4.vButtons)["4joy7"]

(Panel4.vButtons)["4joy8"] := new VBUTTON(Panel4,8,0,0,"8",30)
buttonMatrix["4joy8"] := (Panel4.vButtons)["4joy8"]

(Panel4.vButtons)["4joy9"] := new VBUTTON(Panel4,9,0,0,"9",30)
buttonMatrix["4joy9"] := (Panel4.vButtons)["4joy9"]

(Panel4.vButtons)["4joy10"] := new VBUTTON(Panel4,10,0,0,"10",30)
buttonMatrix["4joy10"] := (Panel4.vButtons)["4joy10"]

(Panel4.vButtons)["4joy11"] := new VBUTTON(Panel4,11,0,0,"11",30)
buttonMatrix["4joy11"] := (Panel4.vButtons)["4joy11"]

(Panel4.vButtons)["4joy12"] := new VBUTTON(Panel4,12,0,0,"12",30)
buttonMatrix["4joy12"] := (Panel4.vButtons)["4joy12"]

(Panel4.vButtons)["4joy13"] := new VBUTTON(Panel4,13,0,0,"13",30)
buttonMatrix["4joy13"] := (Panel4.vButtons)["4joy13"]

(Panel4.vButtons)["4joy14"] := new VBUTTON(Panel4,14,0,0,"14",30)
buttonMatrix["4joy14"] := (Panel4.vButtons)["4joy14"]

(Panel4.vButtons)["4joy15"] := new VBUTTON(Panel4,15,0,0,"15",30)
buttonMatrix["4joy15"] := (Panel4.vButtons)["4joy15"]

(Panel4.vButtons)["4joy16"] := new VBUTTON(Panel4,16,0,0,"16",30)
buttonMatrix["4joy16"] := (Panel4.vButtons)["4joy16"]

(Panel4.vButtons)["4joy17"] := new VBUTTON(Panel4,17,0,0,"17",30)
buttonMatrix["4joy17"] := (Panel4.vButtons)["4joy17"]

(Panel4.vButtons)["4joy18"] := new VBUTTON(Panel4,18,0,0,"18",30)
buttonMatrix["4joy18"] := (Panel4.vButtons)["4joy18"]

(Panel4.vButtons)["4joy19"] := new VBUTTON(Panel4,19,0,0,"19",30)
buttonMatrix["4joy19"] := (Panel4.vButtons)["4joy19"]

(Panel4.vButtons)["4joy20"] := new VBUTTON(Panel4,20,0,0,"20",30)
buttonMatrix["4joy20"] := (Panel4.vButtons)["4joy20"]

(Panel4.vButtons)["4joy21"] := new VBUTTON(Panel4,21,0,0,"21",30)
buttonMatrix["4joy21"] := (Panel4.vButtons)["4joy21"]

(Panel4.vButtons)["4joy22"] := new VBUTTON(Panel4,22,0,0,"22",30)
buttonMatrix["4joy22"] := (Panel4.vButtons)["4joy22"]

(Panel4.vButtons)["4joy23"] := new VBUTTON(Panel4,23,0,0,"23",30)
buttonMatrix["4joy23"] := (Panel4.vButtons)["4joy23"]

(Panel4.vButtons)["4joy24"] := new VBUTTON(Panel4,24,0,0,"24",30)
buttonMatrix["4joy24"] := (Panel4.vButtons)["4joy24"]

(Panel4.vButtons)["4joy25"] := new VBUTTON(Panel4,25,0,0,"25",30)
buttonMatrix["4joy25"] := (Panel4.vButtons)["4joy25"]

(Panel4.vButtons)["4joy26"] := new VBUTTON(Panel4,26,0,0,"26",30)
buttonMatrix["4joy26"] := (Panel4.vButtons)["4joy26"]

(Panel4.vButtons)["4joy27"] := new VBUTTON(Panel4,27,0,0,"27",30)
buttonMatrix["4joy27"] := (Panel4.vButtons)["4joy27"]

(Panel4.vButtons)["4joy28"] := new VBUTTON(Panel4,28,0,0,"28",30)
buttonMatrix["4joy28"] := (Panel4.vButtons)["4joy28"]

(Panel4.vButtons)["4joy29"] := new VBUTTON(Panel4,29,0,0,"29",30)
buttonMatrix["4joy29"] := (Panel4.vButtons)["4joy29"]

(Panel4.vButtons)["4joy30"] := new VBUTTON(Panel4,30,0,0,"30",30)
buttonMatrix["4joy30"] := (Panel4.vButtons)["4joy30"]

(Panel4.vButtons)["4joy31"] := new VBUTTON(Panel4,31,0,0,"31",30)
buttonMatrix["4joy31"] := (Panel4.vButtons)["4joy31"]

(Panel4.vButtons)["4joy32"] := new VBUTTON(Panel4,32,0,0,"32",30)
buttonMatrix["4joy32"] := (Panel4.vButtons)["4joy32"]





;Create Panel 5
Panel5 := Object()
Panel5 := new VPANEL

Panel5.joystickID :=5
Panel5.masterState := "5joy33"

(Panel5.vButtons)["5joy1"] := new VBUTTON(Panel5,1,0,0,"1",30)
buttonMatrix["5joy1"] := (Panel5.vButtons)["5joy1"]

(Panel5.vButtons)["5joy2"] := new VBUTTON(Panel5,2,0,0,"2",30)
buttonMatrix["5joy2"] := (Panel5.vButtons)["5joy2"]

(Panel5.vButtons)["5joy3"] := new VBUTTON(Panel5,3,0,0,"3",30)
buttonMatrix["5joy3"] := (Panel5.vButtons)["5joy3"]

(Panel5.vButtons)["5joy4"] := new VBUTTON(Panel5,4,0,0,"4",30)
buttonMatrix["5joy4"] := (Panel5.vButtons)["5joy4"]

(Panel5.vButtons)["5joy5"] := new VBUTTON(Panel5,5,0,0,"5",30)
buttonMatrix["5joy5"] := (Panel5.vButtons)["5joy5"]

(Panel5.vButtons)["5joy6"] := new VBUTTON(Panel5,6,0,0,"6",30)
buttonMatrix["5joy6"] := (Panel5.vButtons)["5joy6"]

(Panel5.vButtons)["5joy7"] := new VBUTTON(Panel5,7,0,0,"7",30)
buttonMatrix["5joy7"] := (Panel5.vButtons)["5joy7"]

(Panel5.vButtons)["5joy8"] := new VBUTTON(Panel5,8,0,0,"8",30)
buttonMatrix["5joy8"] := (Panel5.vButtons)["5joy8"]

(Panel5.vButtons)["5joy9"] := new VBUTTON(Panel5,9,0,0,"9",30)
buttonMatrix["5joy9"] := (Panel5.vButtons)["5joy9"]

(Panel5.vButtons)["5joy10"] := new VBUTTON(Panel5,10,0,0,"10",30)
buttonMatrix["5joy10"] := (Panel5.vButtons)["5joy10"]

(Panel5.vButtons)["5joy11"] := new VBUTTON(Panel5,11,0,0,"11",30)
buttonMatrix["5joy11"] := (Panel5.vButtons)["5joy11"]

(Panel5.vButtons)["5joy12"] := new VBUTTON(Panel5,12,0,0,"12",30)
buttonMatrix["5joy12"] := (Panel5.vButtons)["5joy12"]

(Panel5.vButtons)["5joy13"] := new VBUTTON(Panel5,13,0,0,"13",30)
buttonMatrix["5joy13"] := (Panel5.vButtons)["5joy13"]

(Panel5.vButtons)["5joy14"] := new VBUTTON(Panel5,14,0,0,"14",30)
buttonMatrix["5joy14"] := (Panel5.vButtons)["5joy14"]

(Panel5.vButtons)["5joy15"] := new VBUTTON(Panel5,15,0,0,"15",30)
buttonMatrix["5joy15"] := (Panel5.vButtons)["5joy15"]

(Panel5.vButtons)["5joy16"] := new VBUTTON(Panel5,16,0,0,"16",30)
buttonMatrix["5joy16"] := (Panel5.vButtons)["5joy16"]

(Panel5.vButtons)["5joy17"] := new VBUTTON(Panel5,17,0,0,"17",30)
buttonMatrix["5joy17"] := (Panel5.vButtons)["5joy17"]

(Panel5.vButtons)["5joy18"] := new VBUTTON(Panel5,18,0,0,"18",30)
buttonMatrix["5joy18"] := (Panel5.vButtons)["5joy18"]

(Panel5.vButtons)["5joy19"] := new VBUTTON(Panel5,19,0,0,"19",30)
buttonMatrix["5joy19"] := (Panel5.vButtons)["5joy19"]

(Panel5.vButtons)["5joy20"] := new VBUTTON(Panel5,20,0,0,"20",30)
buttonMatrix["5joy20"] := (Panel5.vButtons)["5joy20"]

(Panel5.vButtons)["5joy21"] := new VBUTTON(Panel5,21,0,0,"21",30)
buttonMatrix["5joy21"] := (Panel5.vButtons)["5joy21"]

(Panel5.vButtons)["5joy22"] := new VBUTTON(Panel5,22,0,0,"22",30)
buttonMatrix["5joy22"] := (Panel5.vButtons)["5joy22"]

(Panel5.vButtons)["5joy23"] := new VBUTTON(Panel5,23,0,0,"23",30)
buttonMatrix["5joy23"] := (Panel5.vButtons)["5joy23"]

(Panel5.vButtons)["5joy24"] := new VBUTTON(Panel5,24,0,0,"24",30)
buttonMatrix["5joy24"] := (Panel5.vButtons)["5joy24"]

(Panel5.vButtons)["5joy25"] := new VBUTTON(Panel5,25,0,0,"25",30)
buttonMatrix["5joy25"] := (Panel5.vButtons)["5joy25"]

(Panel5.vButtons)["5joy26"] := new VBUTTON(Panel5,26,0,0,"26",30)
buttonMatrix["5joy26"] := (Panel5.vButtons)["5joy26"]

(Panel5.vButtons)["5joy27"] := new VBUTTON(Panel5,27,0,0,"27",30)
buttonMatrix["5joy27"] := (Panel5.vButtons)["5joy27"]

(Panel5.vButtons)["5joy28"] := new VBUTTON(Panel5,28,0,0,"28",30)
buttonMatrix["5joy28"] := (Panel5.vButtons)["5joy28"]

(Panel5.vButtons)["5joy29"] := new VBUTTON(Panel5,29,0,0,"29",30)
buttonMatrix["5joy29"] := (Panel5.vButtons)["5joy29"]

(Panel5.vButtons)["5joy30"] := new VBUTTON(Panel5,30,0,0,"30",30)
buttonMatrix["5joy30"] := (Panel5.vButtons)["5joy30"]

(Panel5.vButtons)["5joy31"] := new VBUTTON(Panel5,31,0,0,"31",30)
buttonMatrix["5joy31"] := (Panel5.vButtons)["5joy31"]

(Panel5.vButtons)["5joy32"] := new VBUTTON(Panel5,32,0,0,"32",30)
buttonMatrix["5joy32"] := (Panel5.vButtons)["5joy32"]




;*******************************************************************************************************************
;Map Buttons to new actions


1joy1::
buttonMatrix["1joy1"].ButtonDown()
Return
1joy2::
buttonMatrix["1joy2"].ButtonDown()
Return
1joy3::
buttonMatrix["1joy3"].ButtonDown()
Return
1joy4::
buttonMatrix["1joy4"].ButtonDown()
Return
1joy5::
buttonMatrix["1joy5"].ButtonDown()
Return
1joy6::
buttonMatrix["1joy6"].ButtonDown()
Return
1joy7::
buttonMatrix["1joy7"].ButtonDown()
Return
1joy8::
buttonMatrix["1joy8"].ButtonDown()
Return
1joy9::
buttonMatrix["1joy9"].ButtonDown()
Return
1joy10::
buttonMatrix["1joy10"].ButtonDown()
Return
1joy11::
buttonMatrix["1joy11"].ButtonDown()
Return
1joy12::
buttonMatrix["1joy12"].ButtonDown()
Return
1joy13::
buttonMatrix["1joy13"].ButtonDown()
Return
1joy14::
buttonMatrix["1joy14"].ButtonDown()
Return
1joy15::
buttonMatrix["1joy15"].ButtonDown()
Return
1joy16::
buttonMatrix["1joy16"].ButtonDown()
Return
1joy17::
buttonMatrix["1joy17"].ButtonDown()
Return
1joy18::
buttonMatrix["1joy18"].ButtonDown()
Return
1joy19::
buttonMatrix["1joy19"].ButtonDown()
Return
1joy20::
buttonMatrix["1joy20"].ButtonDown()
Return
1joy21::
buttonMatrix["1joy21"].ButtonDown()
Return
1joy22::
buttonMatrix["1joy22"].ButtonDown()
Return
1joy23::
buttonMatrix["1joy23"].ButtonDown()
Return
1joy24::
buttonMatrix["1joy24"].ButtonDown()
Return
1joy25::
buttonMatrix["1joy25"].ButtonDown()
Return
1joy26::
buttonMatrix["1joy26"].ButtonDown()
Return
1joy27::
buttonMatrix["1joy27"].ButtonDown()
Return
1joy28::
buttonMatrix["1joy28"].ButtonDown()
Return
1joy29::
buttonMatrix["1joy29"].ButtonDown()
Return
1joy30::
buttonMatrix["1joy30"].ButtonDown()
Return
1joy31::
buttonMatrix["1joy31"].ButtonDown()
Return
1joy32::
buttonMatrix["1joy32"].ButtonDown()
Return
2joy1::
buttonMatrix["2joy1"].ButtonDown()
Return
2joy2::
buttonMatrix["2joy2"].ButtonDown()
Return
2joy3::
buttonMatrix["2joy3"].ButtonDown()
Return
2joy4::
buttonMatrix["2joy4"].ButtonDown()
Return
2joy5::
buttonMatrix["2joy5"].ButtonDown()
Return
2joy6::
buttonMatrix["2joy6"].ButtonDown()
Return
2joy7::
buttonMatrix["2joy7"].ButtonDown()
Return
2joy8::
buttonMatrix["2joy8"].ButtonDown()
Return
2joy9::
buttonMatrix["2joy9"].ButtonDown()
Return
2joy10::
buttonMatrix["2joy10"].ButtonDown()
Return
2joy11::
buttonMatrix["2joy11"].ButtonDown()
Return
2joy12::
buttonMatrix["2joy12"].ButtonDown()
Return
2joy13::
buttonMatrix["2joy13"].ButtonDown()
Return
2joy14::
buttonMatrix["2joy14"].ButtonDown()
Return
2joy15::
buttonMatrix["2joy15"].ButtonDown()
Return
2joy16::
buttonMatrix["2joy16"].ButtonDown()
Return
2joy17::
buttonMatrix["2joy17"].ButtonDown()
Return
2joy18::
buttonMatrix["2joy18"].ButtonDown()
Return
2joy19::
buttonMatrix["2joy19"].ButtonDown()
Return
2joy20::
buttonMatrix["2joy20"].ButtonDown()
Return
2joy21::
buttonMatrix["2joy21"].ButtonDown()
Return
2joy22::
buttonMatrix["2joy22"].ButtonDown()
Return
2joy23::
buttonMatrix["2joy23"].ButtonDown()
Return
2joy24::
buttonMatrix["2joy24"].ButtonDown()
Return
2joy25::
buttonMatrix["2joy25"].ButtonDown()
Return
2joy26::
buttonMatrix["2joy26"].ButtonDown()
Return
2joy27::
buttonMatrix["2joy27"].ButtonDown()
Return
2joy28::
buttonMatrix["2joy28"].ButtonDown()
Return
2joy29::
buttonMatrix["2joy29"].ButtonDown()
Return
2joy30::
buttonMatrix["2joy30"].ButtonDown()
Return
2joy31::
buttonMatrix["2joy31"].ButtonDown()
Return
2joy32::
buttonMatrix["2joy32"].ButtonDown()
Return
3joy1::
buttonMatrix["3joy1"].ButtonDown()
Return
3joy2::
buttonMatrix["3joy2"].ButtonDown()
Return
3joy3::
buttonMatrix["3joy3"].ButtonDown()
Return
3joy4::
buttonMatrix["3joy4"].ButtonDown()
Return
3joy5::
buttonMatrix["3joy5"].ButtonDown()
Return
3joy6::
buttonMatrix["3joy6"].ButtonDown()
Return
3joy7::
buttonMatrix["3joy7"].ButtonDown()
Return
3joy8::
buttonMatrix["3joy8"].ButtonDown()
Return
3joy9::
buttonMatrix["3joy9"].ButtonDown()
Return
3joy10::
buttonMatrix["3joy10"].ButtonDown()
Return
3joy11::
buttonMatrix["3joy11"].ButtonDown()
Return
3joy12::
buttonMatrix["3joy12"].ButtonDown()
Return
3joy13::
buttonMatrix["3joy13"].ButtonDown()
Return
3joy14::
buttonMatrix["3joy14"].ButtonDown()
Return
3joy15::
buttonMatrix["3joy15"].ButtonDown()
Return
3joy16::
buttonMatrix["3joy16"].ButtonDown()
Return
3joy17::
buttonMatrix["3joy17"].ButtonDown()
Return
3joy18::
buttonMatrix["3joy18"].ButtonDown()
Return
3joy19::
buttonMatrix["3joy19"].ButtonDown()
Return
3joy20::
buttonMatrix["3joy20"].ButtonDown()
Return
3joy21::
buttonMatrix["3joy21"].ButtonDown()
Return
3joy22::
buttonMatrix["3joy22"].ButtonDown()
Return
3joy23::
buttonMatrix["3joy23"].ButtonDown()
Return
3joy24::
buttonMatrix["3joy24"].ButtonDown()
Return
3joy25::
buttonMatrix["3joy25"].ButtonDown()
Return
3joy26::
buttonMatrix["3joy26"].ButtonDown()
Return
3joy27::
buttonMatrix["3joy27"].ButtonDown()
Return
3joy28::
buttonMatrix["3joy28"].ButtonDown()
Return
3joy29::
buttonMatrix["3joy29"].ButtonDown()
Return
3joy30::
buttonMatrix["3joy30"].ButtonDown()
Return
3joy31::
buttonMatrix["3joy31"].ButtonDown()
Return
3joy32::
buttonMatrix["3joy32"].ButtonDown()
Return
4joy1::
buttonMatrix["4joy1"].ButtonDown()
Return
4joy2::
buttonMatrix["4joy2"].ButtonDown()
Return
4joy3::
buttonMatrix["4joy3"].ButtonDown()
Return
4joy4::
buttonMatrix["4joy4"].ButtonDown()
Return
4joy5::
buttonMatrix["4joy5"].ButtonDown()
Return
4joy6::
buttonMatrix["4joy6"].ButtonDown()
Return
4joy7::
buttonMatrix["4joy7"].ButtonDown()
Return
4joy8::
buttonMatrix["4joy8"].ButtonDown()
Return
4joy9::
buttonMatrix["4joy9"].ButtonDown()
Return
4joy10::
buttonMatrix["4joy10"].ButtonDown()
Return
4joy11::
buttonMatrix["4joy11"].ButtonDown()
Return
4joy12::
buttonMatrix["4joy12"].ButtonDown()
Return
4joy13::
buttonMatrix["4joy13"].ButtonDown()
Return
4joy14::
buttonMatrix["4joy14"].ButtonDown()
Return
4joy15::
buttonMatrix["4joy15"].ButtonDown()
Return
4joy16::
buttonMatrix["4joy16"].ButtonDown()
Return
4joy17::
buttonMatrix["4joy17"].ButtonDown()
Return
4joy18::
buttonMatrix["4joy18"].ButtonDown()
Return
4joy19::
buttonMatrix["4joy19"].ButtonDown()
Return
4joy20::
buttonMatrix["4joy20"].ButtonDown()
Return
4joy21::
buttonMatrix["4joy21"].ButtonDown()
Return
4joy22::
buttonMatrix["4joy22"].ButtonDown()
Return
4joy23::
buttonMatrix["4joy23"].ButtonDown()
Return
4joy24::
buttonMatrix["4joy24"].ButtonDown()
Return
4joy25::
buttonMatrix["4joy25"].ButtonDown()
Return
4joy26::
buttonMatrix["4joy26"].ButtonDown()
Return
4joy27::
buttonMatrix["4joy27"].ButtonDown()
Return
4joy28::
buttonMatrix["4joy28"].ButtonDown()
Return
4joy29::
buttonMatrix["4joy29"].ButtonDown()
Return
4joy30::
buttonMatrix["4joy30"].ButtonDown()
Return
4joy31::
buttonMatrix["4joy31"].ButtonDown()
Return
4joy32::
buttonMatrix["4joy32"].ButtonDown()
Return
5joy1::
buttonMatrix["5joy1"].ButtonDown()
Return
5joy2::
buttonMatrix["5joy2"].ButtonDown()
Return
5joy3::
buttonMatrix["5joy3"].ButtonDown()
Return
5joy4::
buttonMatrix["5joy4"].ButtonDown()
Return
5joy5::
buttonMatrix["5joy5"].ButtonDown()
Return
5joy6::
buttonMatrix["5joy6"].ButtonDown()
Return
5joy7::
buttonMatrix["5joy7"].ButtonDown()
Return
5joy8::
buttonMatrix["5joy8"].ButtonDown()
Return
5joy9::
buttonMatrix["5joy9"].ButtonDown()
Return
5joy10::
buttonMatrix["5joy10"].ButtonDown()
Return
5joy11::
buttonMatrix["5joy11"].ButtonDown()
Return
5joy12::
buttonMatrix["5joy12"].ButtonDown()
Return
5joy13::
buttonMatrix["5joy13"].ButtonDown()
Return
5joy14::
buttonMatrix["5joy14"].ButtonDown()
Return
5joy15::
buttonMatrix["5joy15"].ButtonDown()
Return
5joy16::
buttonMatrix["5joy16"].ButtonDown()
Return
5joy17::
buttonMatrix["5joy17"].ButtonDown()
Return
5joy18::
buttonMatrix["5joy18"].ButtonDown()
Return
5joy19::
buttonMatrix["5joy19"].ButtonDown()
Return
5joy20::
buttonMatrix["5joy20"].ButtonDown()
Return
5joy21::
buttonMatrix["5joy21"].ButtonDown()
Return
5joy22::
buttonMatrix["5joy22"].ButtonDown()
Return
5joy23::
buttonMatrix["5joy23"].ButtonDown()
Return
5joy24::
buttonMatrix["5joy24"].ButtonDown()
Return
5joy25::
buttonMatrix["5joy25"].ButtonDown()
Return
5joy26::
buttonMatrix["5joy26"].ButtonDown()
Return
5joy27::
buttonMatrix["5joy27"].ButtonDown()
Return
5joy28::
buttonMatrix["5joy28"].ButtonDown()
Return
5joy29::
buttonMatrix["5joy29"].ButtonDown()
Return
5joy30::
buttonMatrix["5joy30"].ButtonDown()
Return
5joy31::
buttonMatrix["5joy31"].ButtonDown()
Return
5joy32::
buttonMatrix["5joy32"].ButtonDown()
Return