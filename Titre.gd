extends Node

func _input(event):
	if event.is_pressed():
		get_tree().change_scene("res://Intro.tscn")

#func _process(delta):
#	if Input.is_action_pressed("ui_s"):
#		get_tree().change_scene("res://Intro.tscn")
#	pass
