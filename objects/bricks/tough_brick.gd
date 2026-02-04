extends "res://scripts/basic_brick.gd"

var health = 2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _break():
	if health == 0:
		var scene = destruction.instantiate()
		get_parent().add_child(scene)
		scene.global_position = self.global_position
		scene.get_node("CPUParticles2D").emitting = true
		self.queue_free()
	else:
		health -= 1
		get_node("AudioStreamPlayer2D").play()
