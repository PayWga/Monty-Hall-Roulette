extends Node



var Door = preload("res://Scenes/Prefabs/Door.tscn")
var offset = Vector2(-550, -150)
var generator = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	var doorInstance
	var doorPool = generatePool()
	for  door in doorPool:
		match door:
			GlobalVars.DoorTypes.DEATH_DOOR:
				doorInstance = Door.instantiate()
				doorInstance.position = offset
				doorInstance.setDoorType(door)
				add_child(doorInstance)
				doorInstance.setDoorTypeToChildren()
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
	var doorPoolSize = getDoorCount(GlobalVars.playerScore)
	print(doorPoolSize)
	var doorPool = []
	var randVal = randf()
	var emptyDoorProbability = 1.0 - getGoodDoorVariantProbability(GlobalVars.playerScore)
	var lootDoorProbability = getGoodDoorVariantProbability(GlobalVars.playerScore)
	var monsterDoorProbability = max(0.3, getBadDoorVariantProbability(GlobalVars.playerScore, GlobalVars.monsterDoorsOpened / GlobalVars.monsterDoorsSpawned))
	var deathDoorProbability = 1 - monsterDoorProbability
	for i in range(2, doorPoolSize):
		if randVal > GlobalVars.badDoorProbability:
			randVal = randf()
			if randVal < emptyDoorProbability:
				doorPool.append(GlobalVars.DoorTypes.EMPTY_DOOR)
			else:
				doorPool.append(GlobalVars.DoorTypes.LOOT_DOOR)
		else:
			randVal = randf()
			if randVal < monsterDoorProbability:
				doorPool.append(GlobalVars.DoorTypes.MONSTER_DOOR)
				GlobalVars.monsterDoorsSpawned += 1.0
			else:
				doorPool.append(GlobalVars.DoorTypes.DEATH_DOOR)
	randVal = randf()
	if randVal < monsterDoorProbability:
		doorPool.append(GlobalVars.DoorTypes.MONSTER_DOOR)
		GlobalVars.monsterDoorsSpawned += 1.0
	else:
		doorPool.append(GlobalVars.DoorTypes.DEATH_DOOR)
	if randVal < emptyDoorProbability:
		doorPool.append(GlobalVars.DoorTypes.EMPTY_DOOR)
	else:
		doorPool.append(GlobalVars.DoorTypes.LOOT_DOOR)
	return doorPool

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func getBadDoorVariantProbability(currentScore, monsterDoorCoefficient):
	var a = 5.0
	var b = 0.5
	var term1 = 1.0 / (1.0 + exp(-a * (monsterDoorCoefficient - b)))
	var term2 = 1.0 / (1.0 + exp(-b * (currentScore - a)))
	return term1 * term2


func getGoodDoorVariantProbability(currentScore):
	return 1.0/(1.0 + exp(-0.05 *(currentScore - 7)))


func getDoorCount(currentScore):
	var baseFunc = floor(8 * 1.0 / (1.0 + exp(-0.05 * (currentScore - 10))))
	var upJumpProbability = 0.6 * (1.0 - exp(-currentScore))
	var downJumpProbability = 0.6 * (1.0 - exp(-0.05 * currentScore))
	var rand_val = randf()
	min(baseFunc, 6)
	if rand_val < upJumpProbability:
		return baseFunc + 1
	elif rand_val < upJumpProbability + downJumpProbability:
		return max(3, baseFunc - 1)
	else:
		return baseFunc
