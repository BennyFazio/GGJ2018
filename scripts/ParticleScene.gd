extends Container

var color = Color(255, 255, 255, 255)

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass


func _on_Node2D_draw():
#	var lightningNode1 = self.get_child(0);
#	var lightningNode2 = self.get_child(1);
	
#	log(lightningNode1);

	var lightningVector1 = Vector2(0, 0)
	var lightningVector2 = Vector2(100, 0)
	
	draw_line(lightningVector1, lightningVector2, color, 1.0);
	pass # replace with function body
