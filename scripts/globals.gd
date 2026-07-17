extends Node

var clicks: int = 0
var numClick: int = 1
var petTypes: Array = ["dog", "cat"]
var animal: String = ""
var itemTypes: Array = ["mouse", "background", "skin", "custom skin"]

var currentMouse: Button
var previousMouse: Button

var currentBg: Button
var previousBg: Button
signal backgroundChanged(bg)

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
		if item.itemType == "background":
			changeBackground(item)
		return true

func changeMouse(item):
	print()
	print("changing mouse")
	if previousMouse == null:
		previousMouse = item
	else:
		previousMouse = currentMouse
		previousMouse.inUse = false
	numClick = item.clickNum
	currentMouse = item
	currentMouse.inUse = true
	var cursor = load(item.cursor)
	Input.set_custom_mouse_cursor(cursor, Input.CURSOR_ARROW, Vector2(16, 16))
	
	#testing
	print(previousMouse.itemName)
	print(currentMouse.itemName)
	print()
	
func changeBackground(item):
	print()
	print("Changing background")
	if previousBg == null:
		previousBg = item
	else:
		previousBg = currentBg
		previousBg.inUse = false
	currentBg = item
	currentBg.inUse = true
	var bg = load(item.bg_file)
	backgroundChanged.emit(bg)
	
	
