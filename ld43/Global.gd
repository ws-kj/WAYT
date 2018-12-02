extends Node

var save_path = "user://savegame.save"
var savegame = File.new()
	
var save_data = {"current_level": 1}
	
func _ready():
	if not savegame.file_exists(save_path):
		create_save()
	$AudioStreamPlayer.play()

func create_save():
	savegame.open(save_path, File.WRITE)
	savegame.store_var(save_data)
	savegame.close()
	
func save_level(level):
	save_data["current_level"] = level
	savegame.open(save_path, File.WRITE)
	savegame.store_var(save_data)
	savegame.close()
	
func read_savegame():
	savegame.open(save_path, File.READ)
	save_data = savegame.get_var()
	savegame.close()
	return save_data["current_level"]
	
