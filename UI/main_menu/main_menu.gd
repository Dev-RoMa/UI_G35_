extends Control

onready var button_start = $button_start
onready var button_settings = $button_settings
onready var button_quit = $button_quit

onready var button_ex_ye = $button_exit_yes
onready var button_ex_no = $button_exit_no

# Called when the node enters the scene tree for the first time.
func _ready():
	print("main menu loaded")
	button_ex_ye.visible = false
	button_ex_no.visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_button_start_pressed():
	print("starting game ...")
	get_tree().change_scene("res://game/00_game_test/00_game_test.tscn")

func _on_button_settings_pressed():
	print("loading game settings")
	get_tree().change_scene("res://UI/ui_settings/ui_settings.tscn")

func _on_button_quit_pressed():
	print("leaving game ...")
	button_ex_ye.visible = true
	button_ex_no.visible = true

func _on_button_exit_yes_pressed():
	get_tree().quit()


func _on_button_exit_no_pressed():
	print("back to main menu")
	button_ex_ye.visible = false
	button_ex_no.visible = false
