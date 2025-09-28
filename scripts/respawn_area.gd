class_name RespawnArea extends Area2D

@onready var respawn_point:Node2D = $RespawnPoint

func _ready() -> void:
	body_entered.connect(on_enter)
	
func on_enter(body:Node2D) -> void:
	print(body)
	if (body.is_in_group("player")):
		RespawnData.spawnPoint = Vector2(respawn_point.global_position.x, respawn_point.global_position.y)
