extends Node


func playModified(sound : AudioStream, _min_pitch : float = 1.0, _max_pitch : float = 1.0, volume_db : float = 1.0) -> void:
	# New audio stream
	var stream = newAudioStream()
	add_child(stream)
	
	# Change stream params
	stream.stream = sound
	stream.pitch_scale = randf_range(_min_pitch, _max_pitch)
	stream.volume_db = volume_db
	
	# Play audio and queue_free() when finished
	stream.play()
	await stream.finished
	stream.queue_free()


func newAudioStream() -> AudioStreamPlayer:
	return AudioStreamPlayer.new()
