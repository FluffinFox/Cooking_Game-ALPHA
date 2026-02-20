extends Node

var transfer_plate_patties = []

func add_to_transfer_plate(patty_node):
	var data = {
		"heat": patty_node.heat,
		"state": patty_node.state
	}
	transfer_plate_patties.append(data)
