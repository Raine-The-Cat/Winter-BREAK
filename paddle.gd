extends CharacterBody2D


@export var SPEED = 200
@export var DRAG = 2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func get_input():
	var input_dir := Input.get_axis("ui_left", "ui_right")
	velocity.x = (input_dir * SPEED)
	#velocity.x = move_toward(velocity.x, SPEED, DRAG)

func _physics_process(delta):
	get_input()
	move_and_collide(velocity * delta)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
	
	#var input_dir := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	#var input_dir := Input.get_axis("ui_left", "ui_right")
	#var direction := (transform.origin * Vector2(input_dir.x, input_dir.y)).normalized()
	#if input_dir:
		#velocity.x = 5
		#velocity.x = move_toward(velocity.x, SPEED, DRAG)
	#else:
		#velocity.x = move_toward(velocity.x, 0, DRAG)
