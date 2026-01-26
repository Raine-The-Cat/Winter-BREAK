extends StaticBody2D

var health = 3
signal defeat


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func damage():
	health -= 1
	if health <= 2:
		$"Node2D/Heart 1".texture = load("res://sprites/rival heart 2.png")
	if health <= 1:
		$"Node2D/Heart 2".texture = load("res://sprites/rival heart 2.png")
	if health <= 0:
		$"Node2D/Heart 3".texture = load("res://sprites/rival heart 2.png")
	if health <= -1:
		defeat.emit()
	
