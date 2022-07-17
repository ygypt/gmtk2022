extends Entity
class_name Player
func get_class(): return "Player"
func is_class(name): return name == "Player"

onready var anims : AnimationPlayer = $AnimationPlayer
onready var weapon := $Pistol
onready var can_shoot := true
onready var hurt_angle := 0.0

func _ready():
	current_state = $State/Idle
	$Hurtbox.connect("area_entered", self, "_on_Hurtbox_area_entered")
#	weapon_slot.player = self

func _process(delta: float):
	var movevec = Input.get_vector("move_left", "move_right", "move_up", "move_down")  #Dex: I didn't know this was a thing. Sweet Function.
	move_vector = movevec
	
	var mouse_pos = get_global_mouse_position()
	# THIS MIGHT BE BACKWARDS
#	var lookvec = global_position.angle_to_point(mouse_pos)
	var lookvec = mouse_pos.angle_to_point(global_position)
	look_angle = lookvec
	
	weapon.step(self)
	
#	for area in $Hurtbox.get_overlapping_areas():
#		if area is Projectile:
#			health -= area.damage
#
#	for body in $Hurtbox.get_overlapping_bodies(): Area2D
#		if body.is_in_group("Enemy"):
#			pass
	
	# PLAYER EXTENDS ENTITY, SO WE INHERIT ALL OF ENTITY'S FUNCTIONS, BUT 
	# WE'VE OVERRIDEN _PROCESS HERE, SO TO MAKE SURE THAT THE O.G. ENTITY
	# PROCESS STILL RUNS I RUN "DOT _PROCESS", THE "DOT" CALLS THE SAME FUNCTION
	# FROM THE SUPERCLASS
	._process(delta)

func take_hit(node: Node):
	if not $ImmunityTimer.is_stopped():
		return
	
	$ImmunityTimer.start()
	health -= 1
	print("HP: ", health)
	
	# MOVE PLAYER IN OPPOSITE DIRECTION
	
	hurt_angle = global_position.angle_to_point(node.global_position)
#	velocity = Vector2.RIGHT.rotated(hurt_angle) * 1500

	change_state($State/Hurt)

func _on_Hurtbox_area_entered(area):
	print(area)
	if area.is_in_group("Projectile"):
		print("in")
		if area.shooter != self:
			print("deep")
			take_hit(area)
			return
			
	if area.is_in_group("Hitbox"):
		take_hit(area)
		return



#func _on_Hurtbox_body_entered(body):
#	if body != self:
#		take_hit(body)
#		return
