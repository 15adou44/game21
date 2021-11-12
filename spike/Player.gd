extends KinematicBody2D

const UP = Vector2(0,-1)
const GRAVITY = 7
const SPEED = 60
const JUMP_HEIGHT = -115

var motion = Vector2()

func _physics_process(delta):
	dash()
	
	motion.y += GRAVITY
	motion.y = clamp(motion.y,-200, 200)
	motion.x = Input.get_action_strength("ui_right")- Input.get_action_strength("ui_left")
	motion.x *= SPEED
	if motion.x != 0:
		$AnimationPlayer.play("Run") 
		if motion.x > 0:
			$Sprite.flip_h = false	
		else:
			$Sprite.flip_h = true
	else:
		$AnimationPlayer.play("IdleRight")
	if is_on_floor():if Input.is_action_just_pressed("ui_up"):
			motion.y = JUMP_HEIGHT
			$jump.play()
	
	motion = move_and_slide(motion, UP)
	#print(motion)
	pass
	
	

#dash
var dashDirection = Vector2(1, 0)
var canDash = false
var dashing = false

func dash():
	if is_on_floor():
		canDash = true
	
	if Input.is_action_pressed("ui_right"):
		dashDirection = Vector2(1, 0)
	if Input.is_action_pressed("ui_left"):
		 dashDirection = Vector2(-1, 0)
	
	if Input.is_action_pressed("ui_dash") and canDash:
		motion = dashDirection.normalized() * 2000
		canDash = false
		dashing = true
		yield(get_tree().create_timer(0.2),"timeout")
		dashing = false
		
		#if Input.is_action_pressed("ui_down"):
			#$Sprite.set_frame(11)
			#motion.x = 0
			#motion.y = 0
			
#reddit 
	
