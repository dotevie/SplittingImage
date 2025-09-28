class_name Transition extends Sprite2D
static var instance:Transition
signal callback;

func _ready():
	callback.connect(on_die)
	
	instance = self
	material.set("shader_parameter/progress", 1)
	create_tween().set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT).tween_method(func(val): material.set("shader_parameter/progress", val), 1.0, 0.0, 1.5)
	if (BaseScene.instance.transition_area != null): BaseScene.instance.transition_area.init()

func on_die():
	get_tree().reload_current_scene()

var timer := -100.0
func trans_out():
	self.rotation_degrees = 0
	var tween := create_tween()
	tween.set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT).tween_method(func(val): material.set("shader_parameter/progress", val), 0.0, 1.0, 1.5)
	timer = 0.5
	
func _process(delta: float) -> void:
	if (timer > 0):
		timer -= delta;
	elif (timer > -10):
		callback.emit()
