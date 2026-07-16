extends Node

var clicks: int = 0
var petTypes: Array = ["dog", "cat"]
var animal: String = ""
var itemTypes: Array = ["mouse", "background", "skin", "custom skin"]
var currentMouse: Button
var previousMouse: Button

func checkClicks(item):
	if item.itemCost > clicks:
		print("Srry bro. Need more clicks.")
		return false
	else:
		clicks -= item.itemCost
		print(item.itemName + " purchased successfully.")
		print()
		if item.itemType == "mouse":
			changeMouse(item)
		return true

func changeMouse(item):
	print()
	print("changing mouse")
	if previousMouse == null:
		previousMouse = item
	else:
		previousMouse = currentMouse
		previousMouse.inUse = false
	currentMouse = item
	currentMouse.inUse = true
	
	#testing
	print(previousMouse.itemName)
	print(currentMouse.itemName)
	print()
	
