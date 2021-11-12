extends Control

func _ready():
	for button in $Menu/CenterRow/Buttons.get_children():
		button.connect("pressed", self, "_on_Button_pressed")
		$Menu/CenterRow/Buttons/NewGameButton.grab_focus()
		#when scene is ready, make focus on newgamebutton so keyboard can be used to navigate it

func _on_NewGameButton_pressed():
	get_tree().change_scene("res://World.tscn")


func _on_OptionsButton_pressed():
	get_tree().change_scene("res://Options.tscn")


func _on_ExitButton_pressed():
	get_tree().quit()

#when each button is pressed their respective function is executed (change_scene or quit)
