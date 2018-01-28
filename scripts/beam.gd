extends KinematicBody2D



const speed = 200
var gravity = false
var vel = Vector2(0,8)
var pos = Vector2()


var picking_up

var mouse_pos = Vector2()


func _ready():
	set_fixed_process(true)
	set_process_input(true)

func _input(event):
	pass
#	if global.dropping_off == true:
#		if (event.type==InputEvent.MOUSE_MOTION):
#			mouse_pos = event.get_pos()
	
	
	#if event.is_action_pressed("ui_r"): 
		#gravity = not gravity
		
func _fixed_process(delta):
	var direction = Vector2(0,0)
	if global.dropping_off == true:
		pass
		
	#set_pos(pos)
		
	
	
	
