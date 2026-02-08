extends Conversation

const ending = preload("res://objects/vn parts/ending_sequence.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var y:VNCharacter=YUKI.instantiate()
	var r:VNCharacter=RIVAL.instantiate()
	var s:VNCharacter=SNOW.instantiate()
	add_child(s)
	add_child(y)
	add_child(r)
	
	
	s.post_ready()
	r.tele(%Right)
	y.tele(%Off_Left)
	s.tele(%Off_Left)
	
	await r.say("Ha, you haven’t won yet, I-")
	await s.move(%Off_Right,.4,Tween.TRANS_LINEAR)
	await r.say("……")
	
	y.move(%Left)
	await y.say("...You okay, Val?")
	
	await r.say("Mmmphmphhhhmmm?")
	await r.say("Mmphhhm...")
	await r.say("Mmmphmmphmmph!")
	
	await y.say("Okay. If you say so.")
	y.move(%Off_Right)
	await y.say("See you later, better luck next year.")
	
	var end = ending.instantiate()
	add_child(end)
	
