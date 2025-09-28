class_name MirrorScene extends Node

var parent_scene:BaseScene
@export var mirror_player:MirrorPlayer
static var instance:MirrorScene
@export var linked_doors:Array[Door]
@export var camera:FollowCamera
@export var level:Node2D
@export var color:Color

func init():
	instance = self
	mirror_player.parent_scene = self
	mirror_player.copy_player = parent_scene.player
	
func die():
	parent_scene.die()
	
func specific_function_for_literally_one_thing():
	create_tween().set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_IN).tween_property(level, "modulate:r", color.r, 2.5)
	create_tween().set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_IN).tween_property(level, "modulate:g", color.g, 2.5)
	create_tween().set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_IN).tween_property(level, "modulate:b", color.b, 2.5)
	
