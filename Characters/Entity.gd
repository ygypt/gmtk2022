extends KinematicBody2D
class_name Entity
func get_class(): return "Entity"
func is_class(name): return name == "Entity"

onready var states := {
  State.IDLE : IdleState,
  State.MOVE : MoveState,
}

onready var current_state : State = IdleState.new()
onready var statistics := Statistics.new()
onready var move_vector := Vector2.ZERO

onready var velocity := Vector2.ZERO

func change_state(new_state):
	current_state.exit(self)
	current_state = states[new_state].new()
	print(current_state.get_class())
	current_state.enter(self)

func step():
	var new_state = current_state.step(self)
	if new_state != State.NULL:
		change_state(new_state)

func fixstep():
	print(velocity)
	move_and_slide(velocity)
