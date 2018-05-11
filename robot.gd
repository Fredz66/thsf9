extends Area2D


#var motion = Vector2()

#var GRAVITY = 3
#var addition = 1

func _physics_process(delta):
#	move_and_collide(motion * delta)
#	motion.y += GRAVITY
	position.x = position.x +1
	$Sprite.play("Run")
	
	
	if position.x > 157 && position.x< 168:
		position.y = 172
	else:
			position.y = 182
	


# This function will be called by the `body_enter` signal.
# The body parameter is the node that touched the area.
#func _on_Enemy_body_enter(body):
#    if body.get_name() == "Player":
#        body.kill()