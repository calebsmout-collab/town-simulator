extends Label

func _on_missing_bricks():
	var timer := Timer.new()
	add_child(timer)
	timer.wait_time = 3.0
	timer.one_shot = true
	
	# show label
	self.show()
	timer.timeout.connect(
		func():
			self.hide()
			timer.queue_free()
	)
	timer.start()
	

func _ready():
	# Connect the signal via code if not done in the editor
	Bricksmanager.missing_bricks.connect(_on_missing_bricks)
	self.hide()
