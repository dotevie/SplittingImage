extends RigidBody2D

@export var cam:Camera2D

func _process(delta: float) -> void:
	#pass
	cam.position.y = self.position.y;

func _integrate_forces(state: PhysicsDirectBodyState2D) -> void:
	pass;
