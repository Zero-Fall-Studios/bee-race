extends Node2D

@export var player : Player

func _ready():
	player.spawn(Vector2(0, 0))	

func _unhandled_input(event: InputEvent):
	if event.is_action_pressed("ui_cancel"):
		get_tree().quit()
