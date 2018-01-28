extends Node2D

onready var mech_1 = get_node("mech_1")
onready var mech_2 = get_node("mech_2")
onready var beam = get_node("beam")
#onready var beam_top = get_node("beam/beam_top")

var beam_top = Vector2()
var beam_visible = false
var beam_position_fixed = false

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
		if event.is_action_pressed("ui_v"):
			beam_position_fixed = true
			descend_shell()
		
	
func _fixed_process(delta):
	beam_top = beam.get_pos() + Vector2(0, -1500)
	if global.dropping_off == true:
		if mech_1.active == true:
			shell = mech_2
		elif mech_2.active == true:
			shell = mech_1
		shell.position_for_drop(beam_top)
		
		
	
		
		
	print(shell.get_pos())
	
		
func descend_shell():
	if beam_position_fixed == true:
		global.dropping_off = false