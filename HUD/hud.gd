extends Control

signal new_game

@export var wave_label : Label
@export var points_label : Label


func setWaveLabel(wave : int) -> void:
	wave_label.set_text("Wave " + str(wave))


func setPointsLabel(points : int) -> void:
	points_label.set_text("Points: " + str(points))


func playAgain():
	resetLabels()
	emit_signal("new_game")


func exit():
	get_tree().quit()


func resetLabels() -> void:
	wave_label.set_text("Wave 0")
	points_label.set_text("Points: 0")
