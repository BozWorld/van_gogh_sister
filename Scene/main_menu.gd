extends Control

@export var next_scene: PackedScene


func _on_button_pressed() -> void:
	get_tree().change_scene_to_packed(next_scene)
	pass # Replace with function body.


func _on_bt_quit_pressed() -> void:
	get_tree().quit()
	pass # Replace with function body.
