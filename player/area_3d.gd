extends Area3D



var cost_of_building = 50


func _ready():
	self.body_entered.connect(_on_Area3D_body_entered)


func _on_Area3D_body_entered(body: Node3D):
	if body is not CharacterBody3D:
		print("body is not player")
		return
		
	if Bricksmanager.total_bricks < cost_of_building:
		Bricksmanager.show_missing_bricks_label()

	if not self.get_parent().get_node("StaticBody3D/CollisionShape3D").disabled:
		print("collider is enabled")
		return
	
	if Bricksmanager.total_bricks >= cost_of_building:
		print("subtracting bricks...")
		# get current material
		var material = self.get_parent().get_surface_override_material(0)
		# remove transparency
		self.get_parent().set_surface_override_material(0, null)
		# enable collider
		self.get_parent().get_node("StaticBody3D/CollisionShape3D").call_deferred("set_disabled", false)
		# subtract bricks
		Bricksmanager.subtract_coins(cost_of_building)
		# add timer
		var timer := Timer.new()
		add_child(timer)
		timer.wait_time = 4.0 # 15 seconds
		timer.one_shot = true
		
		# run the timer
		timer.timeout.connect(
			func():
			  # add the material back
			self.get_parent().set_surface_override_material(0, material) # using material variable from above
			  # disable the collider
			self.get_parent().get_node("StaticBody3D/CollisionShape3D").call_deferred("set_disabled", true)
			)
		timer.start()
