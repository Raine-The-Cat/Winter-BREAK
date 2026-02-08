extends Conversation

@onready var yuki = get_node("../Yuki")
@onready var ball = get_node("../Ball")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if global.seen_intro == true:
		ball.process_mode = Node.PROCESS_MODE_ALWAYS
		yuki.process_mode = Node.PROCESS_MODE_ALWAYS
		get_node("../Enemy/Sprite2D").play("default")
		queue_free()
	else:
		var y:VNCharacter=YUKI.instantiate()
		var r:VNCharacter=RIVAL.instantiate()
		
		add_child(y)
		add_child(r)
		
		y.tele(%Off_Left)
		r.tele(%Off_Right)
		
		y.attr("shieldless")
		y.move(%Left)
		await y.say("I’m almost home now, the walk from town felt even longer than normal, somehow.")
		
		await r.say("Not so fast!")
		
		y.attr("block")
		await y.say("Whoa!")
		
		y.attr("default")
		r.move(%Right)
		await r.say("Ha, nice move grabbing that lid so quickly, I see you haven’t slowed down too much.")
		
		await y.say("Val? What are you doing here?")
		
		r.attr("heh")
		await r.say("I knew you’d have to come through here!")
		
		y.attr("tired")
		await y.say("…")
		await y.say("My driveway?")
		
		await r.say("Exactly!")
		r.move(%Center)
		await r.say("When it snowed again, I knew I could finally get that rematch!")
		
		await y.say("Rematch? Look, I don’t have time for this, I need to go inside and-")
		
		r.attr("default")
		r.move(%Close)
		await r.say("SCARED, are we?")
		
		await y.say("What? No, I’m just in a hurr-")
		
		r.move(%Right)
		await r.say("You can go, that's fine.")
		r.attr("point")
		await r.say("So long as you admit that if we didn’t have to stop our last fight early that I would have won!")
		
		y.attr("default")
		await y.say("What.")
		await y.say("We fought for FIVE DAYS straight on even footing.")
		
		r.attr("default")
		await r.say("That may be, but if the snow hadn’t all melted, I would have won in the end!")
		
		y.attr("tired")
		y.move(%Close)
		await y.say("This is childish, just let me pa-")
		
		r.move(%Center)
		y.move(%Left)
		await r.say("I have been practicing ever since that day to prove my strength once winter came again!")
		r.attr("heh")
		await r.say("You won’t force a dishonorable tie this time!")
		r.move(%Close)
		await r.say("While you were getting soft, I studied Bun Tzu's Art of Ball!")
		
		await y.say("Whatever. I just need to go in and make some soup, then I’ll come back out and fight-")
		
		r.move(%Right)
		r.attr("point")
		await r.say("Nice try! You’ll just lock the door and tell me to go away if I let you inside!")
		
		y.attr("default")
		await y.say("………………")
		y.attr("tired")
		await y.say("…N-no I won’t.")
		
		r.attr("default")
		await r.say("No more stalling!")
		r.attr("point")
		r.move(%Center)
		await r.say("Ready!")
		r.attr("heh")
		r.move(%Close)
		await r.say("Set!")
		r.move(%Off_Right)
		y.move(%Off_Left)
		r.attr("default")
		await r.say("Snow battle!!!!!")
		
		global.seen_intro = true
		ball.process_mode = Node.PROCESS_MODE_ALWAYS
		yuki.process_mode = Node.PROCESS_MODE_ALWAYS
		get_node("../Enemy/Sprite2D").play("default")
		queue_free()
