extends StaticBody2D

var destruction = preload("res://objects/bricks/brick_break.tscn")

# Called when the node enters the scene tree for the first time.
#func _ready() -> void:



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass
	
func _break():
	var scene = destruction.instantiate()
	get_parent().add_child(scene)
	scene.global_position = self.global_position
	scene.get_node("CPUParticles2D").emitting = true
	self.queue_free()
