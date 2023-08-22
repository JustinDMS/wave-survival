extends Node2D
signal dead

@export var health : int = 1

enum {DEAD, ALIVE}

var status = ALIVE


func takeDamage(amount : int) -> void:
	health -= amount
	if health <= 0 and status == ALIVE:
		death()


func death() -> void:
	status = DEAD
	emit_signal("dead")
