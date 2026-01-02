extends Area3D

func _ready():
	self.body_entered.connect(_on_Area3D_body_entered)

func _on_Area3D_body_entered(body: Node3D):
	var brick_count = body.get("bricks")
	if not brick_count:
		return
	if brick_count >= 10:
		print("Player can build something here")
	if brick_count < 10:
		print("Player does not have enough bricks")
