extends Node
class_name Weapon

onready var reload_timer : Timer = $ReloadTimer
onready var firerate_timer : Timer = $FirerateTimer

export var total_ammo := 1
export var current_ammo := 1

func _ready():
	for child in get_children():
		if child is Timer:
			child.one_shot = true

func shoot():
	if firerate_timer.time_left > 0 || reload_timer.time_left > 0:
		return
	
	firerate_timer.start()
	
	current_ammo -= 1
	
	if current_ammo <= 0:
		reload_timer.start()
		current_ammo = total_ammo
	
	
	
	# SHOOT PROJECTILE
	print("no shoot function on ", self)
	
