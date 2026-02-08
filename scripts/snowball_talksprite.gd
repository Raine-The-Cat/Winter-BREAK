extends VNCharacter

const particle = preload("res://objects/snowball_breaking.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	super()
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	super(delta)
	
func post_ready():
	var rival = get_node("../Talksprite_Rival")
	rival.hit.connect(_on_rival_area_hit)
	
	
func _on_rival_area_hit() -> void:
	print("okay does this work")
	var scene = particle.instantiate()
	get_parent().add_child(scene)
	scene.global_position = self.global_position + Vector2(0,165)
	scene.get_node("../Snowball breaking").emission_sphere_radius = 40.0
	scene.get_node("../Snowball breaking").amount = 100
	scene.get_node("../Snowball breaking").time = 5
	scene.get_node("../Snowball breaking").go()
	visible = false
	
