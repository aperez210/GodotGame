extends CharacterBody3D


const SPEED = 5.0
const JUMP_VELOCITY = 4.5
var parent

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

	
func _physics_process(delta):
	
	move_and_slide()
