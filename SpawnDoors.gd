extends Node

const DEATH_DOOR = -2
const MONSTER_DOOR = -1
const EMPTY_DOOR = 0
const LOOT_DOOR = 1


var door = preload("res://EmptyDoor.tscn")
var offset = Vector2(-400, 0)

# Called when the node enters the scene tree for the first time.
func _ready():
	var doorInstance
	var doorPool = generatePool()
	for x in doorPool:
		match x:
			DEATH_DOOR:
				doorInstance = door.instantiate()
				doorInstance.position = offset
				add_child(doorInstance)
				offset.x += 400
			MONSTER_DOOR:
				doorInstance = door.instantiate()
				doorInstance.position = offset
				add_child(doorInstance)
				offset.x += 400
			EMPTY_DOOR:
				doorInstance = door.instantiate()
				doorInstance.position = offset
				add_child(doorInstance)
				offset.x += 400
			LOOT_DOOR:
				doorInstance = door.instantiate()
				doorInstance.position = offset
				add_child(doorInstance)
				offset.x += 400


func generatePool():
	return [MONSTER_DOOR, MONSTER_DOOR, EMPTY_DOOR]

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
