extends Node

enum DoorTypes {EMPTY_DOOR, LOOT_DOOR, MONSTER_DOOR, DEATH_DOOR}

var playerScore = 0

signal DoorOpened(DoorType)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
