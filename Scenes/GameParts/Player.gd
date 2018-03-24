extends KinematicBody2D
var velocity = Vector2()
export var gravity = 400
export var jumpforce = 100
export var upbutton = 'ui_up'
export var downbutton = 'ui_up'
export var leftbutton = 'ui_up'
export var rightbutton = 'ui_up'
# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func _process(delta):
	velocity.y += gravity * delta
	for i in $Area2D.get_overlapping_bodies():
		if i.is_in_group('Block'):
			velocity.y = 0
	if Input.is_action_just_pressed('ui_up'):
		velocity.y = jumpforce
		Label.Text = 'jump'
	move_and_slide(velocity)