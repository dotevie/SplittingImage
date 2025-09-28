class_name Door extends StaticBody2D

@export var ID:int = 0

func open():
	if (MirrorScene.instance.linked_doors[ID] != null): MirrorScene.instance.linked_doors[ID].queue_free()
	queue_free()
