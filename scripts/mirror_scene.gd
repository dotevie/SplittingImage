class_name MirrorScene extends Node

var parent_scene:BaseScene
@export var mirror_player:MirrorPlayer
static var instance:MirrorScene
@export var linked_doors:Array[Door]
@export var camera:FollowCamera

func init():
	instance = self
	mirror_player.parent_scene = self
	mirror_player.copy_player = parent_scene.player
	
func die():
	parent_scene.die()
	
