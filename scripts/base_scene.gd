class_name BaseScene extends Node

@export var mirror_scene:MirrorScene;
@export var player:Player;
@export var camera:FollowCamera
static var instance:BaseScene


func _ready():
	player.parent_scene = self
	instance = self
	if (mirror_scene != null):
		mirror_scene.parent_scene = self
		mirror_scene.init()
	
func die():
	player.die()
	if (mirror_scene != null): mirror_scene.mirror_player.die()
	Transition.instance.trans_out()
