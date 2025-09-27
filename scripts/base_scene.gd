class_name BaseScene extends Node

@export var mirror_scene:MirrorScene;
@export var player:Player;

func _ready():
	mirror_scene.parent_scene = self
	mirror_scene.init()
