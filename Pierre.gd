extends KinematicBody2D


var motion = Vector2()
var speed = 200
var GRAVITY = 2
var addition = 1

func _physics_process(delta):
	move_and_collide(motion * delta)
	motion.y += GRAVITY
#	var direction = ($Player.position - position).normalized()
#	var motion = direction * SPEED * delta
#	position += motion



