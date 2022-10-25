extends Panel

func play_click():
	AudioPlayer.stream = load("res://audio/click.wav")
	AudioPlayer.volume_db = -8
	AudioPlayer.play()

func _on_Continuar_pressed():
	play_click()
	global.next_scene()

func _on_Menu_pressed():
	play_click()
	global.level = -1
	get_tree().change_scene("res://Inicio.tscn")
