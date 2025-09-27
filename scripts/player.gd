class_name Player extends RigidBody2D

@export var cam:Camera2D

const FLOOR_ACCEL = 1000
const FLOOR_DEACCEL = 500
const AIR_ACCEL = 800
const AIR_DEACCEL = 400
const MAX_VELOCITY = 256
const JUMP_VELOCITY = 512
const STOP_JUMP_FORCE = 4096
const COYOTE_TIME = 0.1

var airborne_time: float = 0.0
var jumping = false

func _process(_delta: float) -> void:
	#pass
	cam.position.y = self.position.y;

func _integrate_forces(state: PhysicsDirectBodyState2D) -> void:
	var velocity := state.get_linear_velocity()
	var step := state.get_step()
	
	# player input
	var move_left := Input.is_action_pressed("move_left")
	var move_right := Input.is_action_pressed("move_right")
	var jump := Input.is_action_pressed("jump")
	
	# Find the floor (a contact with upwards facing collision normal).
	var found_floor := false
	# var floor_index := -1
	
	# check for grounded
	for contact_index in state.get_contact_count():
		var collision_normal = state.get_contact_local_normal(contact_index)
		# print(collision_normal)
		
		if collision_normal.dot(Vector2(0, -1)) > 0.6:
			found_floor = true
			# floor_index = contact_index

	if found_floor:
		airborne_time = 0.0
	else:
		airborne_time += step # Time it spent in the air.

	var on_floor := airborne_time < COYOTE_TIME
	
	if jumping:
		if velocity.y > 0:
			# Set off the jumping flag if going down.
			jumping = false
		elif not jump:
			velocity.y += STOP_JUMP_FORCE * step

	if on_floor:
		# Process logic when character is on floor.
		if move_left and not move_right:
			velocity.x = maxf(-MAX_VELOCITY,velocity.x - FLOOR_ACCEL*step)
		elif move_right and not move_left:
			velocity.x = minf(MAX_VELOCITY,velocity.x + FLOOR_ACCEL*step)
		else:
			#reduce magnitude of horizontal movement by floor deaccel
			velocity.x = signf(velocity.x) * minf(absf(velocity.x) - FLOOR_DEACCEL*step,0)

		# Check jump.
		if not jumping and jump:
			velocity.y = -JUMP_VELOCITY
			jumping = true
	else:
		# Process logic when the character is in the air.
		if move_left and not move_right:
			velocity.x = maxf(-MAX_VELOCITY,velocity.x - AIR_ACCEL*step)
		elif move_right and not move_left:
			velocity.x = minf(MAX_VELOCITY,velocity.x + AIR_ACCEL*step)
		else:
			#reduce magnitude of horizontal movement by floor deaccel
			velocity.x = signf(velocity.x) * minf(absf(velocity.x) - FLOOR_DEACCEL*step,0)

	
	if jump and on_floor:
		velocity.y = -JUMP_VELOCITY
	velocity += state.get_total_gravity() * step
	state.set_linear_velocity(velocity)
	
	
