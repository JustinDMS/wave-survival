class_name EnemyPool
extends Node

# This script generates a wave of enemies based on weighted chance

@export var master_pool : Array[PackedScene]

@onready var weights : Dictionary = {
	master_pool[0] : 100,
	master_pool[1] : 0,
}


func buildPool(_wave : int, limit : int) -> Array:
	var pool : Array = []
	var total_weight : int = 0
	
	
	# Set weight corresponding to wave and update weights dict
	setWeightsFromWave(_wave)
	var keys = weights.keys()
	# Get total amount of weight
	for key in keys:
		total_weight += weights[key]
	
	# For every enemy in the wave, pick a random enemy based on weight
	for i in range(0, limit):
		var roll : int = randi_range(0, total_weight)
		
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


# Choose "hard-coded" weights based on weight
# Could be interesting to formulate this instead
func setWeightsFromWave(wave : int) -> void:
	var new_weights : Dictionary = {}
	match wave:
		1, 2:
			print("Using weight for waves: 1, 2")
			new_weights = {
				master_pool[0] : 100,
				master_pool[1] : 0,
			}
		3, 4, 5:
			print("Using weight for waves: 3, 4, 5")
			new_weights = {
				master_pool[0] : 90,
				master_pool[1] : 10,
			}
		_:
			print("Using weight for waves: >5")
			new_weights = {
				master_pool[0] : 75,
				master_pool[1] : 25,
			}
	
	weights = new_weights
