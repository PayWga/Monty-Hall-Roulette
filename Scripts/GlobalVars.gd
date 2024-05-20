extends Node

enum DoorTypes {EMPTY_DOOR, LOOT_DOOR, MONSTER_DOOR, DEATH_DOOR}
enum AbilityTypes {MONTY_HALL, REVEAL, DESTRUCTION, KEY}

var playerScore = 0
var monsterDoorsSpawned = 1.0
var monsterDoorsOpened = 1.0

var goodDoorProbability = 1.0/3.0
var badDoorProbability = 2.0/3.0

signal DoorOpened(DoorType)
signal AbilityUsed(AbilityType)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
