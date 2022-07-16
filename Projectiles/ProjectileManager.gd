extends Node2D

func spawn_projectile(projectile: Projectile, global_pos: Vector2, direction: float, shooter: Entity):
	add_child(projectile)
	projectile.position = global_pos
	projectile.look_vector = direction
	projectile.shooter = shooter
	projectile.z_index = 10
