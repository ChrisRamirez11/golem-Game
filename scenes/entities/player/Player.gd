extends KinematicBody2D

signal rune_collected
signal coin_collected
signal enemy_detected
signal monolith_activation

export (int) var gravity = 1600
export (int) var jump_force = -600

var velocity = Vector2.ZERO
const SPEED = 250
var is_jumping = false
var health =  100
var max_health = 100
var count = 0

onready var status_gui = $"../GUI/StatusGUI"


func _physics_process(delta):

	get_input()
	process_animations()
	velocity.y += gravity * delta
	if is_jumping and is_on_floor():
		is_jumping = true
	else: is_jumping = false

	velocity = move_and_slide(velocity, Vector2.UP)
	
	get_coin()
	is_on_water()


func get_input():
	velocity.x = 0
	if Input.is_action_pressed("ui_left"):
		velocity.x -= SPEED
		$AnimatedSprite.flip_h = true
	if Input.is_action_pressed("ui_right"):
		velocity.x += SPEED
		$AnimatedSprite.flip_h = false
	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		is_jumping = true
		velocity.y = jump_force


func process_animations():
	if velocity.length() != 0:
		if !is_on_floor():
			$AnimatedSprite.play("jump")
		else:
			$AnimatedSprite.play("walk")
	else:
		$AnimatedSprite.play("idle")


func is_on_water():
	var areas = $HurtBox.get_overlapping_areas()
	for area in areas:
		if area.is_in_group("Damagers"):
			damage_ctrl(area.damage)


func get_coin():
	var areas = $HurtBox.get_overlapping_areas()
	for area in areas:
		if area.is_in_group("Collectibles"):
			count +=1
			area.delete()
			emit_signal("coin_collected")


func damage_ctrl(damage):
	if health > 0:
		health -= damage
	else:
		get_tree().reload_current_scene()


func _on_HurtBox_area_entered(area):
	if area.name == "Rune_Health":
		emit_signal("rune_collected")
		health += 30
		area.delete()
		if health > max_health:
			health = 100
	if area.is_in_group("Enemies"):
		emit_signal("enemy_detected")
	if area.name == "Monolith":
		if count == int (status_gui.get_node("Label2").get_text()):
			emit_signal("monolith_activation")
		



func _on_Player_enemy_detected() -> void:
	damage_ctrl(10.0)


