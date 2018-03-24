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
var facing = Vector2(1,0)
var lastx = 1
export (PackedScene) var bullet
var level
var dead
var d
export var playernumber = '1'
func _ready():
	level = get_node('/root/Level')
	jumpforce = get_node('/root/Level').jumpforce
	walkspeed = get_node('/root/Level').walkspeed
	aircontrol = get_node('/root/Level').aircontrol
	jumpbonus = get_node('/root/Level').jumpbonus
	gravity = get_node('/root/Level').gravity
	bouncespeed = get_node('/root/Level').bouncespeed
	if int(playernumber) > 1:
		jumpbutton += playernumber
		upbutton += playernumber
		downbutton += playernumber
		leftbutton += playernumber
		rightbutton += playernumber
		fire += playernumber

func squirt():
	var new_bullet = bullet.instance()
	new_bullet.position = self.position + Vector2(facing.x * 16, facing.y * 16)
	new_bullet.facing = facing
	new_bullet.add_to_group(playernumber)
	level.add_child(new_bullet)

func hit():
	dead = true
	$tempchar.play('DEAD')

func _process(delta):
	$Label.text = ''
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
			jumpsleft = 1
			isonground = true
		if b[i].is_in_group('Player'):
			if b[i] != self:
				velocity.y = -bouncespeed
				jumpsleft = 1
	d = $Hitbox.get_overlapping_areas()
	for i in range(0, d.size()):
		$Label.text += String(d[i].get_groups())
		if d[i].is_in_group('Bullet'):
			$Label.text = 'Registered'
			if d[i].is_in_group(playernumber) == false:
				$Label.text = 'Hit'
				hit()
	if not dead:
		if Input.is_action_just_pressed(jumpbutton):
			if jumpsleft > 0:
				velocity.y = -jumpforce
				if isonground == false:
					jumpsleft -= 1
		if Input.is_action_pressed(leftbutton):
			direction.x -= 1
			facing.x = -1
			lastx = -1
		if Input.is_action_pressed(rightbutton):
			direction.x += 1
			facing.x = 1
			lastx = 1
		if Input.is_action_pressed(upbutton):
			facing.y = -1
		elif Input.is_action_pressed(downbutton):
			facing.y = 1
		else:
			facing.x = lastx
		if Input.is_action_just_pressed(fire):
			squirt()

	velocity.x = direction.x * walkspeed
	prepos = position
	if not dead:
		move_and_slide(velocity)
	velocity = (position - prepos)/delta
	if debug:
#		$Label.text = String(velocity) + String(isonground) + String(facing)
		pass