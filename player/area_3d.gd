extends Area3D

signal entered_area_3D(CharacterBody3D)


var cost_of_building = 10
var number_of_bricks_needed = 10


func _ready():
	self.body_entered.connect(_on_Area3D_body_entered)
	
func _on_Area3D_body_entered(body: Node3D):
	if body is not CharacterBody3D:
		return
	if not Bricksmanager.total_bricks:
		return
	if Bricksmanager.total_bricks >= number_of_bricks_needed:
		# remove transparency
		self.get_parent().set_surface_override_material(0, null)
		# enable collider
		self.get_parent().get_node("StaticBody3D/CollisionShape3D").call_deferred("set_disabled", false)
		# subtract bricks
		Bricksmanager.subtract_coins(cost_of_building)
	
	entered_area_3D.emit(CharacterBody3D)
