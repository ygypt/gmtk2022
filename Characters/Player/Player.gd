extends Entity
class_name Player

func get_class(): return "Player"
func is_class(name): return name == "Player"


onready var anims : AnimationPlayer = $AnimationPlayer
onready var weapon : Weapon = $Pistol
onready var GUI := $CamViewportNode/PlayerCamera/GUI
onready var can_shoot := true


func _ready():
	current_state = $State/Idle
#	weapon_slot.player = self


func _process(delta: float):
	var movevec = Input.get_vector("move_left", "move_right", "move_up", "move_down")  #Dex: I didn't know this was a thing. Sweet Function.
	move_vector = movevec
	
	var mouse_pos = get_global_mouse_position()
	# THIS MIGHT BE BACKWARDS
#	var lookvec = global_position.angle_to_point(mouse_pos)
	var lookvec = mouse_pos.angle_to_point(global_position)
	look_vector = lookvec
	
	weapon.step(self)
	GUI.step(self)
	
	# PLAYER EXTENDS ENTITY, SO WE INHERIT ALL OF ENTITY'S FUNCTIONS, BUT 
	# WE'VE OVERRIDEN _PROCESS HERE, SO TO MAKE SURE THAT THE O.G. ENTITY
	# PROCESS STILL RUNS I RUN "DOT _PROCESS", THE "DOT" CALLS THE SAME FUNCTION
	# FROM THE SUPERCLASS
	._process(delta)

