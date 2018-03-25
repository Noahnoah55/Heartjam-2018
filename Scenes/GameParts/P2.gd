extends Sprite
export (PackedScene) var LevelSelect

func _ready():
	pass
	
func _process(delta):
	if Input.is_action_just_pressed('ui_accept'):
		var LSelect = LevelSelect.instance()
		get_node('/root/Camera').add_child(LSelect)
		LSelect.connect('levelpicked',get_node('/root/Camera'),'_on_LevelSelect_Selected')
		self.queue_free()