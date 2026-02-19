extends Draggable_Obj

enum cookedLevels {
	UNCOOKED,
	WARM,
	COOKED,
	BURNT
}
var top = cookedLevels.UNCOOKED
var bottom = cookedLevels.UNCOOKED

var topHeat: float = 0
var bottomHeat: float = 0
