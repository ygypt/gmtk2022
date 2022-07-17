extends Node2D

var ghoul = preload("res://Characters/Ghoul/Ghoul.tscn")
var imp = preload("res://Characters/Ghoul/Ghoul.tscn")

var spawn
var game
var coef_hp

func _ready():
	$Sprite.visible = false
	
	randomize()
	if rand_range(0, 1) > 0.5:
		spawn = ghoul
	else:
		spawn = imp
	spawn()

func spawn():
	spawn.instance()
	spawn.position = position
	spawn.hp += .01 * coef_hp
	get_parent().add_child(spawn)
	$Timer.start()
	
	randomize()
	coef_hp += ceil(rand_range(1, 6))
	

func _process(delta):
	if $Timer.is_stopped():
		spawn()
	pass
