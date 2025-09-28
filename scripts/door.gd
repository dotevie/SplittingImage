class_name Door extends StaticBody2D


func open():
	if (MirrorScene.instance.linked_door != null): MirrorScene.instance.linked_door.queue_free()
	queue_free()
