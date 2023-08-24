class_name EnemyPool
extends Node

@export var master_pool : Array[PackedScene]

@onready var weights : Dictionary = {
	master_pool[0] : 90,
	master_pool[1] : 10,
	}


func buildPool(_wave : int, limit : int) -> Array:
	var pool : Array = []
	var total_weight : int = 0
	var keys = weights.keys()
	
	if len(master_pool) != len(weights.keys()):
		push_error("Enemy pool length doesn't match number of listed weights")
	
	# Get total amount of weight
	for key in keys:
		total_weight += weights[key]
	
	# For every enemy in the wave, pick a random enemy based on weight
	for i in range(0, limit):
		var roll : int = 1 + randi_range(0, total_weight)
		
		# Base Enemy
		if roll <= weights[keys[0]]: pool.append(master_pool[0])
		# Strong Enemy
		elif roll <= weights[keys[0]] + weights[keys[1]]: pool.append(master_pool[1])
		else: print("Unexpected roll: ", roll)
	
	if len(pool) != limit:
		print("Pool Length: ", len(pool))
		print("Limit: ", limit)
		push_error("Enemy pool does not match wave spawn limit")
	
	return pool
