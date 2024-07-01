extends Camera2D

var target_position: Vector2
var score_target_position: Vector2

# Target zoom level for the camera
var target_zoom: Vector2
var score_target_zoom: Vector2

# Speed at which the camera moves
var move_speed: float = 250.0

# Speed at which the camera zooms
var zoom_speed: float = 2.0

var score_x_offset = -5

# Reference to the Camera2D node
var camera = self

var direction
var score_direction
var distance
var score_distance
var zoom_direction
var score_zoom_direction
var zoom_distance
var score_zoom_distance


var needCameraMovement: bool = false
var lastDoorCount: int = 3

# Called when the node enters the scene tree for the first time.
func _ready():
	GlobalVars.DoorsSpawned.connect(doors_spawned)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	direction = (target_position - global_position).normalized()
	score_direction = (score_target_position - %Score.position).normalized()
	distance = global_position.distance_to(target_position)
	score_distance = %Score.position.distance_to(score_target_position)
	if distance > 1:
		global_position += direction * min(distance, move_speed * delta)
	if score_distance > 0.001:
		%Score.position += score_direction * min(score_distance, move_speed * delta)
	
	
	zoom_direction = (target_zoom - camera.zoom).normalized()
	score_zoom_direction = (score_target_zoom - %Score.scale).normalized()
	zoom_distance = camera.zoom.distance_to(target_zoom)
	score_zoom_distance = %Score.scale.distance_to(score_target_zoom)
	if zoom_distance > 0.01:
		camera.zoom += zoom_direction * min(zoom_distance, zoom_speed * delta)
	if score_zoom_distance > 0.01:
		%Score.scale += score_zoom_direction * min(score_zoom_distance, zoom_speed * delta)



func doors_spawned(DoorCount):
	match(DoorCount):
		3:
			target_position = Vector2(0, 30)
			score_target_position = Vector2(score_x_offset, -120)
			target_zoom = Vector2(1, 1)
			score_target_zoom = Vector2(1, 1)
		4:
			target_position = Vector2(195, 30)
			score_target_position = Vector2(score_x_offset, -150)
			target_zoom = Vector2(0.75, 0.75)
			score_target_zoom = Vector2(1.15, 1.15)
		5:
			target_position = Vector2(380, 30)
			score_target_position = Vector2(score_x_offset + 2, -180)
			target_zoom = Vector2(0.55, 0.55)
			score_target_zoom = Vector2(1.35, 1.35)
		6:
			target_position = Vector2(585, 30)
			score_target_position = Vector2(score_x_offset, -210)
			target_zoom = Vector2(0.45, 0.45)
			score_target_zoom = Vector2(1.55, 1.55)
		7:
			target_position = Vector2(795, 30)
			score_target_position = Vector2(score_x_offset - 4, -240)
			target_zoom = Vector2(0.4, 0.4)
			score_target_zoom = Vector2(1.75, 1.75)
	if GlobalVars.playerScore >= 9:
		score_x_offset = -10
