extends Node2D
signal done

func _ready():
	pass

func _process(delta):
	if Input.is_action_just_pressed('ui_accept'):
		emit_signal('done')