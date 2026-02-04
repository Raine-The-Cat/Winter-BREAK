extends AudioStreamPlayer2D

var rng = RandomNumberGenerator.new()

func modulated_play():
	pitch_scale = rng.randf_range(.94, 1.00)
	print(pitch_scale)
	play()
	
