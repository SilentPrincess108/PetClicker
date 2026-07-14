extends Control

@onready var num_clicks: Label = $mainPanel/numClicks
@onready var pet: PetButton = $mainPanel/CenterContainer/PetButton


@onready var item: AnimatedButton = $shopPanel/VBoxContainer/ScrollContainer/MarginContainer/VBoxContainer/item

func _ready() -> void:
	print("game start")
	
func _process(_delta: float) -> void:
	num_clicks.text = "Clicks: " + str(Globals.clicks)

func _on_pet_button_pressed() -> void:
	print("woof woof")
	Globals.clicks += 1

func _on_item_pressed() -> void:
	Globals.checkClicks(item.itemCost)
