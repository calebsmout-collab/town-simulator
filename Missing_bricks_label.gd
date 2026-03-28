extends Label

func _on_missing_bricks():
	# show label
	self.show()


func _ready():
	# Connect the signal via code if not done in the editor
	Bricksmanager.missing_bricks.connect(_on_missing_bricks)
	self.hide()
