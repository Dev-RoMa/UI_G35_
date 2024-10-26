extends Control

onready var button_continue = $button_continue
onready var button_settings = $button_settings
onready var button_leave = $button_leave_game

onready var button_exit_ye = $button_exit_yes
onready var button_exit_no = $button_exit_no

# Called when the node enters the scene tree for the first time.
func _ready():
	self.visible = false
	button_exit_ye.visible = false
	button_exit_no.visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("esc"):
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
		self.visible = true
		get_tree().paused = true
		


func _on_button_continue_pressed():
	self.visible = false
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	get_tree().paused = false


func _on_button_leave_game_pressed():
	button_exit_ye.visible = true
	button_exit_no.visible = true

func _on_button_exit_yes_pressed():
	get_tree().paused = false
	get_tree().change_scene("res://UI/main_menu/main_menu.tscn")

func _on_button_exit_no_pressed():
	get_tree().paused = false
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	self.visible = false
	button_exit_ye.visible = false
	button_exit_no.visible = false
