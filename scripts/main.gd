extends Control

@onready var num_clicks: Label = $mainPanel/numClicks
@onready var pet: PetButton = $mainPanel/CenterContainer/PetButton

var arrow_cursor = load("res://assets/sprites/default.png")

func _ready() -> void:
	print("game start")
	Input.set_custom_mouse_cursor(arrow_cursor, Input.CURSOR_ARROW, Vector2(16, 16))
	
func _process(_delta: float) -> void:
	num_clicks.text = "Clicks: " + str(Globals.clicks)

func _on_pet_button_pressed() -> void:
	print("woof woof")
	Globals.clicks += Globals.numClick
