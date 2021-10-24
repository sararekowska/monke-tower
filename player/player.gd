extends KinematicBody2D
onready var state_machine = $AnimationTree.get("parameters/playback")
var velocity = Vector2()
var gravity = 300
export var acc = 20
var max_speed = 200
var jump_power = -230
var grav_coeff = 1

func _physics_process(delta):
	move_and_slide(velocity, Vector2(0, -1))
	if is_on_floor():
		if Input.is_action_just_pressed("jump"):
			velocity.y = jump_power
			state_machine.travel("jump")
		else:
			velocity.y = 1
			state_machine.travel("idle")
	else:
		if velocity.y < 0:
			if Input.is_action_pressed("jump"):
				grav_coeff = 0.7
			else:
				grav_coeff = 1
		else:
			grav_coeff = 2.5
		velocity.y += gravity*delta*grav_coeff


	if Input.is_action_pressed("right"):
		get_node("Sprite").set_flip_h(false)
		velocity.x = min(velocity.x+acc, max_speed)
	elif Input.is_action_pressed("left"):
		get_node("Sprite").set_flip_h(true)
		velocity.x = max(velocity.x-acc, 1-max_speed)
	else:
		velocity.x = 0
		
	
	

func _process(delta):
	pass
