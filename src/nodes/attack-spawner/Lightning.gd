extends Area2D

var move_speed = 0
var target_direction = Vector2()

func go_to_target(itarget_position, imove_speed):
	move_speed = imove_speed
	target_direction = (itarget_position - global_position).normalized()
	look_at(itarget_position)
	set_process(true)

func _process(delta):
	global_position += target_direction*move_speed*delta

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()