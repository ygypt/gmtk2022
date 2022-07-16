extends Reference
class_name State
func get_class(): return "State"
func is_class(name): return name == "State"

enum {
	NULL,
	IDLE,
	MOVE,
}

func enter(entity) -> int:
	return NULL
	
func exit(entity) -> int:
	return NULL

func step(entity) -> int:
	return NULL

