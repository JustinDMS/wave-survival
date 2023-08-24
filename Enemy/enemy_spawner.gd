class_name Spawner
extends Node2D

signal enemy_spawned(enemy : Enemy)

@export var player : Player


func spawnEnemy(scene : PackedScene) -> void:
	# New enemy
	var new_enemy = scene.instantiate()
	get_parent().add_child(new_enemy)
	
	# Set refs
	new_enemy.player = player
	new_enemy.global_position = global_position
	
	# Tell the wave manager that we spawned an enemy
	emit_signal("enemy_spawned", new_enemy)
