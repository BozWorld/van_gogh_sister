extends Node3D

var final_painting_list: Array[Sprite3D] = []
@export var testing: Texture2D
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var painting = get_tree().get_nodes_in_group("painting")
	for i in painting:
		i.texture = testing 
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
