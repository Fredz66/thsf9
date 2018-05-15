extends Area2D

#var rotation_dir = 4
var rotation_dir = 2

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func _process(delta):
	$Sprite.rotation_degrees += rotation_dir
	
	if $Sprite.rotation_degrees < -30:
		$Sprite.rotation_degrees = -30
		rotation_dir = -rotation_dir
	elif $Sprite.rotation_degrees > 30:
		$Sprite.rotation_degrees = 30
		rotation_dir = -rotation_dir
	pass