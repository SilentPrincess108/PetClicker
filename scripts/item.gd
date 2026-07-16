extends AnimatedButton

@export var itemName: String = ""
@export var itemType: String = ""
@export var itemCost: int = 10
var purchased: bool = false
var inUse: bool = false

func _pressed() -> void:
	super._button_press()
	if purchased && !inUse:
		Globals.changeMouse(self)
		print("Now using: " + itemName)

	elif !purchased:
		if Globals.checkClicks(self):
			purchased = true
	
