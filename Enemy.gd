extends KinematicBody2D

var speed = 150
var velocity = Vector2.ZERO
var gravity = 1600


func _ready() -> void:
	velocity.x = -speed


func _physics_process(delta: float) -> void:
	velocity.y += gravity * delta
	
	
	if is_on_wall():
		velocity.x *= -1.0
	velocity.y = move_and_slide(velocity, Vector2.UP).y


