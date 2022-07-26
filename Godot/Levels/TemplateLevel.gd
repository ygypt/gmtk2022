extends Node2D

onready var score := 0

func _process(delta):
	if $SpawnTimer.is_stopped():
		for spawner in get_tree().get_nodes_in_group("Spawner"):
			spawner.spawn()
		$SpawnTimer.start()
