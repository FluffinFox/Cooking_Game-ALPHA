extends StaticBody2D

var are

func _ready():
	are = $Area2D
	# getoverlappingbodies gives array

func _physics_process(delta: float) -> void:
	for object in are.get_overlapping_bodies():
		if object.has_method("cook"):
			object.cook(delta)
