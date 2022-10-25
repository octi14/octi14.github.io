extends Area2D

signal pressed
signal unpressed


func _ready():
	connect("body_entered", self, "_on_body_entered")
	connect("body_exited", self, "_on_body_exited")
	
func _on_body_entered(body: PhysicsBody2D):
	if not body is Coin:
		return
	emit_signal("pressed")
	$sprite.play("closed")
	body.queue_free()
	spawn_collision()
	AudioPlayer.stream = load("res://audio/candado.wav")
	AudioPlayer.volume_db = -6
	AudioPlayer.play()
	
	
func _on_body_exited(body: PhysicsBody2D):
	if not body is Coin:
		return
	emit_signal("unpressed")

func spawn_collision():
	var collision = StaticBody2D.new()
	var shape = CollisionShape2D.new()
	shape.shape = RectangleShape2D.new()
	shape.scale = Vector2(4,4)
	collision.add_child(shape)
	add_child(collision)
	collision.position = Vector2(70,70)
