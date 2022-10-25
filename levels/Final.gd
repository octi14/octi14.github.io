extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	MusicPlayer.stream = load("res://audio/final.wav")
	MusicPlayer.volume_db = -10
	MusicPlayer.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if !MusicPlayer.playing:
		MusicPlayer.play()


func _on_Button_pressed():
	get_tree().change_scene("res://Inicio.tscn")
