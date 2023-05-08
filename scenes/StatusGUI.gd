extends CanvasLayer

onready var sprite = $Area2D/Sprite
onready var timer: Timer = $Area2D/Timer
onready var label: Label = $Label
var count = 0

func _on_Player_rune_collected():
	sprite.texture = load("res://assets/gui/status_health.png")
	timer.start(2)


func _on_Timer_timeout() -> void:
	sprite.texture = load("res://assets/gui/status_empty.png")


func _on_Player_coin_collected() -> void:
	count+=1
	label.set_text(String (count))
