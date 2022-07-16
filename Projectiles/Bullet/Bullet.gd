extends Projectile
class_name BulletProjectile

# hehe bullet go zoom

func _ready():
	current_state = $State/Zoom
