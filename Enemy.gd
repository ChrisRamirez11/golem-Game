extends KinematicBody2D

const PLAYER_HBPOSITION_TO_FOOT_DISTANCE = 45

var speed = 150
var velocity = Vector2.ZERO
var gravity = 1600
var can_walk:bool= false

onready var player: KinematicBody2D = $"../Player"
onready var animated_sprite: AnimatedSprite = $AnimatedSprite
onready var area_2d: Area2D = $Area2D
onready var enemy_area: Area2D = $EnemyArea
#sound
onready var walking: AudioStreamPlayer2D = $Walking
onready var dead_sound: AudioStreamPlayer2D = $DeadSound

func _ready() -> void:
	velocity.x = -speed


func _process(delta: float) -> void:
	if velocity.x != 0:
		if !walking.is_playing():
			walk()


func _physics_process(delta: float) -> void:
	velocity.y += gravity * delta


	if is_on_wall():
		if $AnimatedSprite.flip_h == true:
			$AnimatedSprite.flip_h = false
		else: $AnimatedSprite.flip_h = true
		
		velocity.x *= -1.0
	
	velocity.y = move_and_slide(velocity, Vector2.UP).y


func _on_Area2D_area_entered(area: Area2D) -> void:
	if area.get_global_position().y + PLAYER_HBPOSITION_TO_FOOT_DISTANCE < area_2d.get_global_position().y:
		
			set_physics_process(false)
			player.velocity.y = -600
			dead_sound.play()
			animated_sprite.play("dead")


func _on_AnimatedSprite_animation_finished() -> void:
	if animated_sprite.get_animation() == "dead":
		queue_free()


func _on_Player_enemy_detected() -> void:
	$Timer.start(0.8)


func _on_Timer_timeout() -> void:
	enemy_area.set_collision_mask_bit(0, true)
	set_collision_mask_bit(0,true)


func walk():
	walking.play(0.90)


func _on_Walking_finished() -> void:
	walking.stop()
