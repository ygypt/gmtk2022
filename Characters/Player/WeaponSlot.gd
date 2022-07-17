extends Node2D

const MOUSE_CAM_MOD = .4

onready var player : Player = get_parent()
onready var weapon : Weapon = get_child(0)
var cursor_lposition : Vector2 


#onready var cursor_lposition

func _process(delta):
#	cursor_lposition = get_local_mouse_position()
#	rotation = player.look_vector
#	global_position = player.global_position + (cursor_lposition * MOUSE_CAM_MOD)
#	look_at(cursor_lposition)
	
#	if Input.is_action_just_pressed("reload"):
#		weapon.reload()
#
#	if Input.is_action_pressed("shoot"):
#		weapon.shoot(player)
	
#	if Input.is_action_just_pressed("interact"):
#		equip new weapon that ur hovering over
	pass
