extends CharacterBody2D

@export var speed = 180
@export var angle = 0
@export var in_play = false
@onready var paddle = get_node("%Paddle")
var ball_distance = 20

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _input(press):
	if in_play == false:
		if press.is_action_pressed("ui_accept"):
			in_play = true
			velocity = Vector2(0, speed * -1)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if in_play == false:
		position = paddle.position
		position.y -= ball_distance

	var collide := move_and_collide(velocity * delta)
	
	if collide:	
		if collide.get_collider().name == "Paddle":
			print("paddle")
			velocity = Vector2(cos(get_angle_to(paddle.position)),sin(get_angle_to(paddle.position))) * -speed
		else: 
			velocity = (velocity.bounce(collide.get_normal()))
