extends Node

var doorSpawner = preload("res://DoorsScene.tscn")
var spawnerPos = Vector2(0,0)

# Called when the node enters the scene tree for the first time.
func _ready():
	self.connect("goodDoorOpened", on_good_door_opened(0))
	%DoorsContainer.free()
	doorSpawner.instantiate() # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func on_good_door_opened(loot):
	#%"Score".text = (int)(%"UI/Top Menu/Score".text) + 1
	#doorSpawner.free()
	doorSpawner.instantiate()
