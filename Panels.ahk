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
		
		MsgBox, 0, vButton Creation,% "Button being created: " . this.buttonRef . " | Key: " . this.PARENT.masterState . " | Stored Value: " . this.valueArray[this.PARENT.masterState]
					
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
			MsgBox, 0, Set a new value,% "Button being set: " . this.buttonRef . " | Key: " . this.PARENT.masterState . " | Stored Value: " . this.valueArray[this.PARENT.masterState]
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
		this.currentState := 1
		
		if this.isMaster
		{
			this.PARENT.masterState := this.buttonRef			;if this is a master switch, change the master state of the parent panel
			this.currentState := 0
			return
		}
		panelState := this.PARENT.masterState
		
		MsgBox, 0, Button Press,% "Button being pressed: " . this.buttonRef . " | Master State Key: " . panelState . " | Stored Value: " . this.valueArray[panelState]
		
		Send {this.valueArray[panelState] down}   ; Send the initial keystroke
		
		if this.isContinuous				;if this is a continuous button, send the input again
		{
			while GetKeyState(this.buttonRef)
			{
				Send {this.valueArray[panelState] down}  ; Send another keystroke.
				Sleep this.signalFrequency
			}
		}
		this.currentState := 0
		Send {this.valueArray[panelState] Up}
	}
}

;Build a panel

buttonMatrix := Object()
Panel1 := Object()
panel1 := new VPANEL

Panel1.joystickID := 3
Panel1.masterState := "3joy19"

(Panel1.vButtons)[3joy19] := new VBUTTON(Panel1,19,1,0,"LShift",30)
tempObjHolder := (Panel1.vButtons)[3joy19]

(Panel1.vButtons)[3joy13] := new VBUTTON(Panel1,13,0,1,"q",30)
buttonMatrix[3joy13] := (Panel1.vButtons)[3joy13]
(Panel1.vButtons)[3joy20] := new VBUTTON(Panel1,20,0,1,"r",30)
buttonMatrix[3joy20] := (Panel1.vButtons)[3joy20]
(Panel1.vButtons)[3joy15] := new VBUTTON(Panel1,15,0,1,"e",30)
buttonMatrix[3joy15] := (Panel1.vButtons)[3joy15]

(Panel1.vButtons)[3joy7] := new VBUTTON(Panel1,7,0,1,"a",30)
buttonMatrix[3joy7] := (Panel1.vButtons)[3joy7]
(Panel1.vButtons)[3joy14] := new VBUTTON(Panel1,14,0,1,"w",30)
buttonMatrix[3joy14] := (Panel1.vButtons)[3joy14]
(Panel1.vButtons)[3joy21] := new VBUTTON(Panel1,21,0,1,"d",30)
buttonMatrix[3joy21] := (Panel1.vButtons)[3joy21]

(Panel1.vButtons)[3joy1] := new VBUTTON(Panel1,7,0,1,"LCtrl",30)
buttonMatrix[3joy1] := (Panel1.vButtons)[3joy1]
(Panel1.vButtons)[3joy8] := new VBUTTON(Panel1,14,0,1,"s",30)
buttonMatrix[3joy8] := (Panel1.vButtons)[3joy8]
(Panel1.vButtons)[3joy2] := new VBUTTON(Panel1,21,0,1,"Space",30)
buttonMatrix[3joy2] := (Panel1.vButtons)[3joy2]

(Panel1.vButtons)[3joy9] := new VBUTTON(Panel1,9,0,0,"f",30)
buttonMatrix[3joy9] := (Panel1.vButtons)[3joy9]

(Panel1.vButtons)[3joy3] := new VBUTTON(Panel1,3,1,0,"q",30)
buttonMatrix[3joy3] := (Panel1.vButtons)[3joy3]




(Panel1.vButtons)[3joy13].SetValue("j")
(Panel1.vButtons)[3joy20].SetValue("k")
(Panel1.vButtons)[3joy15].SetValue("l")

(Panel1.vButtons)[3joy7].SetValue("z")
(Panel1.vButtons)[3joy14].SetValue("x")
(Panel1.vButtons)[3joy21].SetValue("c")

(Panel1.vButtons)[3joy1].SetValue("v")
(Panel1.vButtons)[3joy8].SetValue("b")
(Panel1.vButtons)[3joy2].SetValue("n")

(Panel1.vButtons)[3joy9].SetValue("m")



;Send an entry value then make the button call and finish with an exit value

3joy19::
send {1}
buttonMatrix[3joy19].ButtonDown()
send {1}
Return

3joy13::
send {2}
buttonMatrix[3joy13].ButtonDown()
send {2}
Return


3joy20::
send {3}
buttonMatrix[3joy20].ButtonDown()
send {3}
Return


3joy15::
send {4}
buttonMatrix[3joy15].ButtonDown()
send {4}
Return


3joy7::
send {5}
buttonMatrix[3joy7].ButtonDown()
send {5}
Return


3joy14::
send {6}
buttonMatrix[3joy14].ButtonDown()
send {6}
Return


3joy21::
send {7}
buttonMatrix[3joy21].ButtonDown()
send {7}
Return


3joy1::
send {8}
buttonMatrix[3joy1].ButtonDown()
send {8}
Return


3joy8::
send {9}
buttonMatrix[3joy8].ButtonDown()
send {9}
Return


3joy2::
send {0}
buttonMatrix[3joy2].ButtonDown()
send {0}
Return


3joy9::
send {p}
buttonMatrix[3joy9].ButtonDown()
send {p}
Return


3joy3::
send {o}
buttonMatrix[3joy3].ButtonDown()
send {o}
Return

