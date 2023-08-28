extends Node

@export var wave_manager : Node2D
@export var hud : Control
@export var game_over : Control

var cursor = load("res://Assets/crosshair_64.png")

func _ready():
	Input.set_custom_mouse_cursor(cursor,Input.CURSOR_ARROW, Vector2(32, 32))
	startGame()


func startGame():
	wave_manager.startWave()


func showGameOver():
	hud.visible = false
	game_over.visible = true


func hideGameOver():
	hud.visible = true
	game_over.visible = false


func newGame():
	get_tree().reload_current_scene()
