extends Area2D

@onready var sound: AudioStreamPlayer = $sound

func _on_body_entered(_body:Node2D) -> void:
	Global.powerup = true
	sound.play()
	hide()


func _on_sound_finished():
	queue_free()
