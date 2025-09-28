extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if OS.has_feature("web"):
		queue_free()
	if OS.has_feature("debug"):
		print("debug build")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _input(event):
	if event.is_action_pressed("exit"):
		get_tree().quit()
