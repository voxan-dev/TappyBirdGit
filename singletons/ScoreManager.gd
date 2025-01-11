extends Node

var _score: int = 0
var _high_score: int = 0

func _ready() -> void:
	pass

func get_score() -> int:
	return _score
	
func get_high_score() -> int:
	return _high_score
	
func set_score(v: int) -> void:
	_score = v
	if _score > _high_score:
		set_high_score(_score)
	SignalManager.on_score_updated.emit(_score)

func set_high_score(v: int) -> void:
	_high_score = v
	
func inc_score() -> void:
	set_score(_score + 1)
	
	
