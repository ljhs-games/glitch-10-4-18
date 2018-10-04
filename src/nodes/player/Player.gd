extends KinematicBody2D

export var move_speed = 400.0
export var down_speed = 200.0

enum ACTION {right, left}
var actions = {ACTION.right: 0, ACTION.left: 0}
var cur_action = 0

func _ready():
	set_process_input(true)
	set_physics_process(true)

func _physics_process(delta):
	cur_action = 0
	cur_action += actions[ACTION.right]
	cur_action += actions[ACTION.left]
	move_and_collide(Vector2(0, down_speed*delta))
	move_and_collide(Vector2(move_speed*delta*cur_action, 0))

func _input(event):
	if event.is_action("ui_right"):
		if event.is_pressed():
			actions[ACTION.right] = 1
		else:
			actions[ACTION.right] = 0
	elif event.is_action("ui_left"):
		if event.is_pressed():
			actions[ACTION.left] = -1
		else:
			actions[ACTION.left] = 0
	elif event is InputEventMouseButton:
		if event.pressed:
			global_position = event.global_position

func _on_DieArea_area_entered(area):
	if(area.is_in_group("bad")):
		get_tree().change_scene("res://scenes/TitleScreen.tscn")