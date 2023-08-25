extends Node2D

signal changed(current_clip : int, current_ammo : int)

@export var ammo_capacity : int = 1
@export var clip_capacity : int = 1
@export var ammo_per_shot : int = 1
@export var reload_time : float = 1.0
@export var timer : Timer

@onready var current_ammo : int = ammo_capacity
@onready var current_clip : int = clip_capacity

var is_reloading : bool = false


# Updates HUD when first spawned
func _ready():
	ammoChanged()


func consumeAmmo() -> void:
	current_clip -= ammo_per_shot
	if current_clip < 1:
		reload()
	ammoChanged()


func reload() -> void:
	# Remaining ammo for reloading with a partially empty clip
	var remaining := clip_capacity - current_clip
	
	# No Ammo
	if current_ammo < 1:
		print("No ammo!")
		return
	
	# Only enough ammo to partially reload
	elif current_ammo < remaining:
		current_clip += current_ammo
		current_ammo = 0
	
	# Enough ammo to fully reload
	else:
		current_ammo -= remaining
		current_clip = clip_capacity
	
	startReloadTimer()


func canFire() -> bool:
	if current_clip >= ammo_per_shot and not is_reloading:
		return true
	return false


func ammoChanged() -> void:
	emit_signal("changed", current_clip, current_ammo)


func startReloadTimer() -> void:
	is_reloading = true
	timer.start(reload_time)


func doneReloading():
	ammoChanged()
	is_reloading = false
