extends Node2D

func _ready():
    MusicController.play()

func _on_area_2d_body_entered(body:Node2D):
    if body == $Player: get_tree().change_scene_to_file("res://level_2.tscn")

