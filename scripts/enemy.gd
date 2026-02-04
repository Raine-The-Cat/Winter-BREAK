extends StaticBody2D

var health = 3
signal defeat


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Sprite2D.play("default")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
	
func damage():
	health -= 1
	if health == 2:
		$"Node2D/Heart 1".texture = load("res://sprites/rival heart 2.png")

	elif health == 1:
		$"Node2D/Heart 2".texture = load("res://sprites/rival heart 2.png")

	elif health == 0:
		$"Node2D/Heart 3".texture = load("res://sprites/rival heart 2.png")
		$Sprite2D.pause()
		defeat.emit()

	elif health <= -1:
		defeat.emit()
		
	get_node("AudioStreamPlayer2D").play()
	$Sprite2D.pause()
	$Sprite2D.modulate = Color(1,.5,.5)
	await get_tree().create_timer(.2).timeout
	$Sprite2D.play()
	$Sprite2D.modulate = Color(1,1,1)
