class_name LerpTargetFocusCamera
extends CameraControllerBase


@export var lead_speed: float = 100.0
@export var catchup_delay_duration: float = 1.0
@export var catchup_speed: float = 5.0
@export var leash_distance: float = 10.0
var idle_time: float = 0.0 # tracks time since the player stops moving

func _ready() -> void:
	super()
	position = target.position

func _process(delta: float) -> void:
	if !current:
		return
	
	var distance_to_target = global_position.distance_to(target.global_position)
	var direction_to_target = target.global_position - global_position
	
	if draw_camera_logic:
		draw_logic()
	
	if distance_to_target > leash_distance:
		var compensation:float = distance_to_target - leash_distance
		var direction_to_camera = (global_position - target.global_position).normalized()
		global_position = target.global_position + direction_to_camera * (leash_distance - compensation)

	if target.velocity != Vector3.ZERO:
		var lead_position = target.global_position + (target.velocity.normalized() * leash_distance)
		
		if(target.velocity.length() > 299.0): # Handle burst speed
			global_position = global_position.move_toward(lead_position, (lead_speed + 350) * delta)
		else:
			global_position = global_position.move_toward(lead_position, lead_speed * delta)
		
	else:
		idle_time += delta
		if idle_time >= catchup_delay_duration:
			global_position += direction_to_target * catchup_speed * delta

	super(delta)

func draw_logic() -> void:
	var mesh_instance := MeshInstance3D.new()
	var immediate_mesh := ImmediateMesh.new()
	var material := ORMMaterial3D.new()
	
	mesh_instance.mesh = immediate_mesh
	mesh_instance.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	
	immediate_mesh.surface_begin(Mesh.PRIMITIVE_LINES, material)
	immediate_mesh.surface_add_vertex(Vector3(-2.5, 0, 0))
	immediate_mesh.surface_add_vertex(Vector3(2.5, 0, 0))
	immediate_mesh.surface_add_vertex(Vector3(0, 0, -2.5))
	immediate_mesh.surface_add_vertex(Vector3(0, 0, 2.5))
	immediate_mesh.surface_end()
	
	material.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	material.albedo_color = Color.BLACK
	
	add_child(mesh_instance)
	mesh_instance.global_transform = Transform3D.IDENTITY
	mesh_instance.global_position = Vector3(global_position.x, target.global_position.y, global_position.z)
	
	await get_tree().process_frame
	mesh_instance.queue_free()
