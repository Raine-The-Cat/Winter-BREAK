extends Node2D

var health = 3
@onready var heart_1 = get_node("Heart1")
@onready var heart_2 = get_node("Heart2")
@onready var heart_3 = get_node("Heart3")

signal player_lose

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
	
func _input(press):
	if health == -1 and press.is_action_pressed("ui_accept"):
		get_tree().reload_current_scene()
		


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

#This is bad code, but it will work
func _on_death_barrier_gutterball() -> void:
	health -= 1
	if health == 2:
		heart_3.visible = false
	elif health == 1:
		heart_2.visible = false
	elif health == 0:
		heart_1.visible = false
	elif health == -1:
		player_lose.emit()


func _on_ball_brick_check() -> void:
	# This wait is dumb as heck but for some reason this code fires off first if i dont do this, meaning it counts before the brick is destroyed
	await get_tree().create_timer(.01).timeout
	print(get_tree().get_nodes_in_group("Bricks").size())
	if get_tree().get_nodes_in_group("Bricks").size() == 0:
		print("wniner winner chickkkkkkkdiner")
