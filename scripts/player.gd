class_name Player extends Node

@export var cam:Camera2D

func _process(delta: float) -> void:
	#pass
	cam.position.y = self.position.y;
