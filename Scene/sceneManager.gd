extends Node3D

signal mysignal
var selected_piece: Array[Node3D] = []
var choosed_piece: Area3D
@export var choose_region: Control
@export var return_region: Control
@export var choosing_menu: Control
@export var camera_wall_1: PhantomCamera3D
@export var camera_wall_2: PhantomCamera3D
@export var camera_wall_3: PhantomCamera3D
@export var bt_yes: Button
var current_camera: PhantomCamera3D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _process(delta) -> void:
	print(choosed_piece)
	print("coubeh")
	pass
func _on_static_body_3d_input_event(camera: Node, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int) -> void:
	if event is InputEventMouseButton:
		print(shape_idx)
		pass
	pass # Replace with function body.

func _on_first_zone_button_pressed() -> void:
	camera_wall_3.set_priority(20)
	choose_region.visible = false
	return_region.visible = true
	current_camera = camera_wall_3
	pass # Replace with function body.

func _on_second_zone_button_pressed() -> void:
	camera_wall_2.set_priority(20)
	choose_region.visible = false
	return_region.visible = true
	current_camera = camera_wall_2
	pass # Replace with function body.

func _on_third_zone_button_pressed() -> void:
	camera_wall_1.set_priority(20)
	choose_region.visible = false
	return_region.visible = true
	current_camera = camera_wall_1
	
	pass # Replace with function body.


func _on_return_button_pressed() -> void:
	current_camera.set_priority(0)
	choose_region.visible = true
	return_region.visible = false
	current_camera = null
	pass # Replace with function body.


func _on_tableau_1_input_event(camera: Node, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int) -> void:
	if event is InputEventMouseButton :
		choosing_menu.visible = true
		mysignal.emit()
		return_region.visible = false
		bt_yes.pressed.connect(choosed_piece._on_bt_yes_pressed.bind())
	pass # Replace with function body.

func _on_bt_yes_pressed() -> void:
	choosing_menu.visible = false
	return_region.visible = true
	pass # Replace with function body.
