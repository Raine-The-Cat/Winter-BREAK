class_name DialogueBox extends Panel


#@onready var DialogueBox = get_node("PanelContainer/DialogueBox")
@export var dialogue:String = "Blah ha blahsdafasdf blah":
	set(n):
		dialogue = n
		#reset_text()
var tween:Tween

signal complete

func _input(event: InputEvent) -> void:
	if ! is_node_ready():
		return
	if event.is_action_pressed("ui_accept"):
		advance()
func advance():
	if tween:
		print("stopping tween")
		tween.stop()
		tween = null
		%DialogueBox.visible_ratio=1
	else:
		self_destruct()

func self_destruct():
	get_parent().remove_child(self)
	complete.emit()
	queue_free()
	
func reset_text():
	if ! is_node_ready():
		print("node's not ready")
		#print(%DialogueBox.text)
		#await get_tree().create_timer(.01).timeout
		#reset_text()
		return
	%DialogueBox.text = dialogue
	%DialogueBox.visible_ratio = 0
	if tween:
		tween.stop()
	tween = get_tree().create_tween()
	tween.tween_property(%DialogueBox, "visible_ratio", 1, (dialogue.length() / 30.0) + 0.5).set_trans(Tween.TRANS_LINEAR) 
	await tween.finished
	tween = null
	
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	reset_text()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
