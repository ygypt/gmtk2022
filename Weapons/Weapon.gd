extends Node2D
class_name Weapon

onready var reload_timer : Timer = $ReloadTimer
onready var firerate_timer : Timer = $FirerateTimer

export var total_ammo := 1
var current_ammo

func _ready():
	for child in get_children():
		if child is Timer:
			child.one_shot = true
			
	current_ammo = total_ammo

func equip():
	pass

func fire(player):
	pass

func reload():
	reload_timer.start()
	current_ammo = total_ammo

func shoot(player):
	if firerate_timer.time_left > 0 || reload_timer.time_left > 0:
		return
	
	firerate_timer.start()
	
	current_ammo -= 1
	print("bang")
	
	fire(player)
	
	if current_ammo <= 0:
		reload()
	
