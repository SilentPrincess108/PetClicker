extends Control

@onready var num_clicks: Label = $mainPanel/numClicks
@onready var pet: PetButton = $mainPanel/CenterContainer/PetButton
@onready var main_panel: TextureRect = $mainPanel


var arrow_cursor = load("res://assets/sprites/default.png")
var default_bg = load("res://assets/sprites/star-gray.png")

func _ready() -> void:
	print("game start")
	Input.set_custom_mouse_cursor(arrow_cursor, Input.CURSOR_ARROW, Vector2(16, 16))
	main_panel.texture = default_bg
	Globals.connect("backgroundChanged", changeBg)
	
func _process(_delta: float) -> void:
	num_clicks.text = "Clicks: " + str(Globals.clicks)

func _on_pet_button_pressed() -> void:
	print("woof woof")
	Globals.clicks += Globals.numClick

func changeBg(bg):
	main_panel.texture = bg
