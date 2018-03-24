extends TextureProgress
export var thisbar = 1
var full = load('res://Assets/Temp/tempfull.png')
var fill = load('res:///Assets/Temp/tempfill.png')
# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func draw(currentbar, barvalue):
	if currentbar == thisbar:
		value = barvalue
		texture_progress = fill
	elif currentbar < thisbar:
		value = 0
		texture_progress = fill
	elif currentbar > thisbar:
		value = 4
		texture_progress = full