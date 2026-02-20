extends Node2D

@onready var order_station = $Order_station
@onready var grill_station= $Grill_Station
@onready var build_station = $Build_Station
@onready var serving_station = $Serving_Station

@export var current_station: Node2D

@onready var order_station_button: Button = $PlayableMenu/Control/BoxContainer/Order_Station
@onready var grill_station_button: Button = $PlayableMenu/Control/BoxContainer/Grill_Station
@onready var build_station_button: Button = $PlayableMenu/Control/BoxContainer/Build_Station
@onready var serving_station_button: Button = $PlayableMenu/Control/BoxContainer/Serving_Station

func _ready():
	order_station_button.pressed.connect(func(): show_station(order_station))
	grill_station_button.pressed.connect(func(): show_station(grill_station))
	build_station_button.pressed.connect(func(): show_station(build_station))
	serving_station_button.pressed.connect(func(): show_station(serving_station))
	
	show_station(order_station)
func show_station(target_station):
	var current_station = target_station
	var all_stations = [order_station, grill_station, build_station, serving_station]
	for s in all_stations:
		if s == target_station:
			s.visible = true
		else:
			s.visible = false
	var plate_items = get_tree().get_nodes_in_group("on_transfer_plate")
	for item in plate_items:
		if item.get_parent() != target_station:
			item.get_parent().remove_child(item)
			target_station.add_child(item)
