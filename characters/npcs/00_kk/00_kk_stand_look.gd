extends KinematicBody


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var velocity = Vector3()
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
var rot_speed = 0.5

var player
var harass:bool = false



# Called when the node enters the scene tree for the first time.
func _ready():
	player = get_node("../player")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _physics_process(delta):
	if not is_on_floor():
		velocity.y -= gravity * delta
	else:
		velocity.y = 0
	velocity = move_and_slide(velocity, Vector3.UP)
	if harass == true:
		face_player()
	
func _on_Area_body_entered(body):
	if body.name == "player":
		print("body entered")
		harass = true
		
func face_player():		
   var global_pos = self.global_transform.origin
   var target_pos = player.global_transform.origin
   var wtransform = self.global_transform.looking_at(Vector3(target_pos.x, global_pos.y, target_pos.z), Vector3.UP)
   var wrotation = Quat(global_transform.basis).slerp(Quat(wtransform.basis), rot_speed)
   self.global_transform = Transform(Basis(wrotation), global_pos)
