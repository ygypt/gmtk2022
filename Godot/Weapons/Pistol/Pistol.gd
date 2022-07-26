extends Weapon

var bullet = preload("res://Projectiles/Bullet/Bullet.tscn")

export var auto := false

func step(player):
	.step(player) # RUN THE SUPERCLASS STEP SO WE GET ROTATION STUFF
	if !firerate_timer.is_stopped() || !reload_timer.is_stopped():
		return
	if current_ammo <= 0:
		reload()
	
	if Input.is_action_just_pressed("reload") && current_ammo < total_ammo:
		reload()
	match auto:
		true:
			if Input.is_action_pressed("shoot"):
				current_ammo -= 1
				
				var new_bullet = bullet.instance()
				ProjectileManager.spawn_projectile(
					new_bullet,
					global_position + (Vector2.RIGHT.rotated(player.look_angle)*Vector2(9,11)),
					player.look_angle,
					player,
					3
					)
				$AudioStreamPlayer.play()
				$FirerateTimer.start()
		false:
			if Input.is_action_just_pressed("shoot"):
				current_ammo -= 1
				
				var new_bullet = bullet.instance()
				ProjectileManager.spawn_projectile(
					new_bullet,
					global_position + (Vector2.RIGHT.rotated(player.look_angle)*Vector2(9,11)),
					player.look_angle,
					player,
					3
					)
				$AudioStreamPlayer.play()
	
	if current_ammo <= 0:
		reload()
	
