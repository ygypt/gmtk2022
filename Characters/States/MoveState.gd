extends State
class_name MoveState
func get_class(): return "MoveState"
func is_class(name): return name == "MoveState"

func step(entity) -> int:
	
	entity.velocity = entity.move_vector * entity.statistics.speed
	
	if not entity.move_vector:
		return IDLE
	return NULL
