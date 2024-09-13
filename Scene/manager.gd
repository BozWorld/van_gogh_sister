extends Node3D

@export var tuto_ui: Control
@export var choose_region: Control
@export var return_region: Control
@export var choosing_menu: Control
@export var camera_wall_1: PhantomCamera3D
@export var camera_wall_2: PhantomCamera3D
@export var camera_wall_3: PhantomCamera3D
@export var final_camera	: PhantomCamera3D
@export var bt_yes: Button
@export var poss: Array[Marker3D] = []
@export var number_Selection: Control

var stop: bool = true
var pos_exhibition: Array[Area3D] = []
var current_pos: int = 0

var current_camera: PhantomCamera3D
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	number_Selection.get_child(1).text = str(current_pos) + "/5"
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	tuto_ui.visible = false
	choose_region.visible = true
	number_Selection.visible = true
	pass # Replace with function body.


func _on_first_zone_button_pressed() -> void:
	camera_wall_2.set_priority(20)
	choose_region.visible = false
	return_region.visible = true
	current_camera = camera_wall_2
	pass # Replace with function body.


func _on_second_zone_button_pressed() -> void:
	camera_wall_1.set_priority(20)
	choose_region.visible = false
	return_region.visible = true
	current_camera = camera_wall_1
	pass # Replace with function body.


func _on_third_zone_button_pressed() -> void:
	camera_wall_3.set_priority(20)
	choose_region.visible = false
	return_region.visible = true
	current_camera = camera_wall_3
	pass # Replace with function body.


func _on_return_button_pressed() -> void:
	current_camera.set_priority(0)
	choose_region.visible = true
	return_region.visible = false
	current_camera = null
	pass # Replace with function body.


func _on_tableau_3_input_event(camera: Node, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int) -> void:
	if event is InputEventMouseButton :
		choosing_menu.visible = true
		return_region.visible = false
	pass # Replace with function body.

func _on_bt_yes_pressed() -> void:
	Singleton.choosed_piece._on_bt_yes_pressed()
	Singleton.choosed_piece.position = poss[current_pos].position
	Singleton.choosed_piece.rotation = poss[current_pos].rotation
	current_pos += 1
	number_Selection.get_child(1).text = str(str(current_pos) + "/5")
	choosing_menu.visible = false
	return_region.visible = true
	if(Singleton.selected_piece.size() >= 5):
		final_camera.set_priority(20)
	pass # Replace with function body


func _on_bt_no_pressed() -> void:
	choosing_menu.visible = false
	return_region.visible = true
	pass # Replace with function body.
