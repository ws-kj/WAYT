extends Sprite

var entered = false

func _ready():
	pass
#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass


func _on_Area2D_area_entered(area):
	if !entered && $Area2D.get_overlapping_areas()[0].get_parent() != get_parent():
		if  $Area2D.get_overlapping_areas()[0].get_parent().get_name() == "Player":
			entered = true
			$Timer.connect("timeout", self, "destroy")
			$Timer.start()
		
		
func destroy():
	self.queue_free()
#	hide()
#	set_process(false)
