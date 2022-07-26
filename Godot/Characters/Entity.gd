extends KinematicBody2D
class_name Entity
func get_class(): return "Entity"
func is_class(name): return name == "Entity"

# SUPER CLASS OF ALL ENTITIES. CAN BE USED FOR PLAYER, ENEMIES, AND PROJECTILES..
# PRETTY MUCH ANYTHING THAT MOVES
# ALL ENTITIES SHOULD SET CURRENT_STATE IN READY FUNCTION

# THE MOVE_VECTOR IS AN ABSTRACTION OF JOYSTICK/WASD, BUT MAY ALSO BE
# CONTROLLED BY AI. SAME WITH LOOK_VECTOR, IT CAN BE MOUSE/RIGHT JOYSTICK OR
# JUST AN AI USING LOOK_AT. RATHER THAN CALLING MOVE_AND_SLIDE DIRECTLY FROM
# EACH STATE, THEY JUST APPLY VELOCITY TO THEIR ENTITY, WHICH THEN CALLS
# MOVE_AND_SLIDE DURING EVERY PHYSICS FRAME

# INPUT / MOVEMENT
onready var move_vector := Vector2.ZERO
onready var look_angle := 0.0
onready var velocity := Vector2.ZERO
#onready var real_velocity := Vector2.ZERO

# STATE
onready var current_state

# STATS
export var health = 1
export var speed = 100

func change_state(new_state):
	current_state.exit(self)
	current_state = new_state
	current_state.enter(self)

# ENTITY SUPERCLASS DEALS WITH STUPID SPRITE FLIP SO THAT STATES DONT GOTTA
# WITH THIS WHACK ASS EQUATION I COPIED FROM A PROJECT I MADE LIKE 4 YEARS AGO
# AND I HAVE BEEN COPYING IT EVER SINCE LMAO. IF IT WORKS, IT WORKS

func _process(delta):
	
	$Sprite.flip_h = !(look_angle <=  PI / 2 && look_angle > -(PI / 2))
	
	var new_state = current_state.step(self)
	if new_state != null:
		change_state(new_state)
	
	if health <= 0:
		get_parent().score += 1
		queue_free()

func _physics_process(delta):
	move_and_slide(velocity)
