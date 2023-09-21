extends Node2D
#----------
var scene
#----------
# SIGNALS
func _on_quit_button_pressed():
	# This will store this object's entire scene tree object in a variable
	# The tree is above the root in the hierarchy
	scene = get_tree()
	# SceneTree is the class from which this object belongs
	# The number after '#' is the object ID
	scene.quit()
#----------
func _on_play_button_pressed():
	scene = get_tree()
	scene.change_scene_to_file("res://world.tscn")
#----------
