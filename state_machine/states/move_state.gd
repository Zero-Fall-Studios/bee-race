class_name MoveState
extends State

@export var speed : float = 50
@export var dash_state : State

func enter():
	return null

func exit(): 
	return null
	
func process_physics(delta):
	if Input.is_action_just_pressed("dash"):
		return dash_state
		
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		parent.velocity.x = direction * speed
		if parent.velocity.x < 0:
			parent.sprite.flip_h = true
		else:
			parent.sprite.flip_h = false
	else:
		parent.velocity.x = move_toward(parent.velocity.x, 0, speed)
		
	var direction_y = Input.get_axis("ui_up", "ui_down")
	if direction_y:
		parent.velocity.y = direction_y * speed
	else:
		parent.velocity.y = move_toward(parent.velocity.y, 0, speed)
		
	parent.move_and_slide()
	
	parent.position.y = clamp(parent.position.y, -120, 32)

