extends Control

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass


func _on_New_pressed():
	get_node("/root/Global").save_level(1);
	get_tree().change_scene("res://levels/level1.tscn")


func _on_Continue_pressed():
	get_tree().change_scene("res://levels/level" + str(get_node("/root/Global").read_savegame()) + ".tscn")


func _on_Exit_pressed():
	get_tree().quit()
