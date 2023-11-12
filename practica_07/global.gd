extends Node

var collected_items: int = 0
var jump = 0
var powerup = false
var timer = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	print_debug("Global Ready")

func _process(delta):
	if powerup:
		jump = -500
		timer += delta
		if(fmod(timer, 60) > 10):
			powerup = false
			timer = 0
			jump = 0