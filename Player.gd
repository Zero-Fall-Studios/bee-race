extends CharacterBody2D

@export var normalspeed = 50.0
@export var dashspeed = 800.0
@export var dashlength = 0.1

enum direction_state { Left, Right }

var current_direction_state = direction_state.Right

@onready var dash = $Dash

func _physics_process(delta):
	
	if Input.is_action_just_pressed("dash"):
		dash.start_dash(dashlength)
		
	var speed = dashspeed if dash.is_dashing() else normalspeed
	
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * speed
		if velocity.x < 0:
			if (current_direction_state == direction_state.Right):
				$Sprite2D.flip_h = true
			current_direction_state = direction_state.Left
		else:
			if (current_direction_state == direction_state.Left):
				$Sprite2D.flip_h = false
			current_direction_state = direction_state.Right
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		
	var direction_y = Input.get_axis("ui_up", "ui_down")
	if direction_y:
		velocity.y = direction_y * speed
	else:
		velocity.y = move_toward(velocity.y, 0, speed)
		
	move_and_slide()
	
	position.y = clamp(position.y, -120, 32)
