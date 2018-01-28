extends KinematicBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
onready var explosion = get_node("explosion")

func _ready():
	set_fixed_process(true)
	
func _fixed_process(delta):
	if self.is_colliding():
		self.free()