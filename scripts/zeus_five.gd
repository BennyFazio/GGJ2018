extends KinematicBody2D






var accel = global.zeus_accel
var max_speed = global.zeus_maxspeed
var friction = global.zeus_friction
var gravity = global.zeus_gravity
var jump_speed = global.zeus_jumpspeed
var min_jump = global.zeus_minjump




var pos = Vector2()
var rot = 0
var speed
var vel = Vector2(0, 0)
var acc = Vector2(0, 0)
var DETECT_RADIUS = 1200
var target = Vector2()
var target_dist = Vector2()
var mech1_location = Vector2()
var mech2_location = Vector2()
var mech1_proximity = Vector2()
var mech2_proximity = Vector2()

func init(spawn_pos):
	pos = spawn_pos

func _ready():
	randomize()
	speed = 200
	set_fixed_process(true)
	#set_pos(pos)
	
func _fixed_process(delta):
	print(acc)
#	for mech in get_tree().get_nodes_in_group("mechs"):
#		var mech_proximity = (mech.pos - pos).length()
#		print(mech_proximity)
	mech1_location = global.mech_1_pos
	mech2_location = global.mech_2_pos
	mech1_proximity = (mech1_location - pos).length()
	mech2_proximity = (mech2_location - pos).length()
	
	#for now do this w/o incorporating Detection Radius. Just focus on getting enemy to select
	#between both mechs based on proximity. later this feature will only be relevant if both mechs
	#are in proximity
	if mech1_proximity <= mech2_proximity:
		target = mech1_location
		target_dist = target - pos
	elif mech1_proximity > mech2_proximity:
		target = mech2_location
		target_dist = target - pos
		
	
	pos = get_global_pos()		
	acc.y = gravity
	acc += target_dist.normalized()
	#print(target)
	
#	if acc.x == 0:
#		acc.x = vel.x * friction * delta
	vel += acc * delta
	vel.x = clamp(vel.x, -max_speed, max_speed)
	var motion = move(vel * delta)
	if is_colliding():
		var n = get_collision_normal()
		motion = n.slide(motion)
		vel = n.slide(vel)
		move(motion)
#	if abs(vel.x) < 10:
#		vel.x = 0
	if target.x > pos.x:
		if vel.x < 0:
			acc *= -1
			vel *= -.2
	elif target.x < pos.x:
		if vel.x > 0:
			acc *= -1 
			vel *= -.2
	
	
	
	
	
#	pos = get_pos() + vel * delta
#	set_pos(pos)
	