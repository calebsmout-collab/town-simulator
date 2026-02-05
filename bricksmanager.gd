extends Node
class_name bricksmanager

var max_bricks: int = 100

# Use 'int' for currency to avoid floating-point errors. Store value in the smallest unit (e.g., cents).
var total_bricks: int = 50

# Signal emitted when the currency amount changes, for UI updates
signal bricks_changed(amount: int)

func add_bricks(amount: float):
	total_bricks = clamp(total_bricks + amount, 0, max_bricks)


func add_coins(amount: int) -> void:
	if amount > 0:
		total_bricks += amount
		emit_signal("bricks_changed", total_bricks)

func subtract_coins(amount: int) -> bool:
	if amount > 0 and total_bricks >= amount:
		total_bricks -= amount
		emit_signal("bricks_changed", total_bricks)
		return true # Transaction successful
	else:
		print("Not enough bricks!")
		return false # Transaction failed
