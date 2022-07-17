extends Node2D
class_name Weapon

# WEAPON SUPERCLASS(TEMPLATE), WAS GONNA MAKE ENTITY BUT IT DIDNT MAKE SENSE
# THE TWO TIMERS REFERENCE CHILDREN WHICH MEANS A WEAPON SCENE SHOULD ALWAYS
# HAVE THESE TWO TIMERS AT THE VERY LEAST

onready var reload_timer : Timer = $ReloadTimer
onready var firerate_timer : Timer = $FirerateTimer
#onready var semiauto_timer : Timer = $SemiautoTimer
var cursor_lposition : Vector2
const MOUSE_CAM_MOD : float = 0.05


export var total_ammo := 1
onready var current_ammo := total_ammo

export var camera_shake := 1

func _ready():
	for child in get_children():
		if child is Timer:
			child.one_shot = true

func reload():
	reload_timer.start()
	current_ammo = total_ammo

# THIS FUNCTION IS KINDA MESSY RN BUT IT GETS THE JOB DONE
func step(entity):
	rotation = entity.look_angle
	$Sprite.flip_v = !(entity.look_angle <=  PI / 2 && entity.look_angle > -(PI / 2))
	cursor_lposition = entity.get_local_mouse_position()
	global_position = entity.global_position + (cursor_lposition * MOUSE_CAM_MOD)
