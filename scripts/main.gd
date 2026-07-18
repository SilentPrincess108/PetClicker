extends Control

@onready var num_clicks: Label = $mainPanel/numClicks
@onready var pet: PetButton = $mainPanel/CenterContainer/PetButton
@onready var main_panel: TextureRect = $mainPanel
@onready var bg_music: AudioStreamPlayer2D = $bg_music
@onready var pop: AudioStreamPlayer2D = $pop

@onready var upload: TextureButton = $mainPanel/upload
@onready var file_dialog: FileDialog = $FileDialog

var default_bg = load("res://assets/sprites/star-gray.png")

func _ready() -> void:
	print("game start")
	main_panel.texture = default_bg
	Globals.connect("backgroundChanged", changeBg)
	bg_music.stream.loop = true
	
	get_tree().get_root().files_dropped.connect(_on_files_dropped)
	
func _process(_delta: float) -> void:
	num_clicks.text = "Clicks: " + str(Globals.clicks)

func _on_pet_button_pressed() -> void:
	print("woof woof")
	pop.play()
	Globals.clicks += Globals.numClick

func changeBg(bg):
	main_panel.texture = bg

#func _on_upload_pressed() -> void:
	#file_dialog.popup()

func _on_file_dialog_file_selected(path: String) -> void:
	var pet_image = load(path)
	pet.texture_normal = pet_image
	
func _on_files_dropped(files):
	var path = files[0]
	var pet_image = load(path)
	pet.texture_normal = pet_image
