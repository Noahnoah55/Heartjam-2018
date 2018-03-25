extends Node2D
var currentlevel = 2
signal levelpicked(currentlevel)
# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func _process(delta):
	if Input.is_action_just_pressed('ui_left') or Input.is_action_just_pressed('ui_left2'):
		currentlevel -= 1
	if Input.is_action_just_pressed('ui_right') or Input.is_action_just_pressed('ui_right2'):
		currentlevel += 1
	if currentlevel > 3:
		currentlevel = 1
	if currentlevel < 1:
		currentlevel = 3
	if Input.is_action_just_pressed('ui_fire') or Input.is_action_just_pressed('ui_fire2') or Input.is_action_just_pressed('ui_jump') or Input.is_action_just_pressed('ui_jump2') or Input.is_action_just_pressed('ui_accept'):
		emit_signal('levelpicked',currentlevel)
	drawlevels()
		
func drawlevels():
	$Level1/Selected.play('Deselected')
	$Level2/Selected.play('Deselected')
	$Level3/Selected.play('Deselected')
	if currentlevel == 1:
		$Level1/Selected.play('Selected')
	if currentlevel == 2:
		$Level2/Selected.play('Selected')
	if currentlevel == 3:
		$Level3/Selected.play('Selected')