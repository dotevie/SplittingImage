class_name FPSCounter extends Label

func _process(_delta):
	text = str(int(Engine.get_frames_per_second())) + " FPS";
