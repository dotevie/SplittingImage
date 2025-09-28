class_name MirrorPlayer extends Node

var copy_player:Player
var parent_scene:MirrorScene
@export var cam:Camera2D;
@onready var _animated_sprite = $AnimatedSprite2D
var old_name:StringName

func _ready() -> void:
	_animated_sprite.play("idle")
	
func _process(_delta) -> void:
	if (copy_player != null):
		self.position = copy_player.position
		old_name = _animated_sprite.animation
		_animated_sprite.animation = copy_player._animated_sprite.animation;
		if (old_name != _animated_sprite.animation):
			_animated_sprite.play(_animated_sprite.animation)
			old_name = _animated_sprite.animation
		#cam.position.y = copy_player.position.y

func die():
	queue_free()
