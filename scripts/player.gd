class_name Player extends RigidBody2D

@onready var _animated_sprite = $AnimatedSprite2D

@export var cam:Camera2D
var parent_scene:BaseScene
const FLOOR_ACCEL = 4000
const FLOOR_DEACCEL = 2000
const AIR_ACCEL = 1000
const AIR_DEACCEL = 400
const MAX_VELOCITY = 200
const JUMP_VELOCITY = 600
const STOP_JUMP_FORCE = 3000
const COYOTE_TIME = 0.1

var airborne_time: float = 0.0
var jumping = false
var face_left = false

func _process(_delta: float) -> void:
	if (self.position.y >= 500):
		BaseScene.instance.die()
	if (_animated_sprite == null): return;
	if Input.is_action_pressed("ui_right") and not jumping:
		_animated_sprite.play("walk")
		face_left = false
	elif Input.is_action_pressed("ui_left") and not jumping:
		_animated_sprite.play("walk_left")
		face_left = true
	elif jumping:
		if not face_left:
			_animated_sprite.play("jump_ascend")
			_animated_sprite.play("jump_arc")
		else:
			_animated_sprite.play("jump_ascend_left")
			_animated_sprite.play("jump_arc_left")
	else:
		if not face_left:
			_animated_sprite.play("idle")
		else:
			_animated_sprite.play("idle_left")
	pass
	#cam.position.y = self.position.y;
	
func die():
	queue_free()

var velocity:Vector2;
func _integrate_forces(state: PhysicsDirectBodyState2D) -> void:
	velocity = state.get_linear_velocity()
	var step := state.get_step()
	
	# player input
	var move_left := Input.is_action_pressed("move_left")
	var move_right := Input.is_action_pressed("move_right")
	var start_jump := Input.is_action_just_pressed("jump")
	var jump := Input.is_action_pressed("jump")
	
	# Find the floor (a contact with upwards facing collision normal).
	var found_floor := false
	# var floor_index := -1
	
	# check for grounded
	for contact_index in state.get_contact_count():
		var collision_normal = state.get_contact_local_normal(contact_index)
		
		if collision_normal.dot(Vector2(0, -1)) > 0.6:
			found_floor = true
			# floor_index = contact_index
	# print(state.get_contact_count())

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
			if velocity.x <= 0:
				velocity.x = maxf(-MAX_VELOCITY,velocity.x - FLOOR_ACCEL*step)
			else:
				velocity.x = maxf(-MAX_VELOCITY,velocity.x - (FLOOR_ACCEL + FLOOR_DEACCEL)*step)
		elif move_right and not move_left:
			if velocity.x >= 0:
				velocity.x = minf(MAX_VELOCITY,velocity.x + FLOOR_ACCEL*step)
			else:
				velocity.x = minf(MAX_VELOCITY,velocity.x + (FLOOR_ACCEL + FLOOR_DEACCEL)*step)
		else:
			#reduce magnitude of horizontal movement by floor deaccel
			velocity.x = signf(velocity.x) * maxf(absf(velocity.x) - FLOOR_DEACCEL*step,0)

		# Check jump.
		if not jumping and start_jump:
			velocity.y = -JUMP_VELOCITY
			jumping = true
			
	else:
		# Process logic when the character is in the air.
		if move_left and not move_right:
			if velocity.x <= 0:
				velocity.x = maxf(-MAX_VELOCITY,velocity.x - AIR_ACCEL*step)
			else:
				velocity.x = maxf(-MAX_VELOCITY,velocity.x - (AIR_ACCEL + AIR_DEACCEL)*step)
		elif move_right and not move_left:
			if velocity.x >= 0:
				velocity.x = minf(MAX_VELOCITY,velocity.x + AIR_ACCEL*step)
			else:
				velocity.x = minf(MAX_VELOCITY,velocity.x + (AIR_ACCEL + AIR_DEACCEL)*step)
		else:
			#reduce magnitude of horizontal movement by air deaccel
			velocity.x = signf(velocity.x) * maxf(absf(velocity.x) - AIR_DEACCEL*step,0)
	
	velocity += state.get_total_gravity() * step
	state.set_linear_velocity(velocity)
