extends CharacterBody2D

class_name Tappy

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var engine_sound: AudioStreamPlayer2D = $EngineSound
@onready var animation_player: AnimationPlayer = $AnimationPlayer

const GRAVITY: float = 1000.0
const POWER: float = -350.0



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	velocity.y += GRAVITY * delta
	fly()
	move_and_slide()
	if is_on_floor():
		die()
		pass
	
		
		
func fly() -> void:
	if Input.is_action_pressed("jump"):
		velocity.y = POWER
		animation_player.play("power")

func die() -> void:
	set_physics_process(false)
	engine_sound.stop()
	animated_sprite_2d.stop()
	SignalManager.on_plane_died.emit()
	
