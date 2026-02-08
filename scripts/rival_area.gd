extends Area2D


@onready var snowball = get_node("../../Snowball_talksprite/Snowball area")

signal hit

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if overlaps_area(snowball):
		print("yooooo")
		hit.emit()
		queue_free()
