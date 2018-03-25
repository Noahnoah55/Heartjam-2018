extends Control
var currentbar = 5
var drainspeed = 1
var timesince = 0
var barvalue = 4
var player
signal death
# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	var level = get_node('/root/Camera/Level')
	drainspeed = level.drainspeed

func drawbars():
	$Bar1.draw(currentbar, barvalue)
	$Bar2.draw(currentbar, barvalue)
	$Bar3.draw(currentbar, barvalue)
	$Bar4.draw(currentbar, barvalue)
	$Bar5.draw(currentbar, barvalue)

func drainbar():
	barvalue -= 1
	if barvalue < 0:
		barvalue = 4
		currentbar -= 1
	if currentbar <= 0:
		emit_signal("death")
		
func fillbar(amt):
	currentbar += amt
	barvalue = 0
	if currentbar > 6:
		currentbar = 6
	drawbars()

func bigdrain():
	currentbar -= 1
	if currentbar <= 0:
		emit_signal("death")

func _process(delta):
	timesince += drainspeed * delta
	if timesince >= 1:
		timesince -= 1
		drainbar()
	drawbars()