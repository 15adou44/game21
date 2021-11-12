extends Camera2D
 
 
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var half_width = get_viewport_rect().size.x/2
onready var half_height = get_viewport_rect().size.y/2
onready var size_x = get_viewport_rect().size.x
onready var size_y = get_viewport_rect().size.y
 
onready var current_view_x_right = size_x
onready var current_view_x_left = 0
onready var current_view_y_up = 0
onready var current_view_y_down = size_y
 
onready var player = owner.get_node("Player")
 
var shift_left = false
var shift_right = false
var shift_up = false
var shift_down = false
 
func check_player_pos():
	if player.position.x > current_view_x_right:
		shift_right = true
	if player.position.x < current_view_x_left:
		shift_left = true
	if player.position.y > current_view_y_down:
		shift_down = true
	if player.position.y < current_view_y_up:
		shift_up = true

#when player reaches the edge of screen, move the camera one screen size left, right, up or down
func shift_camera():
	if shift_right ==true:
		position.x += size_x
		current_view_x_right+=size_x
		current_view_x_left+=size_x
		shift_right = false
 
	if shift_left ==true:
		position.x -= size_x
		current_view_x_right-=size_x
		current_view_x_left-=size_x
		shift_left = false
 
	if shift_down ==true:
		position.y += size_y
		current_view_y_down+=size_y
		current_view_y_up+=size_y
		shift_down = false

	if shift_up ==true:
		position.y -= size_y
		current_view_y_down-=size_y
		current_view_y_up-=size_y
		shift_up = false
 
 
 
func _ready():
	position = Vector2(half_width,half_height)
 
func _process(delta):
	check_player_pos()
	shift_camera()
 
	pass # Replace with function body.
