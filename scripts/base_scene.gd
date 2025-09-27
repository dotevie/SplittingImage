class_name BaseScene extends Node

@export var mirror_scene:MirrorScene;
@export var player:Player;

func _ready():
	player.parent_scene = self
	mirror_scene.parent_scene = self
	mirror_scene.init()
	
func die():
	player.die()
	mirror_scene.mirror_player.die()
