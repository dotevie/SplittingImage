class_name BaseScene extends Node

@export var mirror_scene:MirrorScene;
@export var player:Player;
@export var camera:FollowCamera
@export var default_spawn_point:Node2D
@export var transition_area:TransitionArea
static var instance:BaseScene


func _ready():
	player.parent_scene = self
	instance = self
	if (RespawnData.spawnPoint.x < -100): RespawnData.spawnPoint = Vector2(default_spawn_point.position)
	player.position = Vector2(RespawnData.spawnPoint)
	camera.snap()
	if (mirror_scene != null):
		mirror_scene.parent_scene = self
		mirror_scene.init()
	
func die():
	player.die()
	if (mirror_scene != null): mirror_scene.mirror_player.die()
	Transition.instance.trans_out()
