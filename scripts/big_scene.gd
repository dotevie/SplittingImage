class_name BigScene extends Node2D

static var instance:BigScene
@export var left_viewport_container:SubViewportContainer
@export var right_viewport_container:SubViewportContainer
func _ready() -> void:
	instance = self;
