extends Node2D




# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	move_local_x(delta * -80)
	is_off_screen()

func is_off_screen() -> void:
	if position.x < -500:
		queue_free()

func _screen_exited() -> void:
	
	queue_free()
 
