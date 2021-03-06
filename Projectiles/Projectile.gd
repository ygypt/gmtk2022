extends Area2D
class_name Projectile

# who dun shot me
var shooter : Entity

# INPUT / MOVEMENT
onready var move_vector := Vector2.ZERO
onready var look_vector := 0.0
onready var velocity := Vector2.ZERO

# STATE
onready var current_state

export var speed := 200
var damage := 1

func change_state(new_state):
	current_state.exit(self)
	current_state = new_state
	current_state.enter(self)

func _process(delta):
	var new_state = current_state.step(self)
	if new_state != null:
		change_state(new_state)

func _physics_process(delta):
	position += velocity * delta
