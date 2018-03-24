extends KinematicBody2D
var velocity = Vector2()
export var gravity = 500
export var jumpforce = 300
export var walkspeed = 300
export var aircontrol = 400
export var upbutton = 'ui_up'
export var downbutton = 'ui_down'
export var leftbutton = 'ui_left'
export var rightbutton = 'ui_right'
export var fire = 'ui_fire'
var direction = Vector2()
var throw = 0
var b = 0
var jumpsleft = 2
var isonground = false
export var debug = true
var facing = Vector2()

func _ready():
	pass

func _process(delta):
	direction = Vector2()
	isonground = false
	velocity.y += gravity * delta
	b = $Area2D.get_overlapping_bodies()
	for i in range(0, b.size()):
		if b[i].is_in_group('Block'):
			velocity.y = 0
			jumpsleft = 2
			isonground = true
	if Input.is_action_just_pressed(upbutton):
		if jumpsleft > 0:
			velocity.y = -jumpforce
			jumpsleft -= 1
	if Input.is_action_pressed(leftbutton):
		direction.x -= 1
		facing.x
	if Input.is_action_pressed(rightbutton):
		direction.x += 1
	velocity.x = direction.x * walkspeed
	move_and_slide(velocity)
	if debug:
		$Label.text = String(velocity) + String(isonground)