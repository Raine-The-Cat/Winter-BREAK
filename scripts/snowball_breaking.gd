extends CPUParticles2D

@onready var target = get_node("../Enemy")

func go() -> void:
	#direction = Vector2(cos(get_angle_to(target.position)),sin(get_angle_to(target.position)))
	emitting = true
	await get_tree().create_timer(1).timeout
	queue_free()
