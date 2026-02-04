extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	
func _process(_delta: float) -> void:
	await get_tree().create_timer(5).timeout
	queue_free()
