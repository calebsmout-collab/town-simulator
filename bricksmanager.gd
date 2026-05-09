extends Node
class_name bricksmanager

var build_destroyed_coin_amount: int = 25
var current_destroyed_coin_amount_multiplier: float = 1.0

var max_currency: int = 1_000_000
var max_bricks: int = 100

# Use 'int' for currency to avoid floating-point errors. Store value in the smallest unit (e.g., cents).
var total_bricks: int = 50
var total_currency: int = 0

# Signal emitted when the currency amount changes, for UI updates
signal bricks_changed(amount: int)
signal missing_bricks()
signal currency_changed(amount: int)
signal missing_currency()

func show_missing_bricks_label():
	emit_signal("missing_bricks")
	
func show_missing_currency_label():
	emit_signal("missing_currency")

func add_bricks(amount: float):
	total_bricks = clamp(total_bricks + amount, 0, max_bricks)
	emit_signal("bricks_changed", total_bricks)
	
func add_currency(amount: float):
	total_currency = clamp(total_currency + amount, 0, max_currency)
	emit_signal("currency_changed", total_currency)

func subtract_coins(amount: int) -> bool:
	if amount > 0 and total_bricks >= amount:
		total_bricks -= amount
		emit_signal("bricks_changed", total_bricks)
		return true # Transaction successful
	else:
		print("Not enough bricks!")
		return false # Transaction failed
		
func subtract_currency(amount: int) -> bool:
	if amount > 0 and total_currency >= amount:
		total_currency -= amount
		emit_signal("currency_changed", total_currency)
		return true
	print("Not enough currency!")
	return false
