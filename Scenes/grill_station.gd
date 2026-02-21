extends Node2D

@onready var cont = $IngredContainer
@onready var botBun = preload("res://Scenes/Ingredients/bottom_bun.tscn")

func _input(event):
	if event.is_action_pressed("Press1"):
		var objecto = botBun.instantiate()
		objecto.position = get_global_mouse_position()
		cont.add_child(objecto)
	
