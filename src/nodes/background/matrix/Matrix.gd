extends Node2D

export (PackedScene) var matrix_line_pack
export var matrix_line_speed = 600.0
export var spawn_time_range = Vector2(0.01, 0.03)

func _ready():
	reset_timer()

func _on_SpawnTimer_timeout():
	var cur_line = matrix_line_pack.instance()
	cur_line.down_speed = matrix_line_speed
	add_child(cur_line)
	cur_line.rect_global_position.x = rand_range(0.0, OS.get_real_window_size().x)
	cur_line.rect_global_position.y = cur_line.rect_size.y*-1 - 10
	reset_timer()

func reset_timer():
	$SpawnTimer.wait_time = rand_range(spawn_time_range.x, spawn_time_range.y)
	$SpawnTimer.start()