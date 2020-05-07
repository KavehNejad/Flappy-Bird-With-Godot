extends Node2D

var Global = null

func _ready():
	var Global = get_node("/root/Global")
	var text = "HIGH SCORES"
	for score in Global.getHighScores():
		text += "\n" + String(score)
	$Label.text = text
	$Label.show()

func _physics_process(delta):
	if Input.is_action_pressed("ui_accept"):
		changeWorld()

func _on_StartButton_pressed():
	changeWorld()
	
func changeWorld():
	get_tree().change_scene("World.tscn")
	

