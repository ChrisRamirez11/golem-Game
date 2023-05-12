extends KinematicBody2D

var speed = 150
var velocity = Vector2.ZERO
var gravity = 1600
onready var player: KinematicBody2D = $"../Player"
onready var animated_sprite: AnimatedSprite = $AnimatedSprite


func _ready() -> void:
	velocity.x = -speed


func _physics_process(delta: float) -> void:
	velocity.y += gravity * delta
	
	
	if is_on_wall():
		if $AnimatedSprite.flip_h == true:
			$AnimatedSprite.flip_h = false
		else: $AnimatedSprite.flip_h = true
		
		velocity.x *= -1.0
	
	velocity.y = move_and_slide(velocity, Vector2.UP).y



func _on_EnemyArea_area_entered(area: Area2D) -> void:
	pass # Replace with function body.


func _on_Area2D_area_entered(area: Area2D) -> void:
	if area.get_parent().name == "Player":
		player.velocity.y = -600
		animated_sprite.play("dead")


func _on_AnimatedSprite_animation_finished() -> void:
	if animated_sprite.get_animation() == "dead":
		queue_free()
