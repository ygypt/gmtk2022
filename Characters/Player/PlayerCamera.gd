extends Camera2D

const MOUSE_CAM_MOD = .8
onready var player : Player = get_parent().get_parent()
var cursor_lposition : Vector2 


func _process(delta):
	cursor_lposition = get_local_mouse_position()
	global_position = player.global_position + (cursor_lposition * MOUSE_CAM_MOD)

