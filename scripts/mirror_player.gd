class_name MirrorPlayer extends Node

var copy_player:Player
@export var cam:Camera2D;

func _process(_delta) -> void:
	if (copy_player != null):
		self.position = copy_player.position
		cam.position.y = copy_player.position.y
