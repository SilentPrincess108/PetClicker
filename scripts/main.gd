extends Control

@onready var num_clicks: Label = $mainPanel/numClicks
@onready var clicky: AnimatedButton = $mainPanel/CenterContainer/clicky

@onready var item: AnimatedButton = $shopPanel/VBoxContainer/ScrollContainer/MarginContainer/VBoxContainer/item

func _ready() -> void:
	print("game start")
	
func _process(_delta: float) -> void:
	num_clicks.text = "Clicks: " + str(Globals.clicks)


func _on_item_pressed() -> void:
	Globals.checkClicks(item.itemCost)

func _on_clicky_pressed() -> void:
	Globals.clicks += 1

func _on_clicky_mouse_entered() -> void:
	print("mouse entered temp pet")

func _on_clicky_mouse_exited() -> void:
	print("mouse exited temp pet")
