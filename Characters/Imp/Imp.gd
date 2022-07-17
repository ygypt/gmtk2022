extends Entity

onready var player_distance = 0
onready var angle_to_player = 0
onready var cooldown : Timer = $CastCooldown
onready var anims : AnimatedSprite = $Sprite

func _ready():
	current_state = $State/Chase

func _process(delta):
	for player in get_tree().get_nodes_in_group("Player"):
		player_distance = abs((player.position - position).length())
		angle_to_player = get_angle_to(player.position)
	
	for body in $ProjHurtbox.get_overlapping_areas():
		if body.shooter.is_in_group("Player"):
			health -= body.damage
			body.queue_free()
