extends Area3D

signal entered_area_3D(CharacterBody3D)

var cost_of_building = 10



func _ready():
	self.body_entered.connect(_on_Area3D_body_entered)
	
func _on_Area3D_body_entered(body: Node3D):
	if body is CharacterBody3D:
		
		
		Bricksmanager.add_coins(cost_of_building)
	
	entered_area_3D.emit(CharacterBody3D)
