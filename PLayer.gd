extends Area2D
signal giveScore(score)
var Global = null

const SPEED = 5
const GRAVITY = 3
const MAX_FALL_SPEED = 8
const JUMP_DECREASE = 2
const MIN_JUMP_SPEED = 5
const JUMP_SPEED = -20

var yMovement = GRAVITY
var jumping


func _ready():
	Global = get_node("/root/Global")
	position.y = get_viewport().size.y / 2
	
	
func _physics_process(delta):
	position.x += SPEED
	
	if Input.is_action_just_pressed("ui_accept"):
		jumping = true
		yMovement = JUMP_SPEED
		$AnimatedSprite.play("up")
		$Wing.play()
		
	if jumping:
		$AnimatedSprite.play("midFlap")
		yMovement = move_toward(yMovement, MIN_JUMP_SPEED, JUMP_DECREASE)
		if yMovement == MIN_JUMP_SPEED:
			jumping = false
	else:
		$AnimatedSprite.play("down")
		yMovement = move_toward(yMovement, MAX_FALL_SPEED, GRAVITY)
	
	position.y += yMovement
	
	if position.y > get_viewport().size.y:
		lost()

func _on_Player_body_entered(body):
	lost()
	
func lost():
	Global.playDiedMusic()
	Global.addScore(position.x)
	get_tree().change_scene("Menu.tscn")
