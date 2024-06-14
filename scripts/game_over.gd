extends Control

@onready var timer = $Timer
@onready var game_over_label = $GameOverLabel
@onready var space_label = $SpaceLabel
@onready var game_over_sound = $GameOverSound

func _ready():
	hide()
	SignalManager.plane_died.connect(on_plane_died)

func _process(_delta):
	if space_label.visible and Input.is_action_just_pressed("fly"):
		GameManager.load_main_scene()

func on_plane_died() -> void:
	game_over_sound.play()
	show()
	timer.start()


func _on_timer_timeout():
	game_over_label.hide()
	space_label.show()
