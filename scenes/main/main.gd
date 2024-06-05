extends Node2D

@export var next_scene = PackedScene
@onready var scene = get_tree()

func _ready():
	print(scene) # The number after '#' is the object ID
	
func _on_quit_button_pressed():
	scene.quit()

func _on_play_button_pressed():
	scene.change_scene_to_packed(next_scene)
	
