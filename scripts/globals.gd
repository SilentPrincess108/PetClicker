extends Node

var clicks: int = 0
var petTypes: Array = ["dog", "cat"]
var animal: String = ""

func checkClicks(itemCost):
	if itemCost > clicks:
		print("Srry bro. Need more clicks.")
	else:
		print("Purchase successful.")
		clicks -= itemCost
