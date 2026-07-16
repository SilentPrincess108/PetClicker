extends TextureButton
class_name PetButton

var petName: String = "Bob"
var animal: String = ""
var hunger: int = 0
var boredom: int = 0
var love: int = 0

#hover
var hover_scale: Vector2 = Vector2(1.2, 1.2)
var hover_animation_length: float = 0.1
var un_hover_animation_length: float = 0.1

#press
var press_scale: Vector2 = Vector2(0.95, 0.95)
var press_animation_length_1: float = 0.1
var press_animation_length_2: float = 0.1

var animation_tween: Tween

func _ready() -> void:
	pressed.connect(_button_press)
	mouse_entered.connect(_button_hover)
	mouse_exited.connect(_button_un_hover)
	
	pivot_offset_ratio = Vector2.ONE / 2.0

func _button_press() -> void:
	if animation_tween:
		animation_tween.kill()
	animation_tween = create_tween().set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN)
	animation_tween.tween_property(self, "scale", press_scale, press_animation_length_1)
	animation_tween.chain().tween_property(self, "scale", hover_scale, press_animation_length_2)

func _button_hover() -> void:
	if animation_tween:
		animation_tween.kill()
	animation_tween = create_tween().set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN)
	animation_tween.tween_property(self, "scale", hover_scale, hover_animation_length)

func _button_un_hover() -> void:
	if animation_tween:
		animation_tween.kill()
	animation_tween = create_tween().set_trans(Tween.TRANS_SINE)
	animation_tween.tween_property(self, "scale", Vector2.ONE, un_hover_animation_length)
	
#TB implemented
func _set_texture() -> void:
	pass
