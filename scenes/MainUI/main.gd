extends Control
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer
@onready var score: Label = $MarginContainer/MarginContainer/Score


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	animation_player.play("BeginButtonFlash")
	score.text = str(ScoreManager.get_high_score())
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("jump"):
		GameManager.load_game_scene()
