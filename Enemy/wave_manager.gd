extends Node2D

signal wave_changed(wave : int)

@export var spawners : Array[Spawner]

@onready var spawn_delay = $SpawnDelay
@onready var wave_delay = $WaveDelay

const MAX_SPAWN_TIME : float = 0.25
const MIN_SPAWN_TIME : float = 0.75


var wave : int = 0
var limit : int = 1
var enemies_spawned : int = 0
var enemies_killed : int = 0


func _ready():
	getAllSpawners()


func incrementWave() -> void: 
	wave += 1
	emit_signal("wave_changed", wave)


func setEnemyLimit() -> void:
	limit = wave * 2


func getAllSpawners() -> void:
	for node in get_children():
		if node is Spawner:
			spawners.append(node)


# Chooses a random spawner and spawns an enemy
func sendWave() -> void:
	spawners.pick_random().spawnEnemy()


func incrementEnemiesSpawned() -> void:
	enemies_spawned += 1


func incrementEnemiesKilled() -> void:
	enemies_killed += 1
	print("Enemies killed: ", enemies_killed)
	
	if enemies_killed == limit:
		startWave()


func enemySpawned(_enemy):
	incrementEnemiesSpawned()


func startWave():
	enemies_spawned = 0
	enemies_killed = 0
	wave_delay.start()


# Spawns enemies until the limit is reached
func spawnDelayTimeout():
	if enemies_spawned < limit:
		sendWave()
	else:
		spawn_delay.stop()


# Start the next wave
func waveDelayTimeout():
	incrementWave()
	setEnemyLimit()
	print("Wave ", wave, " started!")
	startRandomSpawnTimer()


func startRandomSpawnTimer() -> void:
	spawn_delay.start(randf_range(MIN_SPAWN_TIME, MAX_SPAWN_TIME))
