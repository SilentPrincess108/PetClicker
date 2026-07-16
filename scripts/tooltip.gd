extends PanelContainer

const OFFSET: Vector2 = Vector2.LEFT * 250.0
@onready var label: RichTextLabel = $RichTextLabel

var animation_tween: Tween

func _ready() -> void:
	hide()

func _input(event: InputEvent) -> void:
	if visible and event is InputEventMouseMotion:
		global_position = get_global_mouse_position() + OFFSET

func toggle(on: bool):
	if on:
		show()
		modulate.a = 0.0
		if animation_tween:
			animation_tween.kill()
		animation_tween = create_tween().set_trans(Tween.TRANS_SINE)
		animation_tween.tween_property(self, "modulate:a", 1.0, 0.3)
	else:
		modulate.a = 1.0
		if animation_tween:
			animation_tween.kill()
		animation_tween = create_tween().set_trans(Tween.TRANS_SINE)
		await animation_tween.tween_property(self, "modulate:a", 0.0, 0.1).finished
		hide()
	
func setLabel(name: String, desc: String, cost: int):
	label.text = name
	label.append_text("\n\n" + desc)
	label.append_text("\n\nCost: " + str(cost) + " clicks")
