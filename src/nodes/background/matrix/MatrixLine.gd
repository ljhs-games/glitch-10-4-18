extends ColorRect

var down_speed = 600.0

func _ready():
	set_process(true)

func _process(delta):
	rect_global_position.y += down_speed*delta

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()