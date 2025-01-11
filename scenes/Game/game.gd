extends Node2D

const PIPES = preload("res://scenes/PipeS/pipes.tscn")

@onready var marker_upper: Marker2D = $MarkerUpper
@onready var marker_lower: Marker2D = $MarkerLower
@onready var spawn_pipes_timer: Timer = $SpawnPipesTimer
@onready var pipes_holder: Node2D = $PipesHolder


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func spawn_pipes() -> void:
	var new_pipes: Pipes = PIPES.instantiate()
	var yp: float = randf_range(marker_lower.position.y, marker_upper.position.y)
	new_pipes.position = Vector2(marker_lower.position.x, yp)
	pipes_holder.add_child(new_pipes)
	

func stop_pipes() -> void:
	spawn_pipes_timer.stop()
	for pipe in pipes_holder.get_children():
		pipe.set_process(false)
		

func _on_spawn_pipes_timer_timeout() -> void:
	spawn_pipes()


func _on_plane_died() -> void:
	stop_pipes()
