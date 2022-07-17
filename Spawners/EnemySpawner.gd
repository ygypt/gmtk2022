extends Node2D

onready var ghoul = preload("res://Characters/Ghoul/Ghoul.tscn")
onready var imp = preload("res://Characters/Imp/Imp.tscn")

var spawn
var game
var coef_hp = 0

func _ready():
	$Sprite.visible = false
	spawn()

func spawn():
	var player_distance = 0
	for player in get_tree().get_nodes_in_group("Player"):
		player_distance = (player.global_position - global_position).length()
	
	if player_distance < 300:
		return
	
	randomize()
	
	if rand_range(0, 1) > 0.5:
		spawn = ghoul.instance()
	else:
		spawn = imp.instance()
	
	spawn.position = position
	spawn.health += .01 * coef_hp
	
	
	get_parent().add_child(spawn)

	$Timer.start()
	
	randomize()
	coef_hp += ceil(rand_range(1, 6))
	

func _process(delta):
	if $Timer.is_stopped():
		spawn()
	pass
