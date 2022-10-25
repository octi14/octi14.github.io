extends Node

const LEVELS = ["policia", "bomberos", "playa", "hospital", "Final"]
var level = -1

var currentLevel = "policia"
var next_level = "policia"

func next_scene():
	level += 1
	if level < LEVELS.size():
		get_tree().change_scene("res://cinematics/cinematica-"+LEVELS[level]+".tscn")
	else:
		level = -1

	
func next_level():
	get_tree().change_scene("res://levels/"+LEVELS[level]+".tscn")

func _process(_delta):
	if Input.is_action_just_pressed("pause"):
		get_tree().paused = !get_tree().paused
		print(get_tree().paused)
		var pause = load("res://scenes/Pause.tscn").instance()
		get_tree().current_scene.add_child(pause)
