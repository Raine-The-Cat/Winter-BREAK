class_name VNCharacter extends TextureRect

@export var dialogue_box:PackedScene
@export var default_sprite:Texture2D
@export var tagged_sprites:Dictionary[String,Texture2D]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	texture = default_sprite

func attr(attribute:String=""):
	print(attribute)
	texture = tagged_sprites.get(attribute,default_sprite)
	
func tele(targ:Node):
	position = targ.position + Vector2(-size.x/2,0)
	
func move(targ:Node, seconds:float=1, trans:Tween.TransitionType=Tween.TRANS_QUAD)->Signal:
	var pos:Vector2 = targ.position + Vector2(-size.x/2,0)
	var tween = get_tree().create_tween()
	tween.tween_property(self, "position", pos, seconds).set_trans(trans)
	return tween.finished
	
func say(text:String)->Signal:
	var d:DialogueBox=dialogue_box.instantiate()
	if ! d:
		print("Not sure how you did that, but you did")
	d.dialogue = text
	get_tree().root.add_child.call_deferred(d)
	return d.complete
	
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
