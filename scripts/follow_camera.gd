class_name FollowCamera extends Camera2D

@export var follow:Node2D
@export var horizontal:bool = false
@export var copy_camera:bool
@export var snap_start:float
@export var snap_end:float

func _process(delta:float) -> void:
	if (copy_camera && BaseScene.instance.camera != null):
		self.position = BaseScene.instance.camera.position
		return
	if (follow == null): return;
	if (horizontal):
		self.position.x = lerpf(snap_start if follow.position.x < snap_start else snap_end if follow.position.x > snap_end else follow.position.x, self.position.x, 1 - (delta * 9))
	else:
		self.position.y = lerpf(snap_start if follow.position.x < snap_start else snap_end if follow.position.y > snap_end else follow.position.y, self.position.y, 1 - (delta * 9))

func snap():
	if (horizontal):
		self.position.x = snap_start if follow.position.x < snap_start else snap_end if follow.position.x > snap_end else follow.position.x;
	else:
		self.position.y = snap_start if follow.position.x < snap_start else snap_end if follow.position.y > snap_end else follow.position.y;
