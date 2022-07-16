extends Node2D
class_name Weapon

# WEAPON SUPERCLASS(TEMPLATE), WAS GONNA MAKE ENTITY BUT IT DIDNT MAKE SENSE
# THE TWO TIMERS REFERENCE CHILDREN WHICH MEANS A WEAPON SCENE SHOULD ALWAYS
# HAVE THESE TWO TIMERS AT THE VERY LEAST

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

# THIS FUNCTION IS KINDA MESSY RN BUT IT GETS THE JOB DONE

func shoot(player):
	if firerate_timer.time_left > 0 || reload_timer.time_left > 0:
		return
	
	firerate_timer.start()
	
	current_ammo -= 1
	print("bang")
	
	fire(player)
	
	if current_ammo <= 0:
		reload()
	
