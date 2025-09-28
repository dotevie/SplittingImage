extends Sprite2D
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if OS.has_feature("web"):
		#deletes object in web
		queue_free()
	if OS.has_feature("debug"):
		print("debug build")

func _input(event):
	#quits game if esc pressed
	if event.is_action_pressed("exit"):
		get_tree().quit()
