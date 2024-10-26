extends Spatial

onready var Timer = $Timer

# Define the player and level paths, npcs and whatnot
var loc_player = "res://characters/player/player.tscn"
var loc_level = "res://level/00_test/00_test.tscn"
var loc_npc = "res://characters/npcs/00_kk/00_kk_stand_look.tscn"

# Timer for countdown (assigned in the scene)
onready var countdown_timer = $CountdownTimer

# Called when the node enters the scene tree for the first time
func _ready():
	# Load player and level
	Timer.start()
	load_level_and_player()
	get_tree().paused = true

# Function to load the player and level
func load_level_and_player():
	# Load the level scene
	var level_scene = load(loc_level).instance()
	add_child(level_scene)
	# Load the player scene and set initial position
	var player_scene = load(loc_player).instance()
	add_child(player_scene)
	# Load the npc
	var npc_scene = load(loc_npc).instance()
	add_child(npc_scene)
	
	# Optionally, set player initial position here
	player_scene.translation = Vector3(0, 1, 0) # Adjust as needed
	npc_scene.translation = Vector3(0, 2, -10) #X;Y;Z

func _on_Timer_timeout():
	pass # Replace with function body.
	get_tree().paused = false
