extends TextureButton

var AbilityType

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_pressed():
	GlobalVars.AbilityUsed.emit(AbilityType)
	print("ccc")


func setAbilityType(Type):
	AbilityType = Type
