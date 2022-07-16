extends Node

var current_state : State

func change_state(new_state):
	current_state.exit()
	current_state = new_state
	print(current_state)
	current_state.enter()

func update():
	var new_state = current_state.update()
	if new_state != null:
		change_state(new_state)
	
	
