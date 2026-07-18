extends Control

@onready var play_button: AnimatedButton = $playButton
var arrow_cursor = load("res://assets/sprites/default.png")

func _ready() -> void:
	Input.set_custom_mouse_cursor(arrow_cursor, Input.CURSOR_ARROW, Vector2(16, 16))

func _on_play_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main.tscn")
