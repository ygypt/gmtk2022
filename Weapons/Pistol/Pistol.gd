extends Weapon

var bullet = preload("res://Projectiles/Bullet/Bullet.tscn")

func step(player):
	.step(player) # RUN THE SUPERCLASS STEP SO WE GET ROTATION STUFF
	if firerate_timer.time_left || reload_timer.time_left > 0:
		return
	if current_ammo <= 0:
		reload()
	
	if Input.is_action_just_pressed("reload") && current_ammo < total_ammo:
		reload()
	
	if Input.is_action_just_pressed("shoot"):
		var new_bullet = bullet.instance()
		ProjectileManager.spawn_projectile(
			new_bullet,
			global_position,
			player.look_vector,
			player,
			3)
	
	if current_ammo <= 0:
		reload()
	
