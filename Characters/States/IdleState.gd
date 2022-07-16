extends State
class_name IdleState
func get_class(): return "IdleState"
func is_class(name): return name == "IdleState"

func step(entity) -> int:
	
	entity.velocity = Vector2.ZERO
	
	if entity.move_vector:
		return MOVE
	return NULL
