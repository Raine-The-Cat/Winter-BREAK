extends Area2D

@onready var ball = get_node("../Ball")

signal gutterball

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print(get_path())
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#print(get_overlapping_areas().any(func(ball_check): return ball_check == "Ball"))
	#print(get_overlapping_areas())
	if overlaps_body(ball):
		print("yooooo")
		gutterball.emit()
