@tool

class_name Legs extends Node3D
## Moves a Character Body using keyboard input

@export var JUMP_VELOCITY = 4.5
@export var SPEED = 5

var body: CharacterBody3D
var neck: Neck

func get_neck():
	for child in get_body().get_children():
		if child is Neck:
			return child
	return null

func get_body() -> CharacterBody3D:
	return get_parent();

func _ready():
	body = get_body();
	neck = get_neck();


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if !neck: return
	if !body: return
	# Handle Jump.
	if Input.is_action_just_pressed("ui_accept") and body.is_on_floor():
		body.velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	if !Engine.is_editor_hint():
		var input_dir := Input.get_vector("left", "right", "forward", "back")
		var direction = (neck.transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
		if direction:
			body.velocity.x = direction.x * SPEED
			body.velocity.z = direction.z * SPEED
		else:
			body.velocity.x = move_toward(body.velocity.x, 0, SPEED)
			body.velocity.z = move_toward(body.velocity.z, 0, SPEED)

		body.move_and_slide()
	pass
