#include C:\Users\Chris\Dropbox\Personal Docs\Flight Sim Cockpit\Panels.ahk						; Classes that describe the panel and button objects
#include C:\Users\Chris\Dropbox\Personal Docs\Flight Sim Cockpit\BuildPanels.ahk				; Instructions for creating a set of panels and objects as a starter

;#include C:\Users\Chris\Dropbox\Personal Docs\Flight Sim Cockpit\ButtonMap.ahk					; Code to have the inputs from the joysticks remapped throug this system

;******************************************************************************************		Variables



;******************************************************************************************		Commands
	
	
goto ResetInputGui

GuiExit:

MsgBox, 0, Panels,% "Post GUI Loaded"
#include C:\Users\Chris\Dropbox\Personal Docs\Flight Sim Cockpit\ButtonMap.ahk					; Code to have the inputs from the joysticks remapped throug this system
return


;******************************************************************************************   GUI Functions


ResetInputGui:
	select := 0
	cbMaster := buttonMatrix[selectedButton].checkMaster()									; Get data about the selected input
	oldMaster := cbMaster
	cbContinuous := buttonMatrix[selectedButton].checkContinuous()
	cbToggle := buttonMatrix[selectedButton].checkToggle()
	
	PanelID := buttonMatrix[selectedButton].GetParent()
	oldPanelID := PanelID
	
	rPanel1 := 0
	rPanel2 := 0
	rPanel3 := 0
	rPanel4 := 0
	rPanel5 := 0
	rPanel6 := 0
	rPanel7 := 0
	rPanel8 := 0
	
	if (PanelID = "Panel1")
		rPanel1 := 1
	
	if (PanelID = "Panel2")
		rPanel2 := 1
	
	if (PanelID = "Panel3")
		rPanel3 := 1
	
	if (PanelID = "Panel4")
		rPanel4 := 1
	
	if (PanelID = "Panel5")
		rPanel5 := 1
	
	if (PanelID = "Panel6")
		rPanel6 := 1
	
	if (PanelID = "Panel7")
		rPanel7 := 1
	
	if (PanelID = "Panel8")
		rPanel8 := 1
	
	
	masterState1 := buttonMatrix[selectedButton].getMasterByRef(1)
	masterState2 := buttonMatrix[selectedButton].getMasterByRef(2)
	masterState3 := buttonMatrix[selectedButton].getMasterByRef(3)
	masterState4 := buttonMatrix[selectedButton].getMasterByRef(4)
	masterState5 := buttonMatrix[selectedButton].getMasterByRef(5)
	masterState6 := buttonMatrix[selectedButton].getMasterByRef(6)
	masterState7 := buttonMatrix[selectedButton].getMasterByRef(7)
	masterState8 := buttonMatrix[selectedButton].getMasterByRef(8)

	outValue1 := buttonMatrix[selectedButton].getValueByMaster(masterState1)
	outValue2 := buttonMatrix[selectedButton].getValueByMaster(masterState2)
	outValue3 := buttonMatrix[selectedButton].getValueByMaster(masterState3)
	outValue4 := buttonMatrix[selectedButton].getValueByMaster(masterState4)
	outValue5 := buttonMatrix[selectedButton].getValueByMaster(masterState5)
	outValue6 := buttonMatrix[selectedButton].getValueByMaster(masterState6)
	outValue7 := buttonMatrix[selectedButton].getValueByMaster(masterState7)
	outValue8 := buttonMatrix[selectedButton].getValueByMaster(masterState8)
		
	;Gui, Add, Text, vPanelID x22 y19 w100 h20 , PanelID: %PanelID%							;Build the GUI to view and edit keymappings
	Gui, Add, Radio, -Wrap vPanelID x22 y15 h20 checked%Panel1% , Panel1
	Gui, Add, Radio, -Wrap x92 y15 h20 checked%rPanel2% , Panel2
	Gui, Add, Radio, -Wrap x162 y15 h20 checked%rPanel3% , Panel3
	Gui, Add, Radio, -Wrap x232 y15 h20 checked%rPanel4% , Panel4
	Gui, Add, Radio, -Wrap x22 y35 h20 checked%rPanel5% , Panel5
	Gui, Add, Radio, -Wrap x92 y35 h20 checked%rPanel6% , Panel6
	Gui, Add, Radio, -Wrap x162 y35 h20 checked%rPanel7% , Panel7
	Gui, Add, Radio, -Wrap x232 y35 h20 checked%rPanel8% , Panel8
	
	
	Gui, Add, Text, vselectedButton x22 y65 w100 h20 , Button: %selectedButton%

	Gui, Add, CheckBox, vcbMaster x142 y65 h20 checked%cbMaster% , Master
	Gui, Add, CheckBox, vcbContinuous x222 y65 h20 checked%cbContinuous% , Continuous

	Gui, Add, Button, vSelect x352 y19 w100 h30 , Select
	Gui, Add, Text, x22 y125 w100 h20 , 1:   %masterState1%
	Gui, Add, Text, x22 y155 w100 h20 , 2:   %masterState2%
	Gui, Add, Text, x22 y185 w100 h20 , 3:   %masterState3%
	Gui, Add, Text, x22 y215 w100 h20 , 4:   %masterState4%
	Gui, Add, Text, x22 y245 w100 h20 , 5:   %masterState5%
	Gui, Add, Text, x22 y275 w100 h20 , 6:   %masterState6%
	Gui, Add, Text, x22 y305 w100 h20 , 7:   %masterState7%
	Gui, Add, Text, x22 y335 w100 h20 , 8:   %masterState8%

	Gui, Add, Edit, vInValue1 x132 y125 w90 h20 , %outValue1%
	Gui, Add, Edit, vInValue2 x132 y155 w90 h20 , %outValue2%
	Gui, Add, Edit, vInValue3 x132 y185 w90 h20 , %outValue3%
	Gui, Add, Edit, vInValue4 x132 y215 w90 h20 , %outValue4%
	Gui, Add, Edit, vInValue5 x132 y245 w90 h20 , %outValue5%
	Gui, Add, Edit, vInValue6 x132 y275 w90 h20 , %outValue6%
	Gui, Add, Edit, vInValue7 x132 y305 w90 h20 , %outValue7%
	Gui, Add, Edit, vInValue8 x132 y335 w90 h20 , %outValue8%

	;********************************************    Requires functionality update to support
	;Gui, Add, CheckBox, vcbContinuous1 x232 y119 w100 h20 , %cbContinuous1%
	;Gui, Add, CheckBox, vcbContinuous2 x232 y149 w100 h20 , %cbContinuous2%
	;Gui, Add, CheckBox, vcbContinuous3 x232 y179 w100 h20 , %cbContinuous3%
	;Gui, Add, CheckBox, vcbContinuous4 x232 y209 w100 h20 , %cbContinuous4%
	;Gui, Add, CheckBox, vcbContinuous5 x232 y239 w100 h20 , %cbContinuous5%
	;Gui, Add, CheckBox, vcbContinuous6 x232 y269 w100 h20 , %cbContinuous6%
	;Gui, Add, CheckBox, vcbContinuous7 x232 y299 w100 h20 , %cbContinuous7%
	;Gui, Add, CheckBox, vcbContinuous8 x232 y329 w100 h20 , %cbContinuous8%
	;Gui, Add, Text, x232 y89 w90 h20 , Continuous:

	Gui, Add, Text, x132 y95 w90 h20 , Assigned Value:
	Gui, Add, Text, x22 y95 w100 h20 , Shift State:
	
	Gui, Add, Button, x352 y59 w100 h30 , Save
	Gui, Add, Button, x352 y99 w100 h30 , Cancel
		
																				; Push any changes in the values to the GUI
	
	;GuiControl,, panelID, PanelID: %PanelID%
	;GuiControl,, selectedButton, Button: %selectedButton%

	;GuiControl,, Label1, Master
	;GuiControl,, cbMaster, Master

	;GuiControl,, Label2, Continuous
	;GuiControl,, cbContinuous, Continuous
	
	;GuiControl,, 1:, 1: %masterState1%
	;GuiControl,, 2:, 2: %masterState2%
	;GuiControl,, 3:, 3: %masterState3%
	;GuiControl,, 4:, 4: %masterState4%
	;GuiControl,, 5:, 5: %masterState5%
	;GuiControl,, 6:, 6: %masterState6%
	;GuiControl,, 7:, 7: %masterState7%
	;GuiControl,, 8:, 8: %masterState8%

	;GuiControl,, inValue1, %outValue1%
	;GuiControl,, inValue2, %outValue2%
	;GuiControl,, inValue3, %outValue3%
	;GuiControl,, inValue4, %outValue4%
	;GuiControl,, inValue5, %outValue5%
	;GuiControl,, inValue6, %outValue6%
	;GuiControl,, inValue7, %outValue7%
;	GuiControl,, inValue8, %outValue8%
	
	Gui, Show, w479 h379, Input Mapping



	

	return




;*************************************************************************				Labels	

ButtonSave:
	gui, submit
	gui, destroy
	
	buttonMatrix[selectedButton].SetValueByMaster(inValue1, masterState1)
	if StrLen(masterState 2)
		buttonMatrix[selectedButton].SetValueByMaster(inValue2, masterState2)
	if StrLen(masterState 3)
		buttonMatrix[selectedButton].SetValueByMaster(inValue3, masterState3)
	if StrLen(masterState 4)
		buttonMatrix[selectedButton].SetValueByMaster(inValue4, masterState4)
	if StrLen(masterState 5)
		buttonMatrix[selectedButton].SetValueByMaster(inValue5, masterState5)
	if StrLen(masterState 6)
		buttonMatrix[selectedButton].SetValueByMaster(inValue6, masterState6)
	if StrLen(masterState 7)
		buttonMatrix[selectedButton].SetValueByMaster(inValue7, masterState7)
	if StrLen(masterState 8)
		buttonMatrix[selectedButton].SetValueByMaster(inValue8, masterState8)
	
	buttonMatrix[selectedButton].SetContinuous(cbContinuous)
	
	if (oldMaster = 0 and cbMaster = 1)																;Figure out if the master state has changed and if it has make the change to the button Object
	{
		index := 0
		Loop 8
		{
			index := index + 1
			if !buttonMatrix[selectedButton].getMasterByRef(index) 
				break
		}
		buttonMatrix[selectedButton].SetMaster(selectedButton, index)
	}else if (oldMaster = 1 and cbMaster = 0)
	{
		index := 0
		Loop 8
		{
			index := index + 1
			if (buttonMatrix[selectedButton].getMasterByRef(index) = selectedButton)
				break
		}
		buttonMatrix[selectedButton].RemoveMaster(selectedButton, index)
	}
	
	if (strlen(PanelID) < 2)
		PanelID := "Panel" . PanelID
	
	if !(oldPanelID = PanelID)
		buttonMatrix[selectedButton].ChangePanel(PanelID)
	
	goto ResetInputGui
	
GuiClose:
	gui, Destroy
	ExitApp

ButtonCancel:
if select
{
	gui, Destroy
	goto ResetInputGui
}else
{
	gui, Destroy
	goto GuiExit
}

ButtonSelect:
	select := 1
	gui, Destroy																; Get rid of the interactive GUI and create a temporary window while waiting for a button push
	Gui, Add, Text, x12 y9 w120 h30 +Center, Push Button to set up.
	Gui, Add, Button, vcancel2 x22 y49 w100 h30 , Cancel
	Gui, Show, w147 h95, Holding GUI
	
	
	oldInput := selectedButton													; Store the old value to make sure a duplicate is not being selected
	selectedButton := ""														; wipe the var to re-select
	
	vStickNum := 0																; set the joystick number for the initial loop
	
	Outer:																		; Loop thorugh each of the possible 16 joysticks until the button being pressed is found
		While !strLen(selectedButton) 											
		{	
			;msgbox 0, Loop, While Enter
		
			vStickNum := vStickNum + 1											; Set the Joystick number for this itteration of the loop
			if vStickNum > 16													; If the loop is at 17, reset back to 1
			{
				vStickNum := 1
			}
			
			GetKeyState, rawPOV, %vStickNum%JoyPOV								; Check if the POV/hat is being pressed and then report it out
			if rawPOV < 0   ; No angle to report
				selectedButton := ""
			else if rawPOV > 31501                 								; 315 to 360 degrees: Forward
				selectedButton := vStickNum . "JoyPOVUp"
			else if rawPOV between 1 and 4500      								; 0 to 45 degrees: Forward
				selectedButton := vStickNum . "JoyPOVUp"
			else if rawPOV between 4501 and 13500  								; 45 to 135 degrees: Right
				selectedButton := vStickNum . "JoyPOVRight"
			else if rawPOV between 13501 and 22500 								; 135 to 225 degrees: Down
				selectedButton := vStickNum . "JoyPOVDown"
			else if rawPOV between 22501 and 31500   							; 225 to 315 degrees: Left
				selectedButton := vStickNum . "JoyPOVLeft"
			If selectedButton and (oldInput != selectedButton)					; If the button has been found and is not the same as the previous selection save it and return to the GUI
			{
				Gui, destroy													; Close the temp window
				break
			}else
			{
				selectedButton := ""
			}
			
			vloopIndex := 0														; Create an index to use inside the loop
			Loop 32 															; Loop through each of the 32 buttons on each Joystick
			{
				vloopIndex := vloopIndex +1										; increment the index for each itteration of the loop
				GetKeyState selectedButtonTest, %vStickNum%Joy%vloopIndex%		; Test the current button
				if selectedButtonTest = D										; check if the button is down
				{
					sleep 15													; wait for 15 miliseconds
					GetKeyState selectedButtonTest, %vStickNum%Joy%vloopIndex%	; Test the input again to see if it is still down, this should prevent ghosted inputs from being passed along
					if selectedButtonTest = D									
					{
						selectedButton :=	vStickNum . "Joy" . vloopIndex		; Store the current button to be passed back to the GUI
						If (oldInput != selectedButton)							; If the button has been found and is not the same as the previous selection save it and return to the GUI
						{
							Gui, destroy										; Close the temp window
							break
						}else
						{
							selectedButton := ""								; since the input selected is the same as the last one selected skip it, this prevents always on buttons/switches from stopping the search
						}
					}
				}
			}
		}

	gui destroy																; The loop is done and an input should be selected, close the temp window
	goto ResetInputGui
	
	
	

	
