extends CharacterBody2D

#signal died

const GRAVITY: float = 1500.0

@onready var sprite: AnimatedSprite2D = $Sprite
@onready var animation: AnimationPlayer = $AnimationPlayer
@onready var engine_sound = $EngineSound

@export var jump_force: float = -500

func _physics_process(delta):
	velocity.y += GRAVITY * delta
	
	fly()
	
	move_and_slide()
	
	if is_on_floor():
		die()

func fly() -> void:
	if Input.is_action_just_pressed("fly"):
		velocity.y = jump_force
		animation.play("power")

func die() -> void:
	engine_sound.stop()
	sprite.stop()
	set_physics_process(false)
	#died.emit()
	SignalManager.plane_died.emit()
