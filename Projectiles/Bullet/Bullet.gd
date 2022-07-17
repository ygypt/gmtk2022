extends Projectile
class_name BulletProjectile


var bullet_dir


func _ready():
	current_state = $State/Zoom
	$AnimationPlayer.play("Bullet_Movement",-1, rand_range(-1,1), false)
	
	yield(get_tree(),"idle_frame")
	yield(get_tree(),"idle_frame")
	$BulletTrail.process_material.direction = Vector3(-velocity.x,-velocity.y,0)

func _process(delta):
	._process(delta)
	
	var bodies = get_overlapping_bodies()
