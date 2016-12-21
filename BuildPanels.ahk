;Build panels



;*******************************************************************************************************************
;Create Panel 1
Panel1 := object()
Panel1 := new VPANEL("Panel1")

Panel1.JoystickID :=1
Panel1.addMaster("default",1)

PanelMatrix["Panel1"] := Panel1

(Panel1.vButtons)["1Joy1"] := new VBUTTON(Panel1,1,0,0,"1",30)
buttonMatrix["1Joy1"] := (Panel1.vButtons)["1Joy1"]

(Panel1.vButtons)["1Joy2"] := new VBUTTON(Panel1,2,0,0,"2",30)
buttonMatrix["1Joy2"] := (Panel1.vButtons)["1Joy2"]

(Panel1.vButtons)["1Joy3"] := new VBUTTON(Panel1,3,0,0,"3",30)
buttonMatrix["1Joy3"] := (Panel1.vButtons)["1Joy3"]

(Panel1.vButtons)["1Joy4"] := new VBUTTON(Panel1,4,0,0,"4",30)
buttonMatrix["1Joy4"] := (Panel1.vButtons)["1Joy4"]

(Panel1.vButtons)["1Joy5"] := new VBUTTON(Panel1,5,0,0,"5",30)
buttonMatrix["1Joy5"] := (Panel1.vButtons)["1Joy5"]

(Panel1.vButtons)["1Joy6"] := new VBUTTON(Panel1,6,0,0,"6",30)
buttonMatrix["1Joy6"] := (Panel1.vButtons)["1Joy6"]

(Panel1.vButtons)["1Joy7"] := new VBUTTON(Panel1,7,0,0,"7",30)
buttonMatrix["1Joy7"] := (Panel1.vButtons)["1Joy7"]

(Panel1.vButtons)["1Joy8"] := new VBUTTON(Panel1,8,0,0,"8",30)
buttonMatrix["1Joy8"] := (Panel1.vButtons)["1Joy8"]

(Panel1.vButtons)["1Joy9"] := new VBUTTON(Panel1,9,0,0,"9",30)
buttonMatrix["1Joy9"] := (Panel1.vButtons)["1Joy9"]

(Panel1.vButtons)["1Joy10"] := new VBUTTON(Panel1,10,0,0,"10",30)
buttonMatrix["1Joy10"] := (Panel1.vButtons)["1Joy10"]

(Panel1.vButtons)["1Joy11"] := new VBUTTON(Panel1,11,0,0,"11",30)
buttonMatrix["1Joy11"] := (Panel1.vButtons)["1Joy11"]

(Panel1.vButtons)["1Joy12"] := new VBUTTON(Panel1,12,0,0,"12",30)
buttonMatrix["1Joy12"] := (Panel1.vButtons)["1Joy12"]

(Panel1.vButtons)["1Joy13"] := new VBUTTON(Panel1,13,0,0,"13",30)
buttonMatrix["1Joy13"] := (Panel1.vButtons)["1Joy13"]

(Panel1.vButtons)["1Joy14"] := new VBUTTON(Panel1,14,0,0,"14",30)
buttonMatrix["1Joy14"] := (Panel1.vButtons)["1Joy14"]

(Panel1.vButtons)["1Joy15"] := new VBUTTON(Panel1,15,0,0,"15",30)
buttonMatrix["1Joy15"] := (Panel1.vButtons)["1Joy15"]

(Panel1.vButtons)["1Joy16"] := new VBUTTON(Panel1,16,0,0,"16",30)
buttonMatrix["1Joy16"] := (Panel1.vButtons)["1Joy16"]

(Panel1.vButtons)["1Joy17"] := new VBUTTON(Panel1,17,0,0,"17",30)
buttonMatrix["1Joy17"] := (Panel1.vButtons)["1Joy17"]

(Panel1.vButtons)["1Joy18"] := new VBUTTON(Panel1,18,0,0,"18",30)
buttonMatrix["1Joy18"] := (Panel1.vButtons)["1Joy18"]

(Panel1.vButtons)["1Joy19"] := new VBUTTON(Panel1,19,0,0,"19",30)
buttonMatrix["1Joy19"] := (Panel1.vButtons)["1Joy19"]

(Panel1.vButtons)["1Joy20"] := new VBUTTON(Panel1,20,0,0,"20",30)
buttonMatrix["1Joy20"] := (Panel1.vButtons)["1Joy20"]

(Panel1.vButtons)["1Joy21"] := new VBUTTON(Panel1,21,0,0,"21",30)
buttonMatrix["1Joy21"] := (Panel1.vButtons)["1Joy21"]

(Panel1.vButtons)["1Joy22"] := new VBUTTON(Panel1,22,0,0,"22",30)
buttonMatrix["1Joy22"] := (Panel1.vButtons)["1Joy22"]

(Panel1.vButtons)["1Joy23"] := new VBUTTON(Panel1,23,0,0,"23",30)
buttonMatrix["1Joy23"] := (Panel1.vButtons)["1Joy23"]

(Panel1.vButtons)["1Joy24"] := new VBUTTON(Panel1,24,0,0,"24",30)
buttonMatrix["1Joy24"] := (Panel1.vButtons)["1Joy24"]

(Panel1.vButtons)["1Joy25"] := new VBUTTON(Panel1,25,0,0,"25",30)
buttonMatrix["1Joy25"] := (Panel1.vButtons)["1Joy25"]

(Panel1.vButtons)["1Joy26"] := new VBUTTON(Panel1,26,0,0,"26",30)
buttonMatrix["1Joy26"] := (Panel1.vButtons)["1Joy26"]

(Panel1.vButtons)["1Joy27"] := new VBUTTON(Panel1,27,0,0,"27",30)
buttonMatrix["1Joy27"] := (Panel1.vButtons)["1Joy27"]

(Panel1.vButtons)["1Joy28"] := new VBUTTON(Panel1,28,0,0,"28",30)
buttonMatrix["1Joy28"] := (Panel1.vButtons)["1Joy28"]

(Panel1.vButtons)["1Joy29"] := new VBUTTON(Panel1,29,0,0,"29",30)
buttonMatrix["1Joy29"] := (Panel1.vButtons)["1Joy29"]

(Panel1.vButtons)["1Joy30"] := new VBUTTON(Panel1,30,0,0,"30",30)
buttonMatrix["1Joy30"] := (Panel1.vButtons)["1Joy30"]

(Panel1.vButtons)["1Joy31"] := new VBUTTON(Panel1,31,0,0,"31",30)
buttonMatrix["1Joy31"] := (Panel1.vButtons)["1Joy31"]

(Panel1.vButtons)["1Joy32"] := new VBUTTON(Panel1,32,0,0,"32",30)
buttonMatrix["1Joy32"] := (Panel1.vButtons)["1Joy32"]

(Panel1.vButtons)["1JoyPOVUp"] := new VBUTTON(Panel1,29,0,0,"33",30)
buttonMatrix["1JoyPOVUp"] := (Panel1.vButtons)["1JoyPOVUp"]

(Panel1.vButtons)["1JoyPOVRight"] := new VBUTTON(Panel1,30,0,0,"33",30)
buttonMatrix["1JoyPOVRight"] := (Panel1.vButtons)["1JoyPOVRight"]

(Panel1.vButtons)["1JoyPOVDown"] := new VBUTTON(Panel1,29,0,0,"34",30)
buttonMatrix["1JoyPOVDown"] := (Panel1.vButtons)["1JoyPOVDown"]

(Panel1.vButtons)["1JoyPOVLeft"] := new VBUTTON(Panel1,30,0,0,"35",30)
buttonMatrix["1JoyPOVLeft"] := (Panel1.vButtons)["1JoyPOVLeft"]


;MsgBox, 0, Panel, Panel 2

;Create Panel 2
Panel2 := object()
Panel2 := new VPANEL("Panel2")

Panel2.JoystickID :=2
Panel2.addMaster("default",1)

PanelMatrix["Panel2"] := Panel2

(Panel2.vButtons)["2Joy1"] := new VBUTTON(Panel2,1,0,0,"1",30)
buttonMatrix["2Joy1"] := (Panel2.vButtons)["2Joy1"]

(Panel2.vButtons)["2Joy2"] := new VBUTTON(Panel2,2,0,0,"2",30)
buttonMatrix["2Joy2"] := (Panel2.vButtons)["2Joy2"]

(Panel2.vButtons)["2Joy3"] := new VBUTTON(Panel2,3,0,0,"3",30)
buttonMatrix["2Joy3"] := (Panel2.vButtons)["2Joy3"]

(Panel2.vButtons)["2Joy4"] := new VBUTTON(Panel2,4,0,0,"a",30)
buttonMatrix["2Joy4"] := (Panel2.vButtons)["2Joy4"]

(Panel2.vButtons)["2Joy5"] := new VBUTTON(Panel2,5,0,0,"{Volume_Down}",30)
buttonMatrix["2Joy5"] := (Panel2.vButtons)["2Joy5"]

(Panel2.vButtons)["2Joy6"] := new VBUTTON(Panel2,6,0,0,"",30)
buttonMatrix["2Joy6"] := (Panel2.vButtons)["2Joy6"]

(Panel2.vButtons)["2Joy7"] := new VBUTTON(Panel2,7,0,0,"4",30)
buttonMatrix["2Joy7"] := (Panel2.vButtons)["2Joy7"]

(Panel2.vButtons)["2Joy8"] := new VBUTTON(Panel2,8,0,0,"5",30)
buttonMatrix["2Joy8"] := (Panel2.vButtons)["2Joy8"]

(Panel2.vButtons)["2Joy9"] := new VBUTTON(Panel2,9,0,0,"6",30)
buttonMatrix["2Joy9"] := (Panel2.vButtons)["2Joy9"]

(Panel2.vButtons)["2Joy10"] := new VBUTTON(Panel2,10,0,0,"b",30)
buttonMatrix["2Joy10"] := (Panel2.vButtons)["2Joy10"]

(Panel2.vButtons)["2Joy11"] := new VBUTTON(Panel2,11,0,0,"",30)
buttonMatrix["2Joy11"] := (Panel2.vButtons)["2Joy11"]

(Panel2.vButtons)["2Joy12"] := new VBUTTON(Panel2,12,0,0,"",30)
buttonMatrix["2Joy12"] := (Panel2.vButtons)["2Joy12"]

(Panel2.vButtons)["2Joy13"] := new VBUTTON(Panel2,13,0,0,"7",30)
buttonMatrix["2Joy13"] := (Panel2.vButtons)["2Joy13"]

(Panel2.vButtons)["2Joy14"] := new VBUTTON(Panel2,14,0,0,"8",30)
buttonMatrix["2Joy14"] := (Panel2.vButtons)["2Joy14"]

(Panel2.vButtons)["2Joy15"] := new VBUTTON(Panel2,15,0,0,"9",30)
buttonMatrix["2Joy15"] := (Panel2.vButtons)["2Joy15"]

(Panel2.vButtons)["2Joy16"] := new VBUTTON(Panel2,16,0,0,"c",30)
buttonMatrix["2Joy16"] := (Panel2.vButtons)["2Joy16"]

(Panel2.vButtons)["2Joy17"] := new VBUTTON(Panel2,17,0,0,"",30)
buttonMatrix["2Joy17"] := (Panel2.vButtons)["2Joy17"]

(Panel2.vButtons)["2Joy18"] := new VBUTTON(Panel2,18,0,0,"",30)
buttonMatrix["2Joy18"] := (Panel2.vButtons)["2Joy18"]

(Panel2.vButtons)["2Joy19"] := new VBUTTON(Panel2,19,0,0,"{NumpadMult}",30)
buttonMatrix["2Joy19"] := (Panel2.vButtons)["2Joy19"]

(Panel2.vButtons)["2Joy20"] := new VBUTTON(Panel2,20,0,0,"0",30)
buttonMatrix["2Joy20"] := (Panel2.vButtons)["2Joy20"]

(Panel2.vButtons)["2Joy21"] := new VBUTTON(Panel2,21,0,0,"{#}",30)
buttonMatrix["2Joy21"] := (Panel2.vButtons)["2Joy21"]

(Panel2.vButtons)["2Joy22"] := new VBUTTON(Panel2,22,0,0,"d",30)
buttonMatrix["2Joy22"] := (Panel2.vButtons)["2Joy22"]

(Panel2.vButtons)["2Joy23"] := new VBUTTON(Panel2,23,0,0,"{Launch_Media}",30)
buttonMatrix["2Joy23"] := (Panel2.vButtons)["2Joy23"]

(Panel2.vButtons)["2Joy24"] := new VBUTTON(Panel2,24,0,0,"",30)
buttonMatrix["2Joy24"] := (Panel2.vButtons)["2Joy24"]

(Panel2.vButtons)["2Joy25"] := new VBUTTON(Panel2,25,0,0,"{Media_Play_Pause}",30)
buttonMatrix["2Joy25"] := (Panel2.vButtons)["2Joy25"]

(Panel2.vButtons)["2Joy26"] := new VBUTTON(Panel2,26,0,0,"",30)
buttonMatrix["2Joy26"] := (Panel2.vButtons)["2Joy26"]

(Panel2.vButtons)["2Joy27"] := new VBUTTON(Panel2,27,0,0,"",30)
buttonMatrix["2Joy27"] := (Panel2.vButtons)["2Joy27"]

(Panel2.vButtons)["2Joy28"] := new VBUTTON(Panel2,28,0,0,"{Volume_Up}",30)
buttonMatrix["2Joy28"] := (Panel2.vButtons)["2Joy28"]

(Panel2.vButtons)["2Joy29"] := new VBUTTON(Panel2,29,0,0,"",30)
buttonMatrix["2Joy29"] := (Panel2.vButtons)["2Joy29"]

(Panel2.vButtons)["2Joy30"] := new VBUTTON(Panel2,30,0,0,"",30)
buttonMatrix["2Joy30"] := (Panel2.vButtons)["2Joy30"]

(Panel2.vButtons)["2Joy31"] := new VBUTTON(Panel2,31,0,0,"",30)
buttonMatrix["2Joy31"] := (Panel2.vButtons)["2Joy31"]

(Panel2.vButtons)["2Joy32"] := new VBUTTON(Panel2,32,0,0,"",30)
buttonMatrix["2Joy32"] := (Panel2.vButtons)["2Joy32"]

(Panel1.vButtons)["2JoyPOVUp"] := new VBUTTON(2Panel,29,0,0,"33",30)
buttonMatrix["2JoyPOVUp"] := (Panel2.vButtons)["2JoyPOVUp"]

(Panel1.vButtons)["2JoyPOVRight"] := new VBUTTON(Panel2,30,0,0,"33",30)
buttonMatrix["2JoyPOVRight"] := (Panel2.vButtons)["2JoyPOVRight"]

(Panel1.vButtons)["2JoyPOVDown"] := new VBUTTON(Panel2,29,0,0,"34",30)
buttonMatrix["2JoyPOVDown"] := (Panel2.vButtons)["2JoyPOVDown"]

(Panel1.vButtons)["2JoyPOVLeft"] := new VBUTTON(Panel2,30,0,0,"35",30)
buttonMatrix["2JoyPOVLeft"] := (Panel2.vButtons)["2JoyPOVLeft"]


;MsgBox, 0, Panel, Panel 3

;Create Panel 3
Panel3 := object()
Panel3 := new VPANEL("Panel3")

Panel3.JoystickID :=3
Panel3.addMaster("default",1)

PanelMatrix["Panel3"] := Panel3

(Panel3.vButtons)["3Joy1"] := new VBUTTON(Panel3,1,0,0,"1",30)
buttonMatrix["3Joy1"] := (Panel3.vButtons)["3Joy1"]

(Panel3.vButtons)["3Joy2"] := new VBUTTON(Panel3,2,0,0,"2",30)
buttonMatrix["3Joy2"] := (Panel3.vButtons)["3Joy2"]

(Panel3.vButtons)["3Joy3"] := new VBUTTON(Panel3,3,0,0,"3",30)
buttonMatrix["3Joy3"] := (Panel3.vButtons)["3Joy3"]

(Panel3.vButtons)["3Joy4"] := new VBUTTON(Panel3,4,0,0,"4",30)
buttonMatrix["3Joy4"] := (Panel3.vButtons)["3Joy4"]

(Panel3.vButtons)["3Joy5"] := new VBUTTON(Panel3,5,0,0,"5",30)
buttonMatrix["3Joy5"] := (Panel3.vButtons)["3Joy5"]

(Panel3.vButtons)["3Joy6"] := new VBUTTON(Panel3,6,0,0,"6",30)
buttonMatrix["3Joy6"] := (Panel3.vButtons)["3Joy6"]

(Panel3.vButtons)["3Joy7"] := new VBUTTON(Panel3,7,0,0,"7",30)
buttonMatrix["3Joy7"] := (Panel3.vButtons)["3Joy7"]

(Panel3.vButtons)["3Joy8"] := new VBUTTON(Panel3,8,0,0,"8",30)
buttonMatrix["3Joy8"] := (Panel3.vButtons)["3Joy8"]

(Panel3.vButtons)["3Joy9"] := new VBUTTON(Panel3,9,0,0,"9",30)
buttonMatrix["3Joy9"] := (Panel3.vButtons)["3Joy9"]

(Panel3.vButtons)["3Joy10"] := new VBUTTON(Panel3,10,0,0,"10",30)
buttonMatrix["3Joy10"] := (Panel3.vButtons)["3Joy10"]

(Panel3.vButtons)["3Joy11"] := new VBUTTON(Panel3,11,0,0,"11",30)
buttonMatrix["3Joy11"] := (Panel3.vButtons)["3Joy11"]

(Panel3.vButtons)["3Joy12"] := new VBUTTON(Panel3,12,0,0,"12",30)
buttonMatrix["3Joy12"] := (Panel3.vButtons)["3Joy12"]

(Panel3.vButtons)["3Joy13"] := new VBUTTON(Panel3,13,0,0,"13",30)
buttonMatrix["3Joy13"] := (Panel3.vButtons)["3Joy13"]

(Panel3.vButtons)["3Joy14"] := new VBUTTON(Panel3,14,0,0,"14",30)
buttonMatrix["3Joy14"] := (Panel3.vButtons)["3Joy14"]

(Panel3.vButtons)["3Joy15"] := new VBUTTON(Panel3,15,0,0,"15",30)
buttonMatrix["3Joy15"] := (Panel3.vButtons)["3Joy15"]

(Panel3.vButtons)["3Joy16"] := new VBUTTON(Panel3,16,0,0,"16",30)
buttonMatrix["3Joy16"] := (Panel3.vButtons)["3Joy16"]

(Panel3.vButtons)["3Joy17"] := new VBUTTON(Panel3,17,0,0,"17",30)
buttonMatrix["3Joy17"] := (Panel3.vButtons)["3Joy17"]

(Panel3.vButtons)["3Joy18"] := new VBUTTON(Panel3,18,0,0,"18",30)
buttonMatrix["3Joy18"] := (Panel3.vButtons)["3Joy18"]

(Panel3.vButtons)["3Joy19"] := new VBUTTON(Panel3,19,0,0,"19",30)
buttonMatrix["3Joy19"] := (Panel3.vButtons)["3Joy19"]

(Panel3.vButtons)["3Joy20"] := new VBUTTON(Panel3,20,0,0,"20",30)
buttonMatrix["3Joy20"] := (Panel3.vButtons)["3Joy20"]

(Panel3.vButtons)["3Joy21"] := new VBUTTON(Panel3,21,0,0,"21",30)
buttonMatrix["3Joy21"] := (Panel3.vButtons)["3Joy21"]

(Panel3.vButtons)["3Joy22"] := new VBUTTON(Panel3,22,0,0,"22",30)
buttonMatrix["3Joy22"] := (Panel3.vButtons)["3Joy22"]

(Panel3.vButtons)["3Joy23"] := new VBUTTON(Panel3,23,0,0,"23",30)
buttonMatrix["3Joy23"] := (Panel3.vButtons)["3Joy23"]

(Panel3.vButtons)["3Joy24"] := new VBUTTON(Panel3,24,0,0,"24",30)
buttonMatrix["3Joy24"] := (Panel3.vButtons)["3Joy24"]

(Panel3.vButtons)["3Joy25"] := new VBUTTON(Panel3,25,0,0,"25",30)
buttonMatrix["3Joy25"] := (Panel3.vButtons)["3Joy25"]

(Panel3.vButtons)["3Joy26"] := new VBUTTON(Panel3,26,0,0,"26",30)
buttonMatrix["3Joy26"] := (Panel3.vButtons)["3Joy26"]

(Panel3.vButtons)["3Joy27"] := new VBUTTON(Panel3,27,0,0,"27",30)
buttonMatrix["3Joy27"] := (Panel3.vButtons)["3Joy27"]

(Panel3.vButtons)["3Joy28"] := new VBUTTON(Panel3,28,0,0,"28",30)
buttonMatrix["3Joy28"] := (Panel3.vButtons)["3Joy28"]

(Panel3.vButtons)["3Joy29"] := new VBUTTON(Panel3,29,0,0,"29",30)
buttonMatrix["3Joy29"] := (Panel3.vButtons)["3Joy29"]

(Panel3.vButtons)["3Joy30"] := new VBUTTON(Panel3,30,0,0,"30",30)
buttonMatrix["3Joy30"] := (Panel3.vButtons)["3Joy30"]

(Panel3.vButtons)["3Joy31"] := new VBUTTON(Panel3,31,0,0,"31",30)
buttonMatrix["3Joy31"] := (Panel3.vButtons)["3Joy31"]

(Panel3.vButtons)["3Joy32"] := new VBUTTON(Panel3,32,0,0,"32",30)
buttonMatrix["3Joy32"] := (Panel3.vButtons)["3Joy32"]

(Panel1.vButtons)["3JoyPOVUp"] := new VBUTTON(Panel3,29,0,0,"33",30)
buttonMatrix["3JoyPOVUp"] := (Panel3.vButtons)["3JoyPOVUp"]

(Panel1.vButtons)["3JoyPOVRight"] := new VBUTTON(Panel3,30,0,0,"33",30)
buttonMatrix["3JoyPOVRight"] := (Panel3.vButtons)["3JoyPOVRight"]

(Panel1.vButtons)["3JoyPOVDown"] := new VBUTTON(Panel3,29,0,0,"34",30)
buttonMatrix["3JoyPOVDown"] := (Panel3.vButtons)["3JoyPOVDown"]

(Panel1.vButtons)["3JoyPOVLeft"] := new VBUTTON(Panel3,30,0,0,"35",30)
buttonMatrix["3JoyPOVLeft"] := (Panel3.vButtons)["3JoyPOVLeft"]



;MsgBox, 0, Panel, Panel 4

;Create Panel 4
Panel4 := object()
Panel4 := new VPANEL("Panel4")

Panel4.JoystickID :=4
Panel4.addMaster("default",1)

PanelMatrix["Panel4"] := Panel4

(Panel4.vButtons)["4Joy1"] := new VBUTTON(Panel4,1,0,0,"1",30)
buttonMatrix["4Joy1"] := (Panel4.vButtons)["4Joy1"]

(Panel4.vButtons)["4Joy2"] := new VBUTTON(Panel4,2,0,0,"2",30)
buttonMatrix["4Joy2"] := (Panel4.vButtons)["4Joy2"]

(Panel4.vButtons)["4Joy3"] := new VBUTTON(Panel4,3,0,0,"3",30)
buttonMatrix["4Joy3"] := (Panel4.vButtons)["4Joy3"]

(Panel4.vButtons)["4Joy4"] := new VBUTTON(Panel4,4,0,0,"4",30)
buttonMatrix["4Joy4"] := (Panel4.vButtons)["4Joy4"]

(Panel4.vButtons)["4Joy5"] := new VBUTTON(Panel4,5,0,0,"5",30)
buttonMatrix["4Joy5"] := (Panel4.vButtons)["4Joy5"]

(Panel4.vButtons)["4Joy6"] := new VBUTTON(Panel4,6,0,0,"6",30)
buttonMatrix["4Joy6"] := (Panel4.vButtons)["4Joy6"]

(Panel4.vButtons)["4Joy7"] := new VBUTTON(Panel4,7,0,0,"7",30)
buttonMatrix["4Joy7"] := (Panel4.vButtons)["4Joy7"]

(Panel4.vButtons)["4Joy8"] := new VBUTTON(Panel4,8,0,0,"8",30)
buttonMatrix["4Joy8"] := (Panel4.vButtons)["4Joy8"]

(Panel4.vButtons)["4Joy9"] := new VBUTTON(Panel4,9,0,0,"9",30)
buttonMatrix["4Joy9"] := (Panel4.vButtons)["4Joy9"]

(Panel4.vButtons)["4Joy10"] := new VBUTTON(Panel4,10,0,0,"10",30)
buttonMatrix["4Joy10"] := (Panel4.vButtons)["4Joy10"]

(Panel4.vButtons)["4Joy11"] := new VBUTTON(Panel4,11,0,0,"11",30)
buttonMatrix["4Joy11"] := (Panel4.vButtons)["4Joy11"]

(Panel4.vButtons)["4Joy12"] := new VBUTTON(Panel4,12,0,0,"12",30)
buttonMatrix["4Joy12"] := (Panel4.vButtons)["4Joy12"]

(Panel4.vButtons)["4Joy13"] := new VBUTTON(Panel4,13,0,0,"13",30)
buttonMatrix["4Joy13"] := (Panel4.vButtons)["4Joy13"]

(Panel4.vButtons)["4Joy14"] := new VBUTTON(Panel4,14,0,0,"14",30)
buttonMatrix["4Joy14"] := (Panel4.vButtons)["4Joy14"]

(Panel4.vButtons)["4Joy15"] := new VBUTTON(Panel4,15,0,0,"15",30)
buttonMatrix["4Joy15"] := (Panel4.vButtons)["4Joy15"]

(Panel4.vButtons)["4Joy16"] := new VBUTTON(Panel4,16,0,0,"16",30)
buttonMatrix["4Joy16"] := (Panel4.vButtons)["4Joy16"]

(Panel4.vButtons)["4Joy17"] := new VBUTTON(Panel4,17,0,0,"17",30)
buttonMatrix["4Joy17"] := (Panel4.vButtons)["4Joy17"]

(Panel4.vButtons)["4Joy18"] := new VBUTTON(Panel4,18,0,0,"18",30)
buttonMatrix["4Joy18"] := (Panel4.vButtons)["4Joy18"]

(Panel4.vButtons)["4Joy19"] := new VBUTTON(Panel4,19,0,0,"19",30)
buttonMatrix["4Joy19"] := (Panel4.vButtons)["4Joy19"]

(Panel4.vButtons)["4Joy20"] := new VBUTTON(Panel4,20,0,0,"20",30)
buttonMatrix["4Joy20"] := (Panel4.vButtons)["4Joy20"]

(Panel4.vButtons)["4Joy21"] := new VBUTTON(Panel4,21,0,0,"21",30)
buttonMatrix["4Joy21"] := (Panel4.vButtons)["4Joy21"]

(Panel4.vButtons)["4Joy22"] := new VBUTTON(Panel4,22,0,0,"22",30)
buttonMatrix["4Joy22"] := (Panel4.vButtons)["4Joy22"]

(Panel4.vButtons)["4Joy23"] := new VBUTTON(Panel4,23,0,0,"23",30)
buttonMatrix["4Joy23"] := (Panel4.vButtons)["4Joy23"]

(Panel4.vButtons)["4Joy24"] := new VBUTTON(Panel4,24,0,0,"24",30)
buttonMatrix["4Joy24"] := (Panel4.vButtons)["4Joy24"]

(Panel4.vButtons)["4Joy25"] := new VBUTTON(Panel4,25,0,0,"25",30)
buttonMatrix["4Joy25"] := (Panel4.vButtons)["4Joy25"]

(Panel4.vButtons)["4Joy26"] := new VBUTTON(Panel4,26,0,0,"26",30)
buttonMatrix["4Joy26"] := (Panel4.vButtons)["4Joy26"]

(Panel4.vButtons)["4Joy27"] := new VBUTTON(Panel4,27,0,0,"27",30)
buttonMatrix["4Joy27"] := (Panel4.vButtons)["4Joy27"]

(Panel4.vButtons)["4Joy28"] := new VBUTTON(Panel4,28,0,0,"28",30)
buttonMatrix["4Joy28"] := (Panel4.vButtons)["4Joy28"]

(Panel4.vButtons)["4Joy29"] := new VBUTTON(Panel4,29,0,0,"29",30)
buttonMatrix["4Joy29"] := (Panel4.vButtons)["4Joy29"]

(Panel4.vButtons)["4Joy30"] := new VBUTTON(Panel4,30,0,0,"30",30)
buttonMatrix["4Joy30"] := (Panel4.vButtons)["4Joy30"]

(Panel4.vButtons)["4Joy31"] := new VBUTTON(Panel4,31,0,0,"31",30)
buttonMatrix["4Joy31"] := (Panel4.vButtons)["4Joy31"]

(Panel4.vButtons)["4Joy32"] := new VBUTTON(Panel4,32,0,0,"32",30)
buttonMatrix["4Joy32"] := (Panel4.vButtons)["4Joy32"]

(Panel1.vButtons)["4JoyPOVUp"] := new VBUTTON(Panel4,29,0,0,"33",30)
buttonMatrix["4JoyPOVUp"] := (Panel4.vButtons)["4JoyPOVUp"]

(Panel1.vButtons)["4JoyPOVRight"] := new VBUTTON(Panel4,30,0,0,"33",30)
buttonMatrix["4JoyPOVRight"] := (Panel4.vButtons)["4JoyPOVRight"]

(Panel1.vButtons)["4JoyPOVDown"] := new VBUTTON(Panel4,29,0,0,"34",30)
buttonMatrix["4JoyPOVDown"] := (Panel4.vButtons)["4JoyPOVDown"]

(Panel1.vButtons)["4JoyPOVLeft"] := new VBUTTON(Panel4,30,0,0,"35",30)
buttonMatrix["4JoyPOVLeft"] := (Panel4.vButtons)["4JoyPOVLeft"]



;MsgBox, 0, Panel, Panel 5


;Create Panel 5
Panel5 := object()
Panel5 := new VPANEL("Panel5")

Panel5.JoystickID :=5
Panel5.addMaster("default",1)

PanelMatrix["Panel5"] := Panel5

(Panel5.vButtons)["5Joy1"] := new VBUTTON(Panel5,1,0,0,"1",30)
buttonMatrix["5Joy1"] := (Panel5.vButtons)["5Joy1"]

(Panel5.vButtons)["5Joy2"] := new VBUTTON(Panel5,2,0,0,"2",30)
buttonMatrix["5Joy2"] := (Panel5.vButtons)["5Joy2"]

(Panel5.vButtons)["5Joy3"] := new VBUTTON(Panel5,3,0,0,"3",30)
buttonMatrix["5Joy3"] := (Panel5.vButtons)["5Joy3"]

(Panel5.vButtons)["5Joy4"] := new VBUTTON(Panel5,4,0,0,"4",30)
buttonMatrix["5Joy4"] := (Panel5.vButtons)["5Joy4"]

(Panel5.vButtons)["5Joy5"] := new VBUTTON(Panel5,5,0,0,"5",30)
buttonMatrix["5Joy5"] := (Panel5.vButtons)["5Joy5"]

(Panel5.vButtons)["5Joy6"] := new VBUTTON(Panel5,6,0,0,"6",30)
buttonMatrix["5Joy6"] := (Panel5.vButtons)["5Joy6"]

(Panel5.vButtons)["5Joy7"] := new VBUTTON(Panel5,7,0,0,"7",30)
buttonMatrix["5Joy7"] := (Panel5.vButtons)["5Joy7"]

(Panel5.vButtons)["5Joy8"] := new VBUTTON(Panel5,8,0,0,"8",30)
buttonMatrix["5Joy8"] := (Panel5.vButtons)["5Joy8"]

(Panel5.vButtons)["5Joy9"] := new VBUTTON(Panel5,9,0,0,"9",30)
buttonMatrix["5Joy9"] := (Panel5.vButtons)["5Joy9"]

(Panel5.vButtons)["5Joy10"] := new VBUTTON(Panel5,10,0,0,"10",30)
buttonMatrix["5Joy10"] := (Panel5.vButtons)["5Joy10"]

(Panel5.vButtons)["5Joy11"] := new VBUTTON(Panel5,11,0,0,"11",30)
buttonMatrix["5Joy11"] := (Panel5.vButtons)["5Joy11"]

(Panel5.vButtons)["5Joy12"] := new VBUTTON(Panel5,12,0,0,"12",30)
buttonMatrix["5Joy12"] := (Panel5.vButtons)["5Joy12"]

(Panel5.vButtons)["5Joy13"] := new VBUTTON(Panel5,13,0,0,"13",30)
buttonMatrix["5Joy13"] := (Panel5.vButtons)["5Joy13"]

(Panel5.vButtons)["5Joy14"] := new VBUTTON(Panel5,14,0,0,"14",30)
buttonMatrix["5Joy14"] := (Panel5.vButtons)["5Joy14"]

(Panel5.vButtons)["5Joy15"] := new VBUTTON(Panel5,15,0,0,"15",30)
buttonMatrix["5Joy15"] := (Panel5.vButtons)["5Joy15"]

(Panel5.vButtons)["5Joy16"] := new VBUTTON(Panel5,16,0,0,"16",30)
buttonMatrix["5Joy16"] := (Panel5.vButtons)["5Joy16"]

(Panel5.vButtons)["5Joy17"] := new VBUTTON(Panel5,17,0,0,"17",30)
buttonMatrix["5Joy17"] := (Panel5.vButtons)["5Joy17"]

(Panel5.vButtons)["5Joy18"] := new VBUTTON(Panel5,18,0,0,"18",30)
buttonMatrix["5Joy18"] := (Panel5.vButtons)["5Joy18"]

(Panel5.vButtons)["5Joy19"] := new VBUTTON(Panel5,19,0,0,"19",30)
buttonMatrix["5Joy19"] := (Panel5.vButtons)["5Joy19"]

(Panel5.vButtons)["5Joy20"] := new VBUTTON(Panel5,20,0,0,"",30)
buttonMatrix["5Joy20"] := (Panel5.vButtons)["5Joy20"]

(Panel5.vButtons)["5Joy21"] := new VBUTTON(Panel5,21,0,0,"21",30)
buttonMatrix["5Joy21"] := (Panel5.vButtons)["5Joy21"]

(Panel5.vButtons)["5Joy22"] := new VBUTTON(Panel5,22,0,0,"22",30)
buttonMatrix["5Joy22"] := (Panel5.vButtons)["5Joy22"]

(Panel5.vButtons)["5Joy23"] := new VBUTTON(Panel5,23,0,0,"23",30)
buttonMatrix["5Joy23"] := (Panel5.vButtons)["5Joy23"]

(Panel5.vButtons)["5Joy24"] := new VBUTTON(Panel5,24,0,0,"24",30)
buttonMatrix["5Joy24"] := (Panel5.vButtons)["5Joy24"]

(Panel5.vButtons)["5Joy25"] := new VBUTTON(Panel5,25,0,0,"25",30)
buttonMatrix["5Joy25"] := (Panel5.vButtons)["5Joy25"]

(Panel5.vButtons)["5Joy26"] := new VBUTTON(Panel5,26,0,0,"26",30)
buttonMatrix["5Joy26"] := (Panel5.vButtons)["5Joy26"]

(Panel5.vButtons)["5Joy27"] := new VBUTTON(Panel5,27,0,0,"27",30)
buttonMatrix["5Joy27"] := (Panel5.vButtons)["5Joy27"]

(Panel5.vButtons)["5Joy28"] := new VBUTTON(Panel5,28,0,0,"28",30)
buttonMatrix["5Joy28"] := (Panel5.vButtons)["5Joy28"]

(Panel5.vButtons)["5Joy29"] := new VBUTTON(Panel5,29,0,0,"29",30)
buttonMatrix["5Joy29"] := (Panel5.vButtons)["5Joy29"]

(Panel5.vButtons)["5Joy30"] := new VBUTTON(Panel5,30,0,0,"30",30)
buttonMatrix["5Joy30"] := (Panel5.vButtons)["5Joy30"]

(Panel5.vButtons)["5Joy31"] := new VBUTTON(Panel5,31,0,0,"31",30)
buttonMatrix["5Joy31"] := (Panel5.vButtons)["5Joy31"]

(Panel5.vButtons)["5Joy32"] := new VBUTTON(Panel5,32,0,0,"32",30)
buttonMatrix["5Joy32"] := (Panel5.vButtons)["5Joy32"]

(Panel1.vButtons)["5JoyPOVUp"] := new VBUTTON(Panel5,"POVUp",0,0,"33",30)
buttonMatrix["5JoyPOVUp"] := (Panel5.vButtons)["5JoyPOVUp"]

(Panel1.vButtons)["5JoyPOVRight"] := new VBUTTON(Panel5,"POVRight",0,0,"33",30)
buttonMatrix["5JoyPOVRight"] := (Panel5.vButtons)["5JoyPOVRight"]

(Panel1.vButtons)["5JoyPOVDown"] := new VBUTTON(Panel5,"POVDown",0,0,"34",30)
buttonMatrix["5JoyPOVDown"] := (Panel5.vButtons)["5JoyPOVDown"]

(Panel1.vButtons)["5JoyPOVLeft"] := new VBUTTON(Panel5,"POVLeft",0,0,"35",30)
buttonMatrix["5JoyPOVLeft"] := (Panel5.vButtons)["5JoyPOVLeft"]




