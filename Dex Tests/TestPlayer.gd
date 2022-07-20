class_name TestPlayer
extends KinematicBody2D

var gravity = 4
var velocity = Vector2.ZERO

onready var animations = $AnimationPlayer
onready var states = $StateManager

func _ready() -> void:
	states.init(self)


func _unhandled_input (event: InputEvent) -> void:
	states.input(event)

func _physics_process(delta: float) -> void:
	states.physics_process(delta)

#	what doest the "->" and the "void" parts of
func function() -> void:
#	mean / do?
	pass 
