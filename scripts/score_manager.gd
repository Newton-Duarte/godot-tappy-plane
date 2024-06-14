extends Node

var score: int = 0
var high_score: int = 0

func _ready():
	print("Autoload SM")

func get_score() -> int:
	return score

func get_high_score() -> int:
	return high_score

func set_score(value: int) -> void:
	score = value
	if score > high_score:
		high_score = score
	SignalManager.score_updated.emit()

func increment_score() -> void:
	set_score(score + 1)
