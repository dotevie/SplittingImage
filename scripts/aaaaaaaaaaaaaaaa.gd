class_name A extends Node

@export var level:Node2D

func do_it_back():
	create_tween().set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_IN).tween_property(level, "modulate:s", 0, 2.5)
	create_tween().set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_IN).tween_property(level, "modulate:v", 1, 2.5)
