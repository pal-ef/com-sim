extends Node2D

var music = load("res://audio/title.mp3")

@onready var player: AudioStreamPlayer = $music

# Called every frame. 'delta' is the elapsed time since the previous frame.
func play():
	player.stream = music
	player.play()


func _on_music_finished():
	player.play()
