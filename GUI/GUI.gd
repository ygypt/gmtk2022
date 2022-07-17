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
	$Control/HBoxContainer/AmmoLeftLabel.text= str(ammo_left)
	$Control/HBoxContainer/AmmoTotalLabel.text= str(ammo_total)
	if ammo_left < ammo_total*.5:
		$Control/HBoxContainer/AmmoLeftLabel.add_color_override("font_color",Color("de2020")) #RED
	else:
		$Control/HBoxContainer/AmmoLeftLabel.add_color_override("font_color",Color("ffffff")) #WHITE
	if not weaponheld.reload_timer.is_stopped():
		$Control/HBoxContainer/AmmoLeftLabel.text= "Reloading... "+ str(0)
		$Control/HBoxContainer/AmmoLeftLabel.add_color_override("font_color",Color("de2020"))
	if (not ANIMS.is_playing()) && (current_hp >= 4):
		ANIMS.play("HeathFourIdle")
		print("TESTINGTESTING")
	if current_hp<old_hp:
		if   current_hp == 3: ANIMS.play_backwards("HealthThreeToFour")
		elif current_hp == 2: ANIMS.play_backwards("HealthTwoToThree")
		elif current_hp == 1: ANIMS.play_backwards("HealthOneToTwo")
		elif current_hp == 0: ANIMS.play_backwards("HealthStart")
	
	# HERE
	for level in get_tree().get_nodes_in_group("Level"):
		$score.text = level.score
	
	#this happens last
	old_hp = current_hp
