extends Control

@onready var score_label = $MarginContainer/ScoreLabel

func _ready():
	SignalManager.score_updated.connect(on_score_updated)


func _process(_delta):
	#score_label.text = str(ScoreManager.get_score())
	pass

func on_score_updated():
	score_label.text = str(ScoreManager.get_score())
