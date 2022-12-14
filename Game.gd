extends Node2D

var coins = 0

func _ready():
	coins = 0
	for child in $TileMap.get_children():
		if child is Coin:
			coins += 1


func _on_Chest2_body_entered(body):
	if body is Coin:
		coins -= 1
		if coins == 0:
			end_level()

func _on_Chest_body_entered(body):
	if body is Coin:
		coins -= 1
		if coins == 0:
			end_level()

func end_level():
	$Panel.visible = true
	$Tas.queue_free()
	MusicPlayer.stream = load("res://audio/success.wav")
	MusicPlayer.volume_db = -4
	MusicPlayer.play()

func _on_Chest_body_exited(_body):
	pass
#	if body is Coin:
#		coins += 1
