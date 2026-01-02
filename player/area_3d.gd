extends Area3D

signal entered_area_3D(CharacterBody3D)



func _ready():
	self.body_entered.connect(_on_Area3D_body_entered)
	
func _on_Area3D_body_entered(body: Node3D):
	var brick_count = body.get("bricks")
	if not brick_count:
		return
	if brick_count >= 10:
		# remove transparency
		self.get_parent().set_surface_override_material(0, null)
		# enable collider
		self.get_parent().get_node("StaticBody3D/CollisionShape3D").call_deferred("set_disabled", false)
	
	entered_area_3D.emit(CharacterBody3D)
	
	
var cost_of_building = 10
var number_of_bricks_needed = 10
	
	
	
func _on_area3D_body_entered(body: Node3D):
	var brick_count = body.get("bricks")

		
	if %CharacterBody3D.bricks >= number_of_bricks_needed:
	
		%CharacterBody3D.bricks = %CharacterBody3D.bricks - cost_of_building
		
	if brick_count >= 10:
		
		self.get_parent().set_surface_override_material(0, null)
		self.get_parent().get_node("StaticBody3D/CollisionShape3D").call_deferred("set_disabled", false)
