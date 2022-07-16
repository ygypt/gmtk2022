extends Node

var current_state : State


func change_state(entity, new_state):
	current_state.exit(entity)
	current_state = new_state
	print(current_state)
	current_state.enter(entity)

func update(entity):
	var new_state = current_state.update(entity)
	if new_state != null:
		change_state(entity, new_state)
	
	
