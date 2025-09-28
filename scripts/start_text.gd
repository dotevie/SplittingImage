extends Sprite2D
var starting:bool = false
func _input(event):
	if event.is_action_pressed("game_start"):
		if (starting): return;
		starting = true;
		print("start")
		Transition.instance.callback.disconnect(Transition.instance.on_die)
		Transition.instance.callback.connect(func():
			Transition.instance.get_tree().change_scene_to_file("res://scenes/beginning.tscn")
		);
		Transition.instance.trans_out()
		
