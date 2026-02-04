extends "res://scripts/basic_brick.gd"

var max_health = 2.0
var health = max_health

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Sprite2D.modulate = Color(0, 0, 1)


func _break():
	if health == 0:
		var scene = destruction.instantiate()
		get_parent().add_child(scene)
		scene.global_position = self.global_position
		scene.get_node("CPUParticles2D").emitting = true
		self.queue_free()
	else:
		health -= 1
		print((max_health - health) / max_health, (max_health - health) / max_health, 1)
		get_node("AudioStreamPlayer2D").play()
		$Sprite2D.modulate = Color((max_health - health) / max_health, (max_health - health) / max_health, 1)
		
