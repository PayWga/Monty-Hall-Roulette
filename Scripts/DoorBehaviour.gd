extends Node

var DoorType

# Called when the node enters the scene tree for the first time.
func _enter_tree():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func setDoorType(Type):
	DoorType = Type

func setDoorTypeToChildren():
	get_node("DoorComponent").setDoorType(DoorType)
	get_node("DoorPeekComponent").setDoorType(DoorType)
	get_node("DoorTexture").setDoorType(DoorType)
