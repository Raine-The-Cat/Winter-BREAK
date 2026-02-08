extends CPUParticles2D

@onready var target = get_node("../Enemy")
@onready var time = 1

func go() -> void:
	#direction = Vector2(cos(get_angle_to(target.position)),sin(get_angle_to(target.position)))
	emitting = true
	await get_tree().create_timer(time).timeout
	queue_free()
