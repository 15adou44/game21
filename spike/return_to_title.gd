extends Control


func _on_Button_pressed():
	get_tree().change_scene('res://Control.tscn')


func _on_FullscreenButton_pressed():
	OS.window_fullscreen = !OS.window_fullscreen
