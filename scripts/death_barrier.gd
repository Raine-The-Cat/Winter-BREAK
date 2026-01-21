extends Area2D

@onready var ball = get_node("../Ball")
var damage_timer = 0

signal gutterball

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print(get_path())
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if overlaps_body(ball) and damage_timer <= 0:
		print("yooooo")
		gutterball.emit()
		damage_timer = 10
		
	# I don't know why i had to do this, but if I didn't the fact the ball was in the death barrier would register SIX TIMES before it got reset
	if damage_timer >= 0:
		damage_timer -= 1
