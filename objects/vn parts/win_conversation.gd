extends Conversation


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var y:VNCharacter=YUKI.instantiate()
	var r:VNCharacter=RIVAL.instantiate()
	add_child(y)
	add_child(r)
	
	r.tele(%Right)
	y.tele(%Left)
	r.rotation = deg_to_rad(180)
	r.position.y += 400
	r.position.x += 40
	
	await r.say("Oh ouch oh no oof my bones ouch my boness oof")
	await y.say("lol get wrecked")
