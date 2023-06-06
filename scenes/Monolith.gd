extends Area2D

onready var opening: AudioStreamPlayer2D = $Opening


func _on_Player_monolith_activation():
	opening.play()
	$AnimatedSprite.play("getting_power")
