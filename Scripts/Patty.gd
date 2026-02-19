extends Draggable_Obj
class_name patty

var sprit

func _ready():
	sprit = $Sprite2D
	update_properties()

enum cookedLevels {
	UNCOOKED,
	WARM,
	MEDIUM,
	COOKED,
	BURNT
}
var uncooked_patty = preload("res://Assets/UncookedPatty.png")
var warm_patty = preload("res://Assets/PattyBW-TW.png")
var medium_patty = preload("res://Assets/PattyBM-TM.png")
var cooked_patty = preload("res://Assets/PattyBC-TC.png")
var burnt_patty = preload("res://Assets/PattyBB-TB.png")

var slippery = preload("res://Assets/Slippery.tres")
var not_slippery = preload("res://Assets/NotSlippery.tres")

var state = cookedLevels.UNCOOKED
var heat = 0

func cook(time):
	heat = heat + time*100
	if (heat>700):
		state = cookedLevels.BURNT
	elif (heat>600):
		state = cookedLevels.COOKED
	elif (heat>400):
		state = cookedLevels.MEDIUM
	elif (heat>200):
		state = cookedLevels.WARM
	else:
		state = cookedLevels.UNCOOKED
	update_properties()

func update_properties():
	match state:
		cookedLevels.UNCOOKED:
			sprit.texture = uncooked_patty
			physics_material_override = slippery
		cookedLevels.WARM:
			sprit.texture = warm_patty
			physics_material_override = slippery
		cookedLevels.MEDIUM:
			sprit.texture = medium_patty
			physics_material_override = not_slippery
		cookedLevels.COOKED:
			sprit.texture = cooked_patty
			physics_material_override = not_slippery
		cookedLevels.BURNT:
			sprit.texture = burnt_patty
			physics_material_override = not_slippery
