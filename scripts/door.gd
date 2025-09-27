class_name Door extends Node

@export var linked_door:Door

func open():
	linked_door.queue_free()
	queue_free()
