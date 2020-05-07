extends Camera2D
const CAMERA_SPEED = 5

onready var y = get_viewport().size.y / 2
onready var x = get_viewport().size.x / 2 - 100


func _ready():
	make_current()
	set_offset(Vector2(x, y))

func moveCamera():
	position.x += CAMERA_SPEED

