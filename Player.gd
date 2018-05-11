extends KinematicBody2D

#signal hit
#func _ready():
#	$Area2D.connect("area_entered", self, "_on_Area_entered")

const UP = Vector2(0, -1)

var GRAVITY = 20
const SPEED = 50
const JUMP_HEIGHT = -280

var motion = Vector2()
var on_ladder = false
var contact = false

func _physics_process(delta):

	motion.y += GRAVITY
	
	print ("y :")
	print (position.y)
	print ("x :")
	print (position.x)
	
	if Input.is_action_pressed("ui_right"):
		motion.x = SPEED
		$Sprite.flip_h = false
		$Sprite.play("Run")	
		
	elif Input.is_action_pressed("ui_left"):
		motion.x = - SPEED
		$Sprite.flip_h = true
		$Sprite.play("Run")	
	elif on_ladder == false:
		motion.x = 0
		$Sprite.play("Idle")
	
	if is_on_floor() :
		if Input.is_action_just_pressed("ui_up"):
			motion.y = JUMP_HEIGHT
	motion = move_and_slide(motion, UP)
	
	# LADDER
	var tilemap = get_parent().get_node("TileMap2")
	
	if not tilemap == null:
		var map_pos = tilemap.world_to_map(position)
		var id = tilemap.get_cellv(map_pos)
		if id > -1:
			if tilemap.get_tileset().tile_get_name(id) == "ladder":
				on_ladder = true
				#left_tile = (TileMap2.get_cellv(TileMap2.world_to_map(pos)))
			else:
				on_ladder = false
		else:
			on_ladder = false
	if on_ladder == true:
		if Input.is_action_pressed("ui_up"):
			pass
			if position.x >= 200:
				position.x = 263
				print (position.x)
			else:
				position.x = 200
			motion.y = -80
			$Sprite.play("Climb")
			
		else:
			motion.x = 0
			$Sprite.play("Idle")
			
	if contact == true:
		#print("contact effectue")
		position.y = 52
		position.x = 151
		contact = false

func _on_TEST_body_entered(body):
	contact = true

func _on_robot_body_entered(body):
	get_tree().reload_current_scene()
