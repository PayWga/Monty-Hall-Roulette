extends Control

var AbilityType
var ChargeCount

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func getAbilityType():
	return AbilityType


func setAbilityType(abilityType):
	AbilityType = abilityType


func adjustChargeCount(delta):
	ChargeCount += delta
