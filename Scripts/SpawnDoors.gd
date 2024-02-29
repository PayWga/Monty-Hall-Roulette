extends Node

const DEATH_DOOR = -2
const MONSTER_DOOR = -1
const EMPTY_DOOR = 0
const LOOT_DOOR = 1


var emptyDoor = preload("res://EmptyDoor.tscn")
var monsterDoor = preload("res://MonsterDoor.tscn")
var offset = Vector2(-550, -150)
var generator = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	print("asd")
	var doorInstance
	var doorPool = generatePool()
	for x in doorPool:
		match x:
			DEATH_DOOR:
				doorInstance = monsterDoor.instantiate()
				doorInstance.position = offset
				add_child(doorInstance)
				offset.x += 400
			MONSTER_DOOR:
				doorInstance = monsterDoor.instantiate()
				doorInstance.position = offset
				add_child(doorInstance)
				offset.x += 400
			EMPTY_DOOR:
				doorInstance = emptyDoor.instantiate()
				doorInstance.position = offset
				add_child(doorInstance)
				offset.x += 400
			LOOT_DOOR:
				doorInstance = emptyDoor.instantiate()
				doorInstance.position = offset
				add_child(doorInstance)
				offset.x += 400


func generatePool():
	if generator.randi_range(0, 1):
		return [MONSTER_DOOR, MONSTER_DOOR, EMPTY_DOOR]
	return [EMPTY_DOOR, MONSTER_DOOR, MONSTER_DOOR]

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
