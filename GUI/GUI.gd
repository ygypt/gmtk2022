extends CanvasLayer

onready var LABEL_AMMO_LEFT:Label = $Control/HBoxContainer/AmmoLeftLabel
onready var LABEL_AMMO_TOTAL:Label = $Control/HBoxContainer/AmmoTotalLabel
onready var ANIMS:AnimationPlayer = $Control/Sprite/AnimationPlayer

var old_hp : int

func _ready():
	ANIMS.play("HealthStart")

func step(player : Player):
	var weaponheld = player.weapon
	var current_hp = player.health
	var ammo_left = player. weapon.current_ammo
	var ammo_total = player.weapon.total_ammo
	if (not ANIMS.is_playing()) && (current_hp == 4):
		ANIMS.play("HeathFourIdle")
	
	
	#this happens last
	old_hp = current_hp
