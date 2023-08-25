class_name Projectile
extends Node2D

@export_category("Config")
@export var projectile_speed : float = 1000.0
@export var max_travel_distance : float = 1000.0

@export_category("Sound")
@export var stream : AudioStream
@export var min_pitch : float = 1.0
@export var max_pitch : float = 1.0
@export_range(-25.0, 1.0, 0.1) var volume_db = 1.0

var distance_traveled : float = 0.0


func _ready():
	playAudio()


func _physics_process(delta):
	var new_pos : Vector2 = transform.x * projectile_speed * delta
	global_position += new_pos
	
	distance_traveled += new_pos.length()
	if distance_traveled > max_travel_distance:
		queue_free()


func playAudio():
	AudioManager.playModified(stream, min_pitch, max_pitch, volume_db)


func projectileHit(_area):
	if _area is Hurtbox:
		return
	queue_free()
