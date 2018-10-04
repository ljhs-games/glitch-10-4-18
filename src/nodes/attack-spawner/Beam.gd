extends Area2D

export (String) var destroy  = "no" setget _destroy

func _destroy(new_destroy):
	if(new_destroy == "yeah"):
		print("Destroying...")
		queue_free()