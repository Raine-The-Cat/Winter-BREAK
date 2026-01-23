extends StaticBody2D

var health = 3


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func damage():
	health -= 1
	if health == 2:
		$"Node2D/Heart 1".texture = load("res://sprites/h4.png")
	
