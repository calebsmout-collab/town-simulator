extends Label

func _on_currency_manager_currency_changed(amount: int):
	# Update the label text when the currency changes
	self.text = "Bricks: " + str(amount)


func _ready():
	# Connect the signal via code if not done in the editor
	Bricksmanager.bricks_changed.connect(_on_currency_manager_currency_changed)
	# Initialize the label text with the current amount
	_on_currency_manager_currency_changed(Bricksmanager.total_bricks)
