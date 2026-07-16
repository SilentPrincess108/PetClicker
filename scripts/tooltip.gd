extends PanelContainer

const OFFSET: Vector2 = Vector2.LEFT * 250.0
@onready var label: RichTextLabel = $RichTextLabel

func _ready() -> void:
	hide()

func _input(event: InputEvent) -> void:
	if visible and event is InputEventMouseMotion:
		global_position = get_global_mouse_position() + OFFSET

func toggle(on: bool):
	if on:
		show()
	else:
		hide()
	
func setLabel(name: String, desc: String, cost: int):
	label.text = name
	label.append_text("\n\n" + desc)
	label.append_text("\n\nCost: " + str(cost) + " clicks")
