extends Area2D
var c
var velocity = Vector2()
var facing = Vector2()
export var speed = 800
# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	velocity += speed * facing

func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
	position += velocity * delta
	$Label.text = String(get_groups())

	c = get_overlapping_bodies()
	for i in range(0, c.size()):
		if c[i].is_in_group('Player'):
			queue_free()
		if c[i].is_in_group('Block'):
			queue_free()