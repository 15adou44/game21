extends Control

func _on_Button_pressed():
	get_tree().change_scene('res://World.tscn')


func _on_BackButton_pressed():
	get_tree().change_scene("res://Control.tscn")

func _ready():
	$deadsfx.play()
	$hit.play()
