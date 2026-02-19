extends RigidBody2D

class_name Draggable_Obj
var is_dragged = false
var mouse_offset
var speed = 10

func _physics_process(delta):
	if is_dragged == true:
		global_position = global_position.lerp(get_global_mouse_position()-mouse_offset, speed*delta)
		linear_velocity = Vector2(0, 0)
		# gravity_scale = 1

func _input_event(_viewport, event, _shape_idx): #input_event on rigidbody automatically checks if it's on the object's shape2d
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.is_pressed():
			is_dragged = true
			freeze = false
			mouse_offset = get_global_mouse_position()-global_position
		else:
			is_dragged = false
			freeze = false

func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.is_released():
			is_dragged = false
			freeze = false
