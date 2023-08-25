extends Node


func tryDrop(drop : PackedScene, drop_position : Vector2, player : Player) -> void:
	if not drop:
		print("Invalid scene for drop")
		return
	
	var new_drop = drop.instantiate()
	
	if canDrop(new_drop.drop_chance):
		spawnDrop(new_drop, drop_position, player)


func canDrop(drop_chance : int) -> bool:
	var roll : int = randi_range(0, 100)
	if roll < drop_chance:
		return true
	
	return false


func spawnDrop(drop : Drop, drop_position : Vector2, player : Player) -> void:
	print("Spawning drop")
	get_parent().call_deferred("add_child", drop)
	drop.global_position = drop_position
	drop.picked_ammo.connect(Callable(player, "addAmmo"))
