extends CharacterBody2D

@export var speed = 180
@export var angle = 0
@export var in_play = false
@onready var paddle = get_node("%Paddle")
const particle = preload("res://objects/snowball_breaking.tscn")

var ball_distance = 12

signal brick_check


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print(get_path())

#Ball launching code for the start of the level
func _input(press):
	if in_play == false:
		if press.is_action_pressed("ui_accept"):
			in_play = true
			#Note: the ball is launched at a VERY slight right angle so the player can't just repeatedly bounce it back up in the same spot and cheese the fight
			velocity = Vector2(1, speed * -1)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:

	var collide := move_and_collide(velocity * delta)
	
	if collide:	
		#the ball bounces off walls, and if it bounces off the paddle, it bounces at a relative angle to the paddle
		if collide.get_collider().name == "Paddle":
			print("paddle")
			get_node("Paddle_Audio").play()
			velocity = Vector2(cos(get_angle_to(paddle.position)),sin(get_angle_to(paddle.position))) * -speed
		#if the ball hits a brick, it runs the brick's break function and checks how many bricks are left
		elif collide.get_collider().is_in_group("Bricks"):
			collide.get_collider().call("_break")
			velocity = (velocity.bounce(collide.get_normal()))
			brick_check.emit()
		#if the ball hits the enemy, it breaks and deals damage
		elif collide.get_collider().is_in_group("Enemy"):
			collide.get_collider().call("damage")
			#create particle effect
			var scene = particle.instantiate()
			get_parent().add_child(scene)
			scene.global_position = self.global_position
			scene.get_node("../Snowball breaking").direction = velocity
			scene.get_node("../Snowball breaking").go()
			#reset to paddle
			in_play = false
		#balls to the walls
		else: 
			velocity = (velocity.bounce(collide.get_normal()))
			get_node("Wall_Audio").modulated_play()
			
				
			
func _process(_delta: float) -> void:
		# Keeps the ball above the paddle until fired
	if in_play == false:
		position = paddle.position
		position.y -= ball_distance
	else:
		get_node("Sprite2D").rotation += deg_to_rad(2)


func _on_death_barrier_gutterball() -> void:
	# //Play some kind of destruction animation, then when done, put the ball back out of play, maybe activate a reforming animation?
	get_node("Gutter_Audio").play()
	in_play = false
