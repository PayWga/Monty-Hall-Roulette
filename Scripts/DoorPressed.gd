extends TextureButton

var DoorType

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func setDoorType(Type):
	DoorType = Type


func _on_pressed():
	GlobalVars.DoorOpened.emit(DoorType)
	print("www")
