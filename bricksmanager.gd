extends Node
class_name bricksmanager

var max_bricks: int = 100

# Use 'int' for currency to avoid floating-point errors. Store value in the smallest unit (e.g., cents).
var starting_bricks: int = 100

# Signal emitted when the currency amount changes, for UI updates
signal bricks_changed(amount: int)

func add_coins(amount: int) -> void:
	if amount > 0:
		starting_bricks += amount
		emit_signal("bricks_changed", starting_bricks)

func subtract_coins(amount: int) -> bool:
	if amount > 0 and starting_bricks >= amount:
		starting_bricks -= amount
		emit_signal("bricks_changed", starting_bricks)
		return true # Transaction successful
	else:
		print("Not enough bricks!")
		return false # Transaction failed
