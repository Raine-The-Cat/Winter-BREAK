class_name Conversation extends ReferenceRect

const YUKI = preload("res://objects/vn parts/talksprite_yuki.tscn")
const RIVAL = preload("res://objects/vn parts/talksprite_rival.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var c:VNCharacter=YUKI.instantiate()
	var r:VNCharacter=RIVAL.instantiate()
	add_child(c)
	add_child(r)
	
	r.tele(%Off_Right)
	c.tele(%Left)
	
	await c.say("Boy I sure do love walking home to my large wife.")
	await c.say("I would hate it if someone challenged me to some kind of winter related battle")
	
	await r.move(%Right, .1)
	await r.say("Surprise bithc")
	
	
