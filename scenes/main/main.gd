extends Node2D


@onready var scene = get_tree()

func _ready():
	print(scene) # The number after '#' is the object ID
	
func _on_quit_button_pressed():
	scene.quit()

func _on_play_button_pressed():
	scene.change_scene_to_file("res://scenes/world/world.tscn")
