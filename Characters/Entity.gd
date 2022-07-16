extends KinematicBody2D
class_name Entity

var current_state : State

func change_state(new_state):
	current_state.exit(self)
	current_state = new_state
	print(current_state)
	current_state.enter(self)

func step():
	var new_state = current_state.update(self)
	if new_state != null:
		change_state(new_state)

func fixstep():
	pass
	
