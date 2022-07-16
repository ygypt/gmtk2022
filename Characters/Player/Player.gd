extends Node2D
class_name Player
func get_class(): return "Player"
func is_class(name): return name == "Player"


onready var entity : Entity = $Entity

func _process(delta: float):
	var vecx = Input.get_axis("move_left", "move_right")
	var vecy = Input.get_axis("move_up", "move_down")
	var move_vector = Vector2(vecx, vecy)
	entity.move_vector = move_vector
	
	var mouse_pos = get_viewport().get_mouse_position()
	var look_vector = global_position.direction_to(mouse_pos)
	
	print(look_vector)
	
	entity.step()
	
func _physics_process(delta: float):
	entity.fixstep()
	position = entity.position

