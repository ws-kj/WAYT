extends KinematicBody2D

const UP = Vector2(0, -1)
const GRAVITY = 20
const ACCELERATION = 150
const MAX_SPEED = 500
const JUMP_HEIGHT = -950

var motion = Vector2()
var friction = false

func _ready():
	$AnimatedSprite.play("idle")
	
func _physics_process(delta):
	motion.y += GRAVITY;
	friction = false
	
	if Input.is_action_pressed("ui_right"):
		motion.x = min(motion.x+ACCELERATION, MAX_SPEED)
		$AnimatedSprite.set_flip_h(false)
		$AnimatedSprite.play("walk")
	elif Input.is_action_pressed("ui_left"):
		motion.x = max(motion.x-ACCELERATION, -MAX_SPEED);
		$AnimatedSprite.set_flip_h(true)
		$AnimatedSprite.play("walk")
	else:
		friction = true
		$AnimatedSprite.play("idle")
		
	if is_on_floor():
		if Input.is_action_just_pressed("ui_up"):
			motion.y = JUMP_HEIGHT
		if friction:
			motion.x = lerp(motion.x, 0, 0.2);
	else:
		if friction:
			motion.x = lerp(motion.x, 0, 0.05)
	motion = move_and_slide(motion, UP)
	pass
	
	if position.y >= 2000:
		get_parent().restartLevel()