extends KinematicBody2D

onready var ground_ray = get_node("ground_ray")
onready var camera = get_node("camera")
onready var shoot_timer = get_node("shoot_timer")
onready var bullet_container = get_node("bullet_container")
onready var drop_timer = get_node("drop_timer")

onready var sprite = get_node("sprite")


onready var R1 = get_node("Rbullet_pos1")
onready var R2 = get_node("Rbullet_pos2")
onready var R3 = get_node("Rbullet_pos3")
onready var R4 = get_node("Rbullet_pos4")
onready var R5 = get_node("Rbullet_pos5")
onready var L1 = get_node("Lbullet_pos1")
onready var L2 = get_node("Lbullet_pos2")
onready var L3 = get_node("Lbullet_pos3")
onready var L4 = get_node("Lbullet_pos4")
onready var L5 = get_node("Lbullet_pos5")

export (PackedScene) var bullet




var accel = global.player_accel
var max_speed = global.player_maxspeed
var friction = global.player_friction
var gravity = global.player_gravity
var jump_speed = global.player_jumpspeed
var min_jump = global.player_minjump


var acc = Vector2()
var vel = Vector2()
var pos = Vector2()
var rot = 0
var bullet_pos
var target_dist
var collider_name
var anim = "idle"

var active = true
var can_drop = false


func _ready():
	set_fixed_process(true)
	set_process_input(true)



func _input(event):
	if active == true:
		if event.is_action_pressed("ui_up") and ground_ray.is_colliding():
			vel.y = jump_speed
		if event.is_action_released("ui_up"):
			vel.y = clamp(vel.y, min_jump, vel.y)
		#if event.type==InputEvent.MOUSE_MOTION:
#			target_dist = event.pos - pos
#			print(get_global_mouse_pos())
#			rot = target_dist.angle_to(Vector2(0, 1))
		if event.is_action_pressed("ui_down"):
			if vel.y == 0:
				if can_drop == true:
					drop()
			

					
					
						
					
				
		if event.is_action_pressed("shoot"):
			shoot()
		
		
#	for i in get_tree().get_nodes_in_group("aiming_frames"):
#		if abs(vel.x) >= 10:
#			i.play()
#		elif abs(vel.x) < 10:
		
		
		
		
func _fixed_process(delta):
	#if vel.y == 0:
	if ground_ray.is_colliding():
		if ground_ray.get_collider().get_groups().has("drop_platforms"):
			can_drop = true
			
			
	if drop_timer.get_time_left() == 0:
		set_collision_mask_bit( 3, true )
		set_layer_mask_bit( 3, true)
	#if can_drop == false:
	#if vel.y > 0:
	#	set_collision_mask_bit( 3, true )
	#	set_layer_mask_bit( 3, true)
#	if vel.y >= 0:
#		set_collision_mask_bit( 3, true )
#		set_layer_mask_bit( 3, true)
		
	

		

	pos = get_global_pos()		#get_global_transform_with_canvas()[2]
	target_dist = get_global_mouse_pos() - pos
	rot = target_dist.angle_to(Vector2(0, 1))
	acc.y = gravity
	if active == true:
		acc.x = Input.is_action_pressed("ui_right") - Input.is_action_pressed("ui_left")
	else:
		acc.x = 0
	acc.x *= accel
	if acc.x == 0:
		acc.x = vel.x * friction * delta

	vel += acc * delta
	vel.x = clamp(vel.x, -max_speed, max_speed)
	
	var motion = move(vel * delta)
	if is_colliding():
		var n = get_collision_normal()
		motion = n.slide(motion)
		vel = n.slide(vel)
		move(motion)
	if abs(vel.x) < 10:
		vel.x = 0

		
		
	#print(rot)
	if -3.10 < rot and rot <= -2.90:
		rot = -3.01
		bullet_pos = R1
	elif -2.90 <= rot and rot < -2.22:
		rot = -2.46
		bullet_pos = R2
	elif -2.22 <= rot and rot < -1.80:
		rot = -2.00
		bullet_pos = R3
	elif -1.80 <= rot and rot < -0.80:
		rot = -1.52
		bullet_pos = R4
	elif -0.80 <= rot and rot < -0.10:
		rot = -0.24
		bullet_pos = R5
	elif 3.10 >= rot and rot > 2.90:
		rot = 3.01
		bullet_pos = L1
	elif 2.90 >= rot and rot > 2.22:
		rot = 2.46
		bullet_pos = L2
	elif 2.22 >= rot and rot > 1.80:
		rot = 2.00
		bullet_pos = L3
	elif 1.80 >= rot and rot > 0.80:
		rot = 1.52
		bullet_pos = L4
	elif 0.80 >= rot and rot > 0.10:
		rot = 0.24
		bullet_pos = L5
	else:
		rot = 0
		bullet_pos = R1

	
	if active == false:
		set_opacity(.2)
	if active == true:
		set_opacity(1)	
		camera.make_current()
	# set animation
	if vel.x == 0:
		anim = "idle"
	else:
		anim = "forward"
		sprite.play()
	if get_global_mouse_pos().x >= pos.x:
		sprite.set_flip_h(false)
	elif get_global_mouse_pos().x < pos.x:
		sprite.set_flip_h(true)
	sprite.set_animation(anim)
	if sprite.get_animation() == "idle":
		sprite.stop()
	#sprite.play(anim)

	global.mech_1_pos = pos

func shoot():
	#print(global.mech_1_pos)
	shoot_timer.start()
	var b = bullet.instance()
	bullet_container.add_child(b)
	b.start_at(rot, bullet_pos.get_global_pos())


func drop():
	drop_timer.start()
	set_collision_mask_bit( 3, false )
	set_layer_mask_bit( 3, false)
	
	
func spawn_beam():
	pass
	



