extends Node2D
class_name Pipes





# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	move_local_x(delta * GameManager.SCROLL_SPEED)
	is_off_screen()

func is_off_screen() -> void:
	if position.x < GameManager.OFF_SCREEN:
		queue_free()

func _screen_exited() -> void:
	
	queue_free()
 
