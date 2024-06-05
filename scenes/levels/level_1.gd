extends ParallaxBackground

var scrolling_speed = 100

func _ready():
	var node1 = get_node("ParallaxLayer/Level1")
	var node2 = get_node("ParallaxLayer")
	print("Node1: ", node1, "\nNode2: ", node2)
	
	
func _process(delta):
		# scrolling_speed is a property that belongs to ParallaxBackground
		# Calculated automatically when using a Camera2D
		# But can be used to manually manage scrolling when no camera is present
		# For ParallaxLayer, there's the motion_offset property
		# The ParallaxLayer's offset relative to the parent (ParallaxBackground.scroll_offset)
		scroll_offset.x -= scrolling_speed * delta
		
