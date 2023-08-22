extends Node2D

signal points_changed(balance : int)

var balance : int = 0

func handle_transaction(amount : int) -> void:
	balance += amount
	emit_signal("points_changed", balance)
