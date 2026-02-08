extends VNCharacter

var spin_time = 1
var spin_speed = 1
var tween_value = 0
signal hit

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	super()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	super(delta)
	


func _on_rival_area_hit() -> void:
	print("huh?")
	texture = tagged_sprites.get("Snowdrift",default_sprite)
	hit.emit()
#	var copy = Sprite2D.new()
#	add_child(copy)
#	copy.texture = load("res://sprites/Rival/rival_talksprite_placeholder.png")
#	copy.global_position = global_position
#	texture = null
#	var tween = get_tree().create_tween()
#	tween.tween_property(self, "tween_value", spin_speed, spin_time)
#	copy.scale.y = sin(tween_value)
