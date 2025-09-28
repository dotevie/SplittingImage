class_name TransitionArea extends Area2D

@export var next_scene:String

func init() -> void:
	body_entered.connect(on_enter)
	
func on_enter(body:Node2D) -> void:
	print(body)
	if (body.is_in_group("player")):
		Transition.instance.callback.connect(func(): 
			RespawnData.spawnPoint = Vector2(-1000, 0)
			Transition.instance.get_tree().change_scene_to_file(next_scene)
		);
		Transition.instance.callback.disconnect(Transition.instance.on_die)
		Transition.instance.trans_out()
