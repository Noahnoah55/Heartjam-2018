extends KinematicBody2D
var jumpforce
var walkspeed
var aircontrol
var jumpbonus
var gravity
var bouncespeed
var velocity = Vector2()
var prepos
export var jumpbutton = 'ui_jump'
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
var lastx = 0

func _ready():
	jumpforce = get_node('/root/Level').jumpforce
	walkspeed = get_node('/root/Level').walkspeed
	aircontrol = get_node('/root/Level').aircontrol
	jumpbonus = get_node('/root/Level').jumpbonus
	gravity = get_node('/root/Level').gravity
	bouncespeed = get_node('/root/Level').bouncespeed

func _process(delta):
	direction = Vector2()
	facing = Vector2()
	isonground = false
	if Input.is_action_pressed(jumpbutton):
		velocity.y += gravity * delta
	else:
		velocity.y += gravity * delta * jumpbonus
	b = $Floor.get_overlapping_bodies()
	for i in range(0, b.size()):
		if b[i].is_in_group('Block'):
			velocity.y = 0
			jumpsleft = 2
			isonground = true
		if b[i].is_in_group('Player'):
			if b[i] != self:
				velocity.y = -bouncespeed
			
	if Input.is_action_just_pressed(jumpbutton):
		if jumpsleft > 0:
			velocity.y = -jumpforce
			jumpsleft -= 1
	if Input.is_action_pressed(leftbutton):
		direction.x -= 1
		facing.x = -1
		lastx = -1
	if Input.is_action_pressed(rightbutton):
		direction.x += 1
		facing.x
		lastx = 1
	if Input.is_action_pressed(upbutton):
		facing.y = -1
	elif Input.is_action_pressed(downbutton):
		facing.y = 1
	else:
		facing.x = lastx


	velocity.x = direction.x * walkspeed
	prepos = position
	move_and_slide(velocity)
	velocity = (position - prepos)/delta
	if debug:
#		$Label.text = String(velocity) + String(isonground) + String(facing)
		pass