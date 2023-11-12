extends CharacterBody2D

const SPEED = 300.0
var JUMP_VELOCITY = -400
var buff

@onready var animatedSprite = $AnimatedSprite2D

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	buff = Global.jump
	if (velocity.x > 1 or velocity.x < -1):
		animatedSprite.animation = "running"
	else:
		animatedSprite.animation = "idle"


	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
		animatedSprite.animation = "jump"

	# Handle Jump.
	if (Input.is_action_just_pressed("ui_accept") or Input.is_action_just_pressed("Up")) and is_on_floor():
		velocity.y = JUMP_VELOCITY + buff

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("Left", "Right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, 50)

	move_and_slide()

	if (velocity.x == 0): return
	var isLeft = velocity.x < 0
	animatedSprite.flip_h = isLeft
	
	