extends Node2D

enum ATTACKS { lightning, beam, cross }

export (PackedScene) var lightning_pack = preload("res://nodes/attack-spawner/Lightning.tscn")
export (PackedScene) var beam_pack = preload("res://nodes/attack-spawner/Beam.tscn")
export (PackedScene) var cross_pack = preload("res://nodes/attack-spawner/Cross.tscn")
export (NodePath) var player_path
export var lightning_speed = 500.0

onready var player_node = get_node(player_path)

var cur_attack = ATTACKS.lightning

func _ready():
	$LightningTimer.start()
	set_process(true)

func _on_AttackTimer_timeout():
	if(cur_attack == ATTACKS.cross):
		get_tree().change_scene("res://scenes/WinScreen.tscn")
	elif(cur_attack == ATTACKS.lightning):
		cur_attack = ATTACKS.beam
		$BeamTimer.start()
	elif(cur_attack == ATTACKS.beam):
		cur_attack = ATTACKS.cross
		$CrissCrossTimer.start()
	$AttackTimer.start()

func _on_LightningTimer_timeout():
	var cur_lightning = lightning_pack.instance()
	cur_lightning.global_position = Vector2(rand_range(0, OS.get_real_window_size().x), 0)
	add_child(cur_lightning)
	cur_lightning.go_to_target(player_node.global_position, lightning_speed)

func _on_BeamTimer_timeout():
	var cur_beam = beam_pack.instance()
	cur_beam.global_position = Vector2(player_node.global_position.x, 0)
	add_child(cur_beam)

func _on_CrissCrossTimer_timeout():
	var cur_cross = cross_pack.instance()
	cur_cross.global_position = player_node.global_position
	add_child(cur_cross)