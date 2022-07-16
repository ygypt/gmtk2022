extends Node2D

onready var player : Player = get_parent()
onready var weapon : Weapon = get_child(0)

func _process(delta):
	rotation = player.look_vector
	
	if Input.is_action_just_pressed("reload"):
		weapon.reload()
	
	if Input.is_action_pressed("shoot"):
		weapon.shoot(player)
	
#	if Input.is_action_just_pressed("interact"):
#		equip new weapon that ur hovering over
