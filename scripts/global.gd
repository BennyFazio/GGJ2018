extends Node


#GUI SETTINGS

#Screen
const SCREEN_MIN_X = 0
const SCREEN_MAX_X = 1200
const SCREEN_MIN_Y = 0
const SCREEN_MAX_Y = 700



#PLAYER SETTINGS
var active_mech

var transmittable = false
var dropping_off = true

#Physics
var player_accel = 1200
var player_maxspeed = 200
var player_friction = -500
var player_gravity = 4000
var player_jumpspeed = -1600
var player_minjump = -200

#Mech 1
var mech_1_pos = Vector2()
var mech_2_pos = Vector2()





#ENEMY SETTINGS

#Zeus 5
#Physics
var zeus_accel = 1200
var zeus_maxspeed = 170
var zeus_friction = -50
var zeus_gravity = 4000
var zeus_jumpspeed = -1800
var zeus_minjump = -200

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass
