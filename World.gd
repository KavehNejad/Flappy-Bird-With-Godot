extends Node
export (PackedScene) var Barrier

onready var initialX = $Camera2D.position.x

func _ready():
	createWall()

func _physics_process(delta):
	$Camera2D.moveCamera()
	
	if int($Camera2D.position.x - initialX) % 500 == 0:
		createWall()
	
func createWall():
	var barrier = Barrier.instance()
	add_child(barrier)

