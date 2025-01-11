extends Node2D
class_name Pipes

const OFF_SCREEN : float = -500



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	move_local_x(delta * -120)
	is_off_screen()

func is_off_screen() -> void:
	if position.x < OFF_SCREEN:
		queue_free()

func _screen_exited() -> void:
	
	queue_free()
 
