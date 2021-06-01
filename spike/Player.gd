extends KinematicBody2D

const UP = Vector2(0,-1)
const GRAVITY = 7
const SPEED = 60
const JUMP_HEIGHT = -110

var motion = Vector2()

func _physics_process(delta):
	motion.y += GRAVITY
	motion.x = Input.get_action_strength("ui_right")- Input.get_action_strength("ui_left")
	motion.x *= SPEED
	if motion.x != 0:
		#set run anim here
		if motion.x > 0:
			$Sprite.flip_h = false
		else:
			$Sprite.flip_h = true
	
	if motion.x == 0:
		pass
		$AnimationPlayer.play("IdleRight")
		
		
	
	if is_on_floor():
		if Input.is_action_just_pressed("ui_up"):
			motion.y = JUMP_HEIGHT
			$Sprite.set_frame(2)
	
	motion = move_and_slide(motion, UP)
	#print(motion)
	pass
