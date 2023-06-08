extends Node2D

var PauseMenu: String = "res://scenes/PauseMenu.tscn"
var pause_menu: Object = null
var GameOverMenu: String = "res://scenes/GameOver.tscn"
var gameover_menu: Object = null
onready var player: KinematicBody2D = $Player

func _ready() -> void:
	OS.center_window()
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	$GUI/StatusGUI/Label2.set_text(String ($GoldChest.get_child_count()))
	get_tree().paused = false

func _process(delta):
	_on_PauseButton_pressed()


func _on_PauseButton_pressed():
	if Input.is_action_just_pressed("ui_cancel"):
		if pause_menu == null:
			pause_menu = load(PauseMenu).instance()
			$GUI/PauseScreen.add_child(pause_menu)
			pause_menu.connect("nuller", self, "on_paused_quit")
			get_tree().paused = true


func on_paused_quit():
	pause_menu = null


func _on_Player_died():
	player.hide() # 'quee_free' eliminaria la camara y la screen se instanciaria en el origen
	gameover_menu = load(GameOverMenu).instance()
	$GUI/GameOverScreen.add_child(gameover_menu)
	get_tree().paused = true
