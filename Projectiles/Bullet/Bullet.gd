extends Projectile
class_name BulletProjectile


var bullet_dir


func _ready():
	current_state = $State/Zoom
	$AnimationPlayer.play("Bullet_Movement", -1, rand_range(-1,1), false)
	

#	yield(get_tree(),"idle_frame")
#	yield(get_tree(),"idle_frame")
	
#	$BulletTrail.process_material.direction = Vector3.RIGHT.rotated()

func _process(delta):
	._process(delta)
	
	move_vector = Vector2.RIGHT.rotated(look_angle)
	
	$BulletTrail.process_material.direction = Vector3(move_vector.x, move_vector.y, 0)
	
