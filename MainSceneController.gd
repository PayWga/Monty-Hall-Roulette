extends Node

var doorSpawner = preload("res://DoorsScene.tscn")
var doors
var spawnerPos = Vector2(0,0)

# Called when the node enters the scene tree for the first time.
func _ready():
	GlobalVars.goodDoorOpened.connect(on_good_door_opened)
	GlobalVars.badDoorOpened.connect(on_bad_door_opened)
	%DoorsContainer.queue_free()
	doors = doorSpawner.instantiate()
	add_child(doors)
	 # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func on_good_door_opened(loot:int):
	%"Score".set_text(str((int)(%"Score".text) + 1))
	print("aaa")
	doors.queue_free()
	doors = doorSpawner.instantiate()
	add_child(doors)


func on_bad_door_opened(monster:bool):
	print("Fail!")
	get_tree().reload_current_scene()
