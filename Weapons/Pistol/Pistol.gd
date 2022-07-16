extends Weapon

var bullet = preload("res://Projectiles/Bullet/Bullet.tscn")

func fire(player):
	var new_bullet = bullet.instance()
	ProjectileManager.spawn_projectile(new_bullet, global_position, player.look_vector, player)
