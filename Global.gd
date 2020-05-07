extends Node

var highScores = []
onready var died = load("res://assets/audio/die.wav")
	
func addScore(score):
	highScores.append(score)
	highScores.sort()
	highScores.invert()
	if highScores.size() > 5:
		highScores.pop_back()

func getHighScores():
	return highScores
	
func playDiedMusic():
	var music_file = "res://assets/audio/die.wav"
	var music_player = AudioStreamPlayer.new()
	if File.new().file_exists(music_file):
		var music = load(music_file)
		music_player.stream = music
		music_player.play()

	# below are optional steps if you need more control

	var music_bus_id = AudioServer.get_bus_count()
	AudioServer.add_bus()
	AudioServer.set_bus_name(music_bus_id,"music")
	# connects music to master bus
	AudioServer.set_bus_send(music_bus_id,"Master")

	add_child(music_player)
	music_player.bus = "music"

