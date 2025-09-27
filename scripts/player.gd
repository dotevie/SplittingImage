extends Node

@export var cam:Camera2D
@export var rb:RigidBody2D

func _process(delta: float) -> void:
	#pass
	cam.position.y = rb.position.y;
	print(self.position.y);
