extends Node2D

# CHONKY ASS FUNCTION FOR SPAWNING PROJECTILE. FEEL FREE TO ADD TO IT
# YOU CAN USE EQUAL SIGN FOR DEFAULTS (U PROLLY ALREADY KNOW THAT IDK)

func spawn_projectile(
		projectile: Projectile,
		global_pos: Vector2,
		direction: float,
		shooter: Entity,
		damage: int = 1
	):
	
	projectile.shooter = shooter
	
	add_child(projectile)
	
	projectile.position = global_pos
	projectile.look_angle = direction
	projectile.damage = damage
	projectile.add_to_group("Projectile")
