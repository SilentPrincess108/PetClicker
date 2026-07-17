extends AnimatedButton

@export var itemName: String = ""
@export var itemDesc: String = ""
@export var itemType: String = ""
@export var itemCost: String = ""
@export var bg_file: String = ""

@onready var tooltip: PanelContainer = $tooltip

var purchased: bool = false
var inUse: bool = false

func _ready() -> void:
	super._ready()
	tooltip.setLabel(itemName, itemDesc, itemCost)

func _pressed() -> void:
	super._button_press()
	if purchased && !inUse:
		Globals.changeBackground(self)
		print("Now using: " + itemName)
	elif !purchased:
		if Globals.checkClicks(self):
			purchased = true

func _button_hover() -> void:
	super._button_hover()
	tooltip.toggle(true)

func _button_un_hover() -> void:
	super._button_un_hover()
	tooltip.toggle(false)
