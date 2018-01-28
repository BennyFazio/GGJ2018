extends Node2D

onready var mech_1 = get_node("mech_1")
onready var mech_2 = get_node("mech_2")
onready var beam = get_node("beam")
onready var beam_top = get_node("beam/beam_top")

var beam_visible = false

var shell

func _ready():
	set_fixed_process(true)
	set_process_input(true)
	
func _input(event):
	if beam_visible == false:
		if event.is_action_pressed("ui_c"):
			beam.show()
			beam_visible = true
	elif beam_visible == true:
		if event.is_action_pressed("ui_c"):
			beam.hide()
			beam_visible = false
		
	
func _fixed_process(delta):
	if global.dropping_off == true:
		if mech_1.active == true:
			shell = mech_2
		elif mech_2.active == true:
			shell = mech_1
		shell.pos = beam_top.get_pos()
	
		
	
	
