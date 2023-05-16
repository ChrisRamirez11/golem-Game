extends Camera2D

onready var timer: Timer = $Timer

func _ready() -> void:
	set_process(false)


func _process(delta: float) -> void:
	offset = Vector2(rand_range(5,-5), rand_range(5,-5))


func shake():
	set_process(true)
	timer.start(0.6)

func _on_Timer_timeout() -> void:
	set_process(false)
