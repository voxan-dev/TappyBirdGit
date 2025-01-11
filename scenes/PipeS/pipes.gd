extends Node2D
class_name Pipes


func _ready() -> void:
	SignalManager.on_plane_died.connect(on_plane_died)




# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	move_local_x(delta * GameManager.SCROLL_SPEED)
	is_off_screen()

func is_off_screen() -> void:
	if position.x < GameManager.OFF_SCREEN:
		queue_free()

func _screen_exited() -> void:
	
	queue_free()
 
func on_plane_died() -> void:
	set_process(false)


func _on_pipe_body_entered(body: Node2D) -> void:
	if body is Tappy:
		body.die()
	#if body.is_in_group(GameManager.GROUP_PLANE):
	#	if body.has_method("die"):
	#		body.die()
