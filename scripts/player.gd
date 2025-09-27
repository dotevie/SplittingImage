extends RigidBody2D

@export var cam:Camera2D

func _process(delta: float) -> void:
	#pass
	cam.position.y = self.position.y;

func _integrate_forces(state: PhysicsDirectBodyState2D) -> void:
	var velocity := state.get_linear_velocity()
	var step := state.get_step()
	
	# player input
	var move_left := Input.is_action_pressed("move_left")
	var move_right := Input.is_action_pressed("move_right")
	var jump := Input.is_action_pressed("jump")
	
	if move_left:
		print("left")
	if move_right:
		print("right")
	if jump:
		print("jump")
	
