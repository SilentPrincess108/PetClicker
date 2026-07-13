extends Node2D
@onready var clicky: TextureButton = $clicky
@onready var num_clicks: Label = $numClicks

func _ready() -> void:
	clicky.position.x = 576
	clicky.position.y = 324
	
func _process(_delta: float) -> void:
	num_clicks.text = "Clicks: " + str(Globals.clicks)

func _on_clicky_mouse_entered() -> void:
	print("mouse entered")

func _on_clicky_mouse_exited() -> void:
	print("mouse exited")

func _on_clicky_pressed() -> void:
	Globals.clicks += 1
	print(Globals.clicks)
