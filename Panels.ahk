SendMode Input

	


;   Class Definitions
;***********************
class VPANEL
{
	;instance variable definitions
	panelName := "test"
	JoystickID := 0
	masterState := 1
	vButtons := []
	masterStateArray := []
	
	
	__New(inName)
	{
		;Store Variables	
		this.panelName := inName
		this.masterStateArray[elementCount] := 0
		return this
	}
	
	getName()
	{
		;MsgBox, 0, Parent,% "Parent ref: " . this.panelName
		return this.panelName	
	}
	
	RemoveMaster(inValue, inIndex)
	{
		;MsgBox ,0,Remove Master, 
		; Loop through the array
		this.masterStateArray.Remove(inValue)
		this.masterStateArray.Remove(inIndex)
	}
	
	setMaster(inMasterState)
	{
		this.masterState := inMasterState
		return
	}
	
	AddMaster(inValue, inIndex)
	{
		if this.masterStateArray[inValue] = ""
		{
			
			this.masterStateArray[inValue] := inIndex
			this.masterStateArray[inIndex] := inValue
			;MsgBox, 0, Add Master,% "Index: " . this.masterStateArray[inValue] . " | Value: " . this.masterStateArray[inIndex] 
		}
		return
	}
	
	getMaster()
	{
	RETURN this.masterState	
	}
	
	getMasterCount()
	{
		return this.masterStateArray[elementCount]
	}
	getMasterByRef(inRef)
	{
		return this.masterStateArray[inRef]
	}
	
	;GetMasterArray
	;{
	;	return object(this.masterStateArray)
	;}
}






class VBUTTON		;class definition for button on a panel
{
	;instance variable definitions
	isContinuous := 0										;bool defining if this is a single send per button press "0", or if it continuously sends an input "1"
	isMaster := 0											;bool defining if this is a master button
	isToggle := 0
	physicalID := 0											;the physical id of the button on the Joystick
	valueArray := []										;arrray contianing value pairs using parent's master state as keys
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
		this.valueArray[this.PARENT.getMasterbyRef(1)] := newVal
		this.signalFrequency := inSignalFrequency
		
		
		
		
		
		;amalgamate the reference name for the button and store it in buttonRef
		this.buttonRef := this.PARENT.JoystickID . "Joy" . this.physicalID
		
		;MsgBox, 0, vButton Creation,% "Button being created: " . this.buttonRef . " | Key: " . this.PARENT.getMaster() . " | Stored Value: " . this.valueArray[this.PARENT.getMaster()]
					
		;Set the current state in case the button is currently on
		this.currentState := GetKeyState(this.buttonRef)
		
		;if the switch is a master, set the parents master state
		if this.isMaster
		{
			index := 0
			Loop 8
			{
				index := index + 1
				;MsgBox, 0, find next available index,% "index: " . index . "Value: " . this.PARENT.getMasterByRef(index)
				if !this.PARENT.getMasterByRef(index) 
					break
			}
			this.PARENT.addMaster(this.buttonRef, index)			;if this is a master switch, change the master state of the parent panel
		}
					
		if this.currentState
		{
			;this.ButtonDown()
		}
		
		return this
	}
	
	ChangePanel(inPanelID)
	{
		MsgBox, 0, ChangePanel,% "inPanelID: " . inPanelID . " | Button: " . this.buttonRef . " | Current Panel: " . this.PARENT.GetName()
		if this.isMaster
		{
		index := 0
		Loop 8
		{
			index := index + 1
			MsgBox, 0, ChangePanel - loop,% "index: " . index . " | Master by Ref: " . this.PARENT.getMasterByRef(index) . " | button: " . this.buttonRef
			if (this.PARENT.getMasterByRef(index) = this.buttonRef)
				break
		}
			this.PARENT.RemoveMaster(inValue, inIndex)
			this.isMaster := 0
		}
		
		if (inPanelID = "Panel1")
			this.PARENT := Panel1
		
		if (inPanelID = "Panel2")
			this.PARENT := Panel2
		
		if (inPanelID = "Panel3")
			this.PARENT := Panel3
		
		if (inPanelID = "Panel4")
			this.PARENT := Panel4
		
		if (inPanelID = "Panel5")
			this.PARENT := Panel5
		
		if (inPanelID = "Panel6")
			this.PARENT := Panel6
		
		if (inPanelID = "Panel7")
			this.PARENT := Panel7
		
		if (inPanelID = "Panel8")
			this.PARENT := Panel8
	}
	
	SetValue(newVal)
	{
		if (not isMaster)
		{
			;MsgBox, 0, Set a new value,% "Button being set: " . this.buttonRef . " | Key: " . this.PARENT.getMaster() . " | Value to be stored: " . newVal
			this.valueArray[this.PARENT.getMaster()] := newVal
			;MsgBox, 0, Set a new value,% "Button being set: " . this.buttonRef . " | Key: " . this.PARENT.getMaster() . " | Stored Value: " . this.valueArray[this.PARENT.getMaster()]
			return 1
		}
		return 0
	}
	
	GetValue()
	{
		;MsgBox, 0, Set a new value,% "Button being set: " . this.valueArray[this.PARENT.getMaster()]
		return this.valueArray[this.PARENT.getMaster()]
	}
	
	CheckContinuous()
	{
		return this.isContinuous	
	}
	
	SetContinuous(inValue)
	{
		this.isContinuous := inValue
		return 1
	}
	
	CheckMaster()
	{
		return this.isMaster
	}
	
	SetMaster(inValue, inIndex)
	{
	
		this.isMaster := 1
		this.PARENT.addMaster(inValue, inIndex)
		return 1
	}
	
	RemoveMaster(inValue, inIndex)
	{
		this.PARENT.RemoveMaster(inValue, inIndex)
		this.isMaster := 0
		return
	}
	
	getParent()
	{
		;MsgBox, 0, Parent,% "Parent ref: " . this.PARENT.getName()
		return this.PARENT.getName()
	}
	
	GetPanelObj()
	{
		return this.PARENT
	}
	
	GetMasterByRef(inRef)
	{
		;MsgBox, 0, Master State 1,% "this.PARENT.getMasterByRef(inRef): " . this.PARENT.getMasterByRef(inRef)
		return this.PARENT.getMasterByRef(inRef)
	}
	
	;GetMasterArray()
	;{
	;	return this.PARENT.getMasterArray()
	;}
	
	ButtonDown()
	{
		sleep 25
		if not GetKeyState(this.buttonRef)
		{
			MsgBox, 0, Ghost,% "Button press being ghosted: " . this.buttonRef
			return 0
		}
		this.currentState := 1
		
		if this.isMaster and this.isToggle										;if this is a master switch and is set to continuous/toggle, change the master state of the parent panel
		{
			if (this.PARENT.GetMaster() == this.buttonRef())
			{
				this.PARENT.setMaster("default")			
			}else
			{
				this.PARENT.setMaster(this.buttonRef)
			}
			return
		}
		
		
		panelState := "default"
		
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
	
	GetValueByMaster(inMaster)
	{
		;MsgBox, 0, Value by Master,% "Value to test: " . inMaster . " | Value: " . this.valueArray[inMaster]
		return this.valueArray[inMaster]
	}
	
	SetValueByMaster(inValue, inMaster)
	{
		;MsgBox, 0, Store Value by Master,% "Value to store: " . inValue . " | Master: " . inMaster
		this.valueArray[inMaster] := inValue
		return 1
	}
}

