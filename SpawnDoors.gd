extends Node

const DEATH_DOOR = -2
const MONSTER_DOOR = -1
const EMPTY_DOOR = 0
const LOOT_DOOR = 1


var doorPool
var door = load("res://Door.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	doorPool = generatePool()
	for x in doorPool:
		match x:
			DEATH_DOOR:
				var doorInstance = door.instantiate()
				add_child(doorInstance)
			MONSTER_DOOR:
				var doorInstance = door.instantiate()
				add_child(doorInstance)
			EMPTY_DOOR:
				var doorInstance = door.instantiate()
				add_child(doorInstance)
			LOOT_DOOR:
				var doorInstance = door.instantiate()
				add_child(doorInstance)


func generatePool():
	return [MONSTER_DOOR, MONSTER_DOOR, EMPTY_DOOR]

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
