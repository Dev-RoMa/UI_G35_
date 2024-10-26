extends Control

onready var res_less = $button_res_less
onready var res_mor = $button_res_mor
onready var text_res = $text_res
onready var fullscreen = $check_fs

var resolutions = [
	Vector2(1920, 1080),
	Vector2(1280, 720),
	Vector2(1024, 768)
]

var current_resolution_index = 0  # Start with the first resolution in the list

func _ready():
	print("loaded settings")
	# Initialize the resolution text and connect button signals
	update_resolution_text()
	res_less.connect("pressed", self, "_on_res_less_pressed")
	res_mor.connect("pressed", self, "_on_res_mor_pressed")

func update_resolution_text():
	# Update the label with the current resolution
	var current_res = resolutions[current_resolution_index]
	text_res.text = str(current_res.x) + " x " + str(current_res.y)

	# Apply the selected resolution
	OS.window_size = current_res

func _on_button_res_less_pressed():
	# Decrease resolution if possible
	if current_resolution_index > 0:
		current_resolution_index -= 1
		update_resolution_text()


func _on_button_res_mor_pressed():
	# Increase resolution if possible
	if current_resolution_index < resolutions.size() - 1:
		current_resolution_index += 1
		update_resolution_text()



func _on_check_fs_toggled(button_pressed):
	# Toggle fullscreen mode based on the checkbox state
	if button_pressed:
		OS.window_fullscreen = true
	else:
		OS.window_fullscreen = false


func _on_button_back_to_main_pressed():
	print("going back to main menu")
	get_tree().change_scene("res://UI/main_menu/main_menu.tscn")
