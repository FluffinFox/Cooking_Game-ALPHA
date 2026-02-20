extends Area2D

@onready var main_path = get_tree().root.get_child(0)

func _ready() -> void:
	area_entered.connect(_on_item_entered)
	body_entered.connect(_on_item_entered)
	
	area_exited.connect(_on_item_exited)
	body_exited.connect(_on_item_exited)
	
func _on_item_entered(item):
	if item.is_in_group("ingredients"):
		call_deferred("transfer_item", item)

func _on_item_exited(item):
	if item.is_in_group("on_transfer_plate"):
		item.remove_from_group("on_transfer_plate")
		call_deferred("_finalize_exit", item)

func _finalize_exit(item):
	item.remove_from_group("on_transfer_plate")
	reset_item_to_local_physics(item)

func transfer_item(item):
	item.add_to_group("on_transfer_plate")
	
	if item.get_parent() != main_path:
		item.get_parent().remove_child(item)
		main_path.add_child(item)
	
	if main_path.current_station == main_path.grill_station:
		# to build layer
		_set_layers(item, 3) 
	else:
		# to grill layer
		_set_layers(item, 2)

func _set_layers(item, layer_num):
	# Disable all station layers first, then enable the target
	for i in [2, 3]:
		item.set_collision_layer_value(i, i == layer_num)
		item.set_collision_mask_value(i, i == layer_num)
		

func reset_item_to_local_physics(item):
	if item.get_collision_layer_value(2) == true:
		_set_layers(item, 3)
		
	elif item.get_collision_layer_value(3) == true:
		_set_layers(item, 2)
