extends Camera2D

onready var timer: Timer = $Timer
onready var tween: Tween = $Tween

var default_offset = offset

func _ready() -> void:
	set_process(false)
	randomize()


func _process(delta: float) -> void:
	offset = Vector2(rand_range(2,-2), rand_range(2,-2))
	tween.interpolate_property(self, "offset", offset, default_offset, 0.1, 6, 2)
	tween.start()


func shake():
	set_process(true)
	timer.start(0.5)

func _on_Timer_timeout() -> void:
	set_process(false)

