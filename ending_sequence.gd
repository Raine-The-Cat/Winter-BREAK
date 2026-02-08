extends Node2D

var _start = 0
var _end = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("step one")
	await _tweenerang($Black, false)
	print("step two")
	await _tweenerang($"Scene 1", false)
	await get_tree().create_timer(2).timeout
	await _tweenerang($"Scene 1", true)
	
	await _tweenerang($"Scene 2", false)
	await get_tree().create_timer(2).timeout
	await _tweenerang($"Scene 2", true)
	
	await _tweenerang($"Scene 3", false)
	await get_tree().create_timer(2).timeout
	await _tweenerang($"Scene 3", true)
	
	await _tweenerang($"Scene 4", false)
	await get_tree().create_timer(2).timeout
	await _tweenerang($"Scene 4", true)
	
	await _tweenerang($"Scene 5", false)
	await get_tree().create_timer(2).timeout
	
	
	


func _tweenerang(targ:Node, visibility:bool=true, speed:float=2, trans:Tween.TransitionType=Tween.TRANS_LINEAR):
	if visibility == true:
		_start = 1.0
		_end = 0.0
	else:
		_start = 0.0
		_end = 1.0
	targ.modulate.a = _start
	var tween = get_tree().create_tween()
	tween.tween_property(targ, "modulate:a", _end, speed).set_trans(trans)
	return tween.finished
