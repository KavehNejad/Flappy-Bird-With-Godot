extends StaticBody2D

onready var SCREEN_Y_SIZE = get_viewport().size.y

const GAP = 60


func _ready():
	var gapPosition = randi() % SCREEN_Y_SIZE
	var topCenter = (SCREEN_Y_SIZE - (SCREEN_Y_SIZE - gapPosition - GAP / 2))/2 
	
	
	$Top_Sprite.offset = Vector2()
