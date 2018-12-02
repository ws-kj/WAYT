extends Node

export var levelNum = 1


func _ready():
	print(levelNum)
	get_node("/root/Global").save_level(levelNum)
	
	
func restartLevel():
	get_tree().change_scene("res://levels/level" + str(levelNum) + ".tscn")
#	for b in get_node("Blocks").get_children():
#		b.show()
#		b.set_process(true)
		
#	get_node("Player").position = get_node("Start").position;

func _process(delta):
	if Input.is_key_pressed(KEY_R):
		get_tree().change_scene("res://levels/level" + str(levelNum) + ".tscn")
	
	if Input.is_key_pressed(KEY_L) && Input.is_key_pressed(KEY_Y):
		get_tree().change_scene("res://levels/level7.tscn")
		
	updateUI()

func updateUI():
	get_node("GUI/LevelLabel").text = "Level " + str(levelNum)	

func nextLevel():
	get_tree().change_scene("res://levels/level" + str(levelNum + 1) + ".tscn")
