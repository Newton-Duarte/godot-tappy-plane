extends Control

@onready var high_score_value = $MC/HighScoreValue

func _ready():
	high_score_value.text = str(ScoreManager.get_high_score())

func _process(_delta):
	if Input.is_action_just_pressed("fly"):
		GameManager.load_game_scene()
