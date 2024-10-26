extends KinematicBody

var load_pause_ui = "res://UI/ui_pause/ui_pause.tscn"

onready var camera = $player_camera

const SPEED = 5.0
const JUMP_VELOCITY = 4.5
const MOUSE_SENS = 0.25

var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
var velocity = Vector3()  # Velocity vector for movement

# Called when the node enters the scene tree for the first time.
func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	var pause_ui = load(load_pause_ui).instance()
	add_child(pause_ui)

# Handle mouse movement for camera control
func _input(event):
	if event is InputEventMouseMotion:
		rotation_degrees.y -= event.relative.x * MOUSE_SENS
		camera.rotation_degrees.x -= event.relative.y * MOUSE_SENS
		camera.rotation_degrees.x = clamp(camera.rotation_degrees.x, -90, 90)

func _physics_process(delta):
	# Apply gravity if not on the floor
	if not is_on_floor():
		velocity.y -= gravity * delta
	else:
		velocity.y = 0  # Reset vertical velocity when on the floor

	# Get the input direction and handle the movement/deceleration
	var input_dir = Input.get_vector("a", "d", "w", "s")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	
	# Apply movement or deceleration
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	# Handle jumping
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Move the player using velocity and collisions
	velocity = move_and_slide(velocity, Vector3.UP)
