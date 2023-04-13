@tool

class_name LookAtTarget extends Node3D

var body: CharacterBody3D
var target: CharacterBody3D

func get_body() -> CharacterBody3D:
	return get_parent();

# Called when the node enters the scene tree for the first time.
func _ready():
	body = get_body()


func _physics_process(delta: float) -> void:
	if is_instance_valid(body):
		if 'get_target' in body and body.get_target():
			var origin: Vector3 = body.get_target().global_transform.origin; 
			body.look_at(Vector3(origin.x, origin.y, origin.z))
