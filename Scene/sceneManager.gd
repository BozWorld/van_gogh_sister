extends Node3D

signal emitPos(pos)
@export var choose_region: Control
@export var return_region: Control
@export var choosing_menu: Control
@export var camera_wall_1: PhantomCamera3D
@export var camera_wall_2: PhantomCamera3D
@export var camera_wall_3: PhantomCamera3D
@export var bt_yes: Button
@export var poss: Array[Marker3D] = []

var stop: bool = true
var pos_exhibition: Array[Area3D] = []
var current_pos: int = 0

var current_camera: PhantomCamera3D
	
# func _process(delta) -> void:
	# if stop == false:
	# 	for i in Singleton.selected_piece.size():
	# 		print(Singleton.selected_piece)
	# 		print(Singleton.selected_piece[i].position)
	# 		for x in pos_exhibition.size():
	# 			print(pos_exhibition[x].position)
	# 			Singleton.selected_piece[i].position = pos_exhibition[x].position
	# 		stop = true
	# 	return
		# Singleton.selected_piece[i].position = pos_exhibition[i].position
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


func _on_tableau_1_input_event(camera: Node, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int) -> void:
	if event is InputEventMouseButton :
		choosing_menu.visible = true
		return_region.visible = false
	pass # Replace with function body.

func _on_bt_yes_pressed() -> void:
	stop = false
	Singleton.choosed_piece._on_bt_yes_pressed()
	Singleton.choosed_piece.position = poss[current_pos].position
	current_pos += 1
	choosing_menu.visible = false
	return_region.visible = true
	pass # Replace with function body.
