extends Control

var AbilityType

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func getAbilityType():
	return AbilityType


func setAbilityType(Type):
	AbilityType = Type


func setAbilityTypeToChildren():
	get_node("AbilityComponent").setAbilityType(AbilityType)
	get_node("AbilityTexture").setAbilityType(AbilityType)
