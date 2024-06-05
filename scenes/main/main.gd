extends Node2D
#----------
# Declaring a var in the start of the script to make it accessible to functions
# Must use @onready for the system to gather this information at runtime
@onready var scene = get_tree()
#----------
# SIGNALS
func _on_quit_button_pressed():
	# This will store this object's entire scene tree object in a variable
	# The tree is above the root in the hierarchy
	# SceneTree is the class from which this object belongs
	# The number after '#' is the object ID
	scene.quit()
#----------
func _on_play_button_pressed():
	scene.change_scene_to_file("res://scenes/world/world.tscn")
#----------
