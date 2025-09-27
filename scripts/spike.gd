class_name Spike extends Area2D

func _ready() -> void:
	print("ready")
	body_entered.connect(on_body_enter)
	
func on_body_enter(body:Node2D) -> void:
	if (body.is_in_group("player")):
		BaseScene.instance.die()
