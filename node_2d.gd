extends Node2D

@export var template: PackedScene

func _unhandled_input(event: InputEvent):
	if event.is_action_pressed("ui_cancel"):
		get_tree().quit()
