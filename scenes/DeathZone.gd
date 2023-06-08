extends Area2D


func _on_DeathZone_area_entered(area):
	if area.get_parent().name == "Player":
		area.get_parent().emit_signal("died")
