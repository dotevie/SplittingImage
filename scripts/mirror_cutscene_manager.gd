class_name MirrorCutsceneManager extends Node

@export var the_way_up_tiles:TileMapLayer
@export var left_color:Color
@export var right_color:Color
var other_level:Node2D
@export var level:Node2D

func _ready() -> void:
	await get_tree().create_timer(2.5).timeout
	await create_tween().set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT).tween_property(BigScene.instance.left_viewport_container, "position:x", 0, 2.5).finished
	create_tween().set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_IN).tween_property(level, "modulate:h", left_color.h, 2.5)
	create_tween().set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_IN).tween_property(level, "modulate:s", left_color.s, 2.5)
	create_tween().set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_IN).tween_property(level, "modulate:v", left_color.v, 2.5)
	MirrorScene.instance.specific_function_for_literally_one_thing()

	await create_tween().set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_IN).tween_property(BigScene.instance.right_viewport_container, "position:x", 800, 2.5).finished
	await get_tree().create_timer(.5).timeout
	BaseScene.instance.player.can_move = true
	await create_tween().tween_property(the_way_up_tiles, "modulate:a", 1, .25).finished
