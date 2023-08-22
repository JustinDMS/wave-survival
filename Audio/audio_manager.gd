extends Node


func playRandomPitch(sound : AudioStream, _min : float, _max : float) -> void:
	var stream = newAudioStream()
	add_child(stream)
	stream.stream = sound
	stream.pitch_scale = randf_range(_min, _max)
	stream.play()
	await stream.finished
	stream.queue_free()


func newAudioStream() -> AudioStreamPlayer:
	return AudioStreamPlayer.new()
