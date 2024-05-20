extends Node

var doorSpawner = preload("res://Scenes/Prefabs/DoorsScene.tscn")
var doors
var spawnerPos = Vector2(0,0)

# Called when the node enters the scene tree for the first time.
func _ready():
	%DoorsContainer.queue_free()
	GlobalVars.DoorOpened.connect(on_door_opened)
	GlobalVars.AbilityUsed.connect(on_ability_used)
	doors = doorSpawner.instantiate()
	add_child(doors)
	 # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func on_door_opened(DoorType):
	match DoorType:
		GlobalVars.DoorTypes.EMPTY_DOOR:
			OpenEmptyDoor()
		GlobalVars.DoorTypes.LOOT_DOOR:
			OpenLootDoor()
		GlobalVars.DoorTypes.MONSTER_DOOR:
			OpenMonsterDoor()
			GlobalVars.monsterDoorsOpened += 1.0
		GlobalVars.DoorTypes.DEATH_DOOR:
			OpenDeathDoor()


func on_ability_used(AbilityType):
	match AbilityType:
		GlobalVars.AbilityTypes.MONTY_HALL:
			UseMontyHall()
		GlobalVars.AbilityTypes.REVEAL:
			UseReveal()
		GlobalVars.AbilityTypes.DESTRUCTION:
			UseDestruction()
		GlobalVars.AbilityTypes.KEY:
			UseKey()


func OpenEmptyDoor():
	GlobalVars.playerScore += 1
	%Score.set_text(str(GlobalVars.playerScore))
	print(GlobalVars.playerScore)
	print("aaa")
	doors.queue_free()
	doors = doorSpawner.instantiate()
	add_child(doors)


func OpenLootDoor():
	GlobalVars.playerScore += 1
	%Score.set_text(str(GlobalVars.playerScore))
	print(GlobalVars.playerScore)
	print("aaa")
	doors.queue_free()
	doors = doorSpawner.instantiate()
	add_child(doors)


func OpenMonsterDoor():
	print("Fail!")
	GlobalVars.playerScore = 0
	get_tree().reload_current_scene()


func OpenDeathDoor(): 
	print("Fail!")
	GlobalVars.playerScore = 0
	get_tree().reload_current_scene()


func UseMontyHall():
	pass


func UseReveal():
	pass


func UseKey():
	pass


func UseDestruction():
	pass
