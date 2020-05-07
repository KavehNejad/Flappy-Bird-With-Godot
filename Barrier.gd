extends Node


onready var SCREEN_Y_SIZE = int(get_viewport().size.y)

const GAP_SIZE =200
const X_OFFSET = 1000
const SPRITE_SIZE = 64
const SPRITE_SCALE = 8
const SPRITE_HEIGHT = SPRITE_SIZE * SPRITE_SCALE

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	var xPosition = X_OFFSET + get_node("/root/World/Camera2D").position.x
	var gapPosition = randi() % SCREEN_Y_SIZE
	var top = $Top
	var bottom = $Bottom
	
	var topLowestPoint = gapPosition - GAP_SIZE/2
	var bottomHghestPoint = gapPosition + GAP_SIZE/2
	top.position.y = topLowestPoint - SPRITE_HEIGHT/2
	bottom.position.y = bottomHghestPoint + SPRITE_HEIGHT/2
	
	top.position.x = xPosition
	bottom.position.x = xPosition

func _physics_process(delta):
	if $Top.position.x < get_node("/root/World/Camera2D").position.x - 100:
		queue_free()
