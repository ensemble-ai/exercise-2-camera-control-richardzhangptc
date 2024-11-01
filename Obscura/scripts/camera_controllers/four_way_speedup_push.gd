class_name FourWaySpeedupPushCamera
extends CameraControllerBase

@export var push_ratio: float = 0.5
@export var pushbox_top_left: Vector2
@export var pushbox_bottom_right: Vector2
@export var speedup_zone_top_left: Vector2
@export var speedup_zone_bottom_right: Vector2



func _ready() -> void:
	super()
	position = target.position
	

func _process(delta: float) -> void:
	if !current:
		return
	if draw_camera_logic:
		draw_logic()
	
	var safe_zone: bool = false

	var safe_x_pos: bool = false # to the right of left border
	var safe_x_neg: bool = false # to the left of right border
	var safe_z_pos: bool = false # to the top of bottom border
	var safe_z_neg: bool = false # to the bottom of top border

	
	if target.global_position.x > global_position.x + speedup_zone_top_left.x:
		safe_x_pos = true
	if target.global_position.x < global_position.x + speedup_zone_bottom_right.x:
		safe_x_neg = true
	
	if target.global_position.z > global_position.z + speedup_zone_top_left.y:
		safe_z_pos = true
	if target.global_position.z < global_position.z + speedup_zone_bottom_right.y:
		safe_z_neg = true
		
	if safe_x_pos and safe_x_neg and safe_z_pos and safe_z_neg:
		safe_zone = true


	
	if target.global_position.x < position.x + pushbox_top_left.x:
		var compensation = target.global_position.x - (position.x + pushbox_top_left.x)
		global_position.x += compensation
		
	if target.global_position.x > position.x + pushbox_bottom_right.x:
		var compensation = target.global_position.x - (position.x + pushbox_bottom_right.x)
		global_position.x += compensation
		
	if target.global_position.z < position.z + pushbox_top_left.y:
		var compensation = target.global_position.z - (position.z + pushbox_top_left.y)
		global_position.z += compensation
		
	if target.global_position.z > position.z + pushbox_bottom_right.y:
		var compensation = target.global_position.z - (position.z + pushbox_bottom_right.y)
		global_position.z += compensation
	
	if safe_zone == false:
		var additive = target.velocity * push_ratio * delta
		if !safe_x_pos and target.velocity.x > 0:
			additive.x = 0
		if !safe_x_neg and target.velocity.x < 0:
			additive.x = 0
		if !safe_z_pos and target.velocity.z > 0:
			additive.z = 0
		if !safe_z_neg and target.velocity.z < 0:
			additive.z = 0
			
		global_position += additive
		
	super(delta)


func draw_logic() -> void:
	var mesh_instance := MeshInstance3D.new()
	var immediate_mesh := ImmediateMesh.new()
	var material := ORMMaterial3D.new()
	
	mesh_instance.mesh = immediate_mesh
	mesh_instance.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	
	
	# DRAW OUTER BOX
	var left:float = pushbox_top_left.x
	var right:float = pushbox_bottom_right.x
	var top:float = pushbox_top_left.y
	var bottom:float = pushbox_bottom_right.y
	
	immediate_mesh.surface_begin(Mesh.PRIMITIVE_LINES, material)
	immediate_mesh.surface_add_vertex(Vector3(right, 0, top))
	immediate_mesh.surface_add_vertex(Vector3(right, 0, bottom))
	
	immediate_mesh.surface_add_vertex(Vector3(right, 0, bottom))
	immediate_mesh.surface_add_vertex(Vector3(left, 0, bottom))
	
	immediate_mesh.surface_add_vertex(Vector3(left, 0, bottom))
	immediate_mesh.surface_add_vertex(Vector3(left, 0, top))
	
	immediate_mesh.surface_add_vertex(Vector3(left, 0, top))
	immediate_mesh.surface_add_vertex(Vector3(right, 0, top))
	immediate_mesh.surface_end()
	
	# DRAW INNER BOX
	left = speedup_zone_top_left.x
	right = speedup_zone_bottom_right.x
	top = speedup_zone_top_left.y
	bottom = speedup_zone_bottom_right.y
	
	immediate_mesh.surface_begin(Mesh.PRIMITIVE_LINES, material)
	immediate_mesh.surface_add_vertex(Vector3(right, 0, top))
	immediate_mesh.surface_add_vertex(Vector3(right, 0, bottom))
	
	immediate_mesh.surface_add_vertex(Vector3(right, 0, bottom))
	immediate_mesh.surface_add_vertex(Vector3(left, 0, bottom))
	
	immediate_mesh.surface_add_vertex(Vector3(left, 0, bottom))
	immediate_mesh.surface_add_vertex(Vector3(left, 0, top))
	
	immediate_mesh.surface_add_vertex(Vector3(left, 0, top))
	immediate_mesh.surface_add_vertex(Vector3(right, 0, top))
	immediate_mesh.surface_end()
	
	
	material.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	material.albedo_color = Color.BLACK
	
	add_child(mesh_instance)
	mesh_instance.global_transform = Transform3D.IDENTITY
	mesh_instance.global_position = Vector3(global_position.x, target.global_position.y, global_position.z)
	
	#mesh is freed after one update of _process
	await get_tree().process_frame
	mesh_instance.queue_free()
