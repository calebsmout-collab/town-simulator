extends Area3D

signal entered_area_3D(CharacterBody3D)


var bricks_added = 10



func _ready():
	self.body_entered.connect(_on_Area3D_body_entered)
	
func _on_Area3D_body_entered(body: Node3D):
	if body is not CharacterBody3D:
		
		
		Bricksmanager.add_bricks(bricks_added)
	
	entered_area_3D.emit(CharacterBody3D)
