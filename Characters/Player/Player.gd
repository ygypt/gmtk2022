extends Node2D
class_name Player

onready var entity = $Entity

func _process(delta: float):
	entity.step()
	
func _physics_process(delta: float):
	entity.fixstep()
