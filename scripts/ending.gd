class_name Ending extends Node

@export var credits:Node2D
@export var player:AudioStreamPlayer2D
func _ready() -> void:
	await get_tree().create_timer(2.5).timeout
	await create_tween().set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT).tween_property(BigScene.instance.left_viewport_container, "position:x", -400, 2.5).finished
	await get_tree().create_timer(2).timeout
	credits.visible = true
	player.connect("finished", Callable(self,"_on_loop_sound").bind(player))
	player.play()
