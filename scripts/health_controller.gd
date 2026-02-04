extends Node2D

var health = 3
@onready var heart_1 = get_node("Heart1")
@onready var heart_2 = get_node("Heart2")
@onready var heart_3 = get_node("Heart3")
@onready var yuki = get_node("../Yuki")
@onready var ball = get_node("../Ball")
var wincon = preload("res://objects/vn parts/Win Conversation.tscn")

signal player_lose

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	
func _input(press):
	if health == -1 and press.is_action_pressed("ui_accept"):
		get_tree().reload_current_scene()
		


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
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
		_level_win()
		
func _level_win():
	print("wniner winner chickkkkkkkdiner")
	ball.visible = false
	ball.process_mode = Node.PROCESS_MODE_DISABLED
	yuki.process_mode = Node.PROCESS_MODE_DISABLED
	var scene = wincon.instantiate()
	get_parent().add_child(scene)
	


func _on_enemy_defeat() -> void:
	_level_win()
