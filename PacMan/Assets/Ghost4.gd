extends KinematicBody2D

var path = []
var velocity = Vector2.ZERO
var speed = 100
var last_position

var lock = true

onready var player = get_tree().get_current_scene().get_node("Player")
onready var line2d = get_tree().get_current_scene().get_node("Lines/Line2D4")
onready var navigation2d = get_tree().get_current_scene().get_node("Navigation2D")

func _physics_process(delta):
	if path.size()>1:
		var pos_to_move = path[0]
		velocity = (pos_to_move-position).normalized()
		var distance = position.distance_to(path[0])
		if(distance>1):
			position += speed * velocity * delta
		else:
			path.remove(0)
	elif lock == false:
		find_path()


func find_path():
	path = navigation2d.get_simple_path(position,player.position,false)
	line2d.points = path
	last_position = path[0]
	path.remove(0)
