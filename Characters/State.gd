extends Node
class_name State
func get_class(): return "State"
func is_class(name): return name == "State"

# DONT BOTHER ADDING CLASS_NAME AND ALL THAT TO INDIVIDUAL STATES

func enter(entity) -> Node:
	return null
	
func exit(entity) -> Node:
	return null

func step(entity) -> Node:
	return null

