extends CharacterBody3D


@export var target: CharacterBody3D

func get_target() -> CharacterBody3D:
	return target if target else null
