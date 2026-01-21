extends CharacterBody2D


@export var SPEED = 200
@export var DRAG = 2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Move the paddle left and right
func get_input():
	var input_dir := Input.get_axis("ui_left", "ui_right")
	velocity.x = (input_dir * SPEED)
	#velocity.x = move_toward(velocity.x, SPEED, DRAG)

#Gonna be honest? Dunno exactly, but it's important for moving it
func _physics_process(delta):
	get_input()
	move_and_collide(velocity * delta)
