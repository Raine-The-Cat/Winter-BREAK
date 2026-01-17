extends AnimatableBody2D

@export var SPEED = 5
@export var DRAG = 2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var input_dir := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var direction := (transform.basis * Vector2(input_dir.x, input_dir.y)).normalized()
	if direction:
		velocity.x = move_toward(velocity.x, SPEED, DRAG)
	else:
		velocity.x = move_toward(velocity.x, 0, DRAG)
