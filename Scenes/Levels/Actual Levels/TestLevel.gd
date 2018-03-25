extends Node2D
export var gravity = 2000 #Acceleration due to gravity in pixels/second^2
export var jumpbonus = .5 #Percentage of gravity used when jump is held
export var jumpforce = 500
export var walkspeed = 300
export var aircontrol = 400
export var bouncespeed = 400
export var drainspeed = 1 #Pixels drained per second

func _ready():
	pass

#func _process(delta):