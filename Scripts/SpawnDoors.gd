extends Node



var Door = preload("res://Scenes/Prefabs/Door.tscn")
var offset = Vector2(-550, -150)
var generator = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	print("asd")
	var doorInstance
	var doorPool = generatePool()
	for  door in doorPool:
		match door:
			GlobalVars.DoorTypes.DEATH_DOOR:
				doorInstance = Door.instantiate()
				doorInstance.position = offset
				doorInstance.setDoorType(door)
				add_child(doorInstance)
				doorInstance.setDoorType(door)
				offset.x += 400
			GlobalVars.DoorTypes.MONSTER_DOOR:
				doorInstance = Door.instantiate()
				doorInstance.position = offset
				doorInstance.setDoorType(door)
				add_child(doorInstance)
				doorInstance.setDoorTypeToChildren()
				offset.x += 400
			GlobalVars.DoorTypes.EMPTY_DOOR:
				doorInstance = Door.instantiate()
				doorInstance.position = offset
				doorInstance.setDoorType(door)
				add_child(doorInstance)
				doorInstance.setDoorTypeToChildren()
				offset.x += 400
			GlobalVars.DoorTypes.LOOT_DOOR:
				doorInstance = Door.instantiate()
				doorInstance.position = offset
				doorInstance.setDoorType(door)
				add_child(doorInstance)
				doorInstance.setDoorTypeToChildren()
				offset.x += 400


func generatePool():
	if generator.randi_range(0, 1):
		return [GlobalVars.DoorTypes.MONSTER_DOOR, GlobalVars.DoorTypes.MONSTER_DOOR, GlobalVars.DoorTypes.EMPTY_DOOR]
	return [GlobalVars.DoorTypes.EMPTY_DOOR, GlobalVars.DoorTypes.MONSTER_DOOR, GlobalVars.DoorTypes.MONSTER_DOOR]

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
