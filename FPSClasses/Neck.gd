@tool

class_name Neck extends Node3D

var camera: Camera3D = null;

func get_camera() -> Camera3D:
	if camera != null:
		return camera
	for child in get_children():
		if child is Camera3D:
			return child
	return null

func _get_configuration_warnings() -> PackedStringArray:
	var warnings: PackedStringArray = []
	if !get_camera():
		warnings.append("This node should contain a Camera3D")
	return warnings

func _ready():
	camera = get_camera();
	
func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	elif event.is_action_pressed("ui_cancel"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	if Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		if event is InputEventMouseMotion:
			rotate_y(-event.relative.x * 0.01)
			camera.rotate_x(-event.relative.y * 0.01)
			camera.rotation.x = clamp(camera.rotation.x, deg_to_rad(-30), deg_to_rad(60))
