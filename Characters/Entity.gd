extends KinematicBody2D
class_name Entity
func get_class(): return "Entity"
func is_class(name): return name == "Entity"

# SUPER CLASS OF ALL ENTITIES. CAN BE USED FOR PLAYER, ENEMIES, AND PROJECTILES..
# PRETTY MUCH ANYTHING THAT MOVES
# ALL ENTITIES MUST HAVE /STATE/IDLE AS DEFAULT BEHAVIOUR

# INPUT / MOVEMENT
onready var move_vector := Vector2.ZERO
onready var look_vector := 0.0
onready var velocity := Vector2.ZERO

# STATE
onready var current_state

# STATS
export var health = 1
export var speed = 100

func change_state(new_state):
	current_state.exit(self)
	current_state = new_state
	current_state.enter(self)

func _process(delta):
	
	$Sprite.flip_h = !(look_vector <=  PI / 2 && look_vector > -(PI / 2))
	
	var new_state = current_state.step(self)
	if new_state != null:
		change_state(new_state)

func _physics_process(delta):
	move_and_slide(velocity)
