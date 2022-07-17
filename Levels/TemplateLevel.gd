extends Node2D

func _process(delta):
	if $Timer.is_stopped():
		for spawner in get_tree().get_nodes_in_group("Spawner"):
			spawner.spawn()
		$Timer.start()
