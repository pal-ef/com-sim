extends Area2D
@onready var effect: AudioStreamPlayer = $sound

func _on_body_entered(_body:Node2D):
	$CollisionShape2D.queue_free()
	Global.collected_items += 1
	hide()
	effect.play()
	


func _on_audio_stream_player_finished():
	queue_free()
