extends Control

signal nuller


func _on_Continue_pressed():
	get_tree().paused = false
	emit_signal("nuller")
	self.queue_free()


func _on_Quit_pressed():
	get_tree().quit()
