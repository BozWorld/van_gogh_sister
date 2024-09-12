extends Area3D

@export var choosing_menu: Control
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	mouse_entered.connect(_on_mouse_entered)
	#mouse_exited.connect(_on_mouse_exited)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _on_bt_yes_pressed() -> void:
	Singleton.selected_piece.append(self)
	queue_free()
	pass # Replace with function body.


func _on_mouse_entered() -> void:
	Singleton.choosed_piece = self
	print(Singleton.choosed_piece)
	#await painting.mysignal
	#painting.bt_yes.pressed.connect(_on_bt_yes_pressed)
	
#func _on_mouse_exited() -> void:
	#painting.choosed_piece = null
