SendMode Input

	


;   Class Definitions
;***********************
class VPANEL																; Panel objects hold the master states for their associated button objects, this determines which buttons are effected by included shift states
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
	
	getName()																; Return the name of the Panel
	{
		;MsgBox, 0, Parent,% "Parent ref: " . this.panelName
		return this.panelName	
	}
	
	RemoveMaster(inValue, inIndex)											; Remove both idexes of the master state from "masterStateArray"
	{
		;MsgBox ,0,Remove Master, 
		; Loop through the array
		this.masterStateArray.Remove(inValue)
		this.masterStateArray.Remove(inIndex)
	}
	
	setMaster(inMasterState)												; Set the current masterState of the Panel, this is used to store continuous(toggle) master keys and is normally "default"
	{
		this.masterState := inMasterState
		return
	}
	
	AddMaster(inValue, inIndex)												; Adds a master state to the "masterStateArray" at the specified index if it does not already exist in the array
	{
		if this.masterStateArray[inValue] = ""
		{
			
			this.masterStateArray[inValue] := inIndex
			this.masterStateArray[inIndex] := inValue
		}
		return
	}
	
	getMaster()																; Returns the current master state, normally "default" unless a continuous(toggle) master key has been pressed
	{
	RETURN this.masterState	
	}
	
	getMasterByRef(inRef)													; return the master state at the given index
	{
		return this.masterStateArray[inRef]
	}
	
}






class VBUTTON																;class definition for button on a panel
{
	;instance variable definitions
	isContinuous := 0														;bool defining if this is a single send per button press "0", or if it continuously sends an input "1"
	isMaster := 0															;bool defining if this is a master button
	isToggle := 0
	physicalID := 0															;the physical id of the button on the Joystick
	valueArray := []														;arrray contianing value pairs using parent's master state as keys
	currentState := 0														;current state of button
	signalFrequency := 30													;frequency used for continuous input
	PARENT := Object()														;Parent object, used for reference
	buttonRef :=															;string reference for this particular button
	
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
					
		;Set the current state in case the button is currently on
		this.currentState := GetKeyState(this.buttonRef)
		
		;if the switch is a master, set the parents master state
		if this.isMaster
		{
			index := 0
			Loop 8
			{
				index := index + 1
				if !this.PARENT.getMasterByRef(index) 
					break
			}
			this.PARENT.addMaster(this.buttonRef, index)					;if this is a master switch, add the master state to the parent panel at the lowest free index
		}
					
		if this.currentState
		{
			;this.ButtonDown()
		}
		
		return this
	}
	
	ChangePanel(inPanelID)													; Change the Panel that this Button belongs to	
	{
		if this.isMaster													; if this button is currently designated as a master, remove it before changing panels
		{
		index := 0
		Loop 8
		{
			index := index + 1
			if (this.PARENT.getMasterByRef(index) = this.buttonRef)			; Find the index that this button is at in the "masterStateArray"
				break
		}
			this.PARENT.RemoveMaster(this.buttonRef, index)
			this.isMaster := 0
		}
		
		this.PARENT := inPanelID
		
		return
	}
	
	CheckContinuous()														; Bool indicating if this button is designated as continuous
	{
		return this.isContinuous	
	}
	
	SetContinuous(inValue)													; set a Bool value indicating if this button is designated as continuous
	{
		this.isContinuous := inValue
		return 1
	}
	
	CheckMaster()															; Bool indicating if this button is designated as a master
	{
		return this.isMaster
	}
	
	SetMaster(inValue, inIndex)												; set a Bool value indicating if this button is designated as a master
	{
	
		this.isMaster := 1
		this.PARENT.addMaster(inValue, inIndex)
		return 1
	}
	
	RemoveMaster(inValue, inIndex)											; Remove the master state from the "masterStateArray"
	{
		this.PARENT.RemoveMaster(inValue, inIndex)
		this.isMaster := 0
		return
	}
	
	getParent()																; return the name of the current panel associated with this button
	{
		return this.PARENT.getName()
	}
	
	GetPanelObj()															; returns the actual Panel object associated with this button
	{
		return this.PARENT
	}
	
	GetMasterByRef(inRef)													; return the master state at the given index in the "masterStateArray"
	{
		return this.PARENT.getMasterByRef(inRef)
	}
	
	ButtonDown()															; Actions to be performed when a button is pressed
	{
		sleep 25
		if not GetKeyState(this.buttonRef)									; this should remove ghosted inputs from a shorting joystick controller, it eliminates any input that lasts less than ~25 miliseconds
		{
			return 0
		}
		this.currentState := 1
		
		if this.isMaster and this.isContinuous								; if this is a master switch and is set to continuous/toggle, change the master state of the parent panel
		{
			if (this.PARENT.GetMaster() == this.buttonRef)					; If the master state of the panel is already set to this button then un-toggle it and return it to default
			{
				this.PARENT.setMaster("default")			
			}else															; otherwise set the current master state to this button
			{
				this.PARENT.setMaster(this.buttonRef)
			}
			return
		}
		
		panelState := this.PARENT.GetMaster()								; Set the current master state to the current master state for the panel
		
		msIndex := 0
		loop 8																; Test each of the master states in the  to see if any of them are currently down
		{
			msIndex := msIndex + 1
			testMaster := GetKeyState(this.PARENT.GetMasterByRef(msIndex))	; If any of them are down, set them as the master state
			if (GetKeyState(testMaster) = "D")
			{
				panelState := testMaster
				break
			}
		}
		
		sendValue := this.valueArray[panelState]
		
		Send %sendValue%   													; Send the initial keystroke
		
		if this.isContinuous												;if this is a continuous button, send the input again
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
	
	GetValueByMaster(inMaster)												; return the value associated with a given master state in the "valueArray"
	{
		return this.valueArray[inMaster]
	}
	
	SetValueByMaster(inValue, inMaster)										; set the value of a given master state for this button in the "valueArray"
	{
		this.valueArray[inMaster] := inValue
		return 1
	}
}

