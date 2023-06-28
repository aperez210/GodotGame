extends CharacterBody3D

var jumpSpeed = 4.5
var speed = 5.0
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
var sens = 0.2
var xMomentum = 0
var zMomentum = 0
var other = 1
var cam
var scadrial

func _ready():
	cam = get_child(0)
	scadrial = get_child(1)

func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		rotate_y(deg_to_rad(-event.relative.x * sens))
		cam.rotate_x(deg_to_rad(-event.relative.y * sens))
		cam.rotation.x = clamp(cam.rotation.x, deg_to_rad(-90), deg_to_rad(90))
		cam.rotation.z = 0

func _physics_process(delta):
	other += 1
	other %= 2
	
	var direction = Vector3.ZERO
	var camera_transform = cam.global_transform
	var camera_basis = camera_transform.basis
		
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	
	if Input.is_action_pressed("lock"):
		get_tree().quit()
	
	if Input.is_action_pressed("forward"):
		direction -= camera_basis.z
	if Input.is_action_pressed("back"):
		direction += camera_basis.z
	if Input.is_action_pressed("left"):
		direction -= camera_basis.x
	if Input.is_action_pressed("right"):
		direction += camera_basis.x
	direction = direction.normalized()
	
	if Input.is_action_pressed("Run") and is_on_floor():
		speed = 10
	else:
		speed = 5
	
	velocity.x = direction.x * speed
	velocity.z = direction.z * speed
	
	# Handle Jump.
	if Input.is_action_pressed("jump") and is_on_floor():
		velocity.y = jumpSpeed
		xMomentum = velocity.x
		zMomentum = velocity.z
	
	if not is_on_floor():
		velocity.y -= gravity * delta
		velocity.x = xMomentum
		velocity.z = zMomentum
	move_and_slide()
