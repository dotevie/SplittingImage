extends Sprite2D

func _ready():
	material.set("shader_parameter/progress", 1)
	create_tween().set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT).tween_method(func(val): material.set("shader_parameter/progress", val), 1.0, 0.0, 1.5)
