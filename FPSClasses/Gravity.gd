@tool

class_name Gravity extends Node3D

@export var gravity: float = ProjectSettings.get_setting("physics/3d/default_gravity")

var thing: float:
	get:
		return thing if thing else 23
	set(value):
		thing = value * 2

func _physics_process(delta: float) -> void:
	var body: CharacterBody3D = get_parent();
	if not body.is_on_floor():
		body.velocity.y -= gravity * delta
