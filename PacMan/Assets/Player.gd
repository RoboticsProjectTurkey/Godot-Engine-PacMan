extends KinematicBody2D

var speed = 150
var last_velocity = Vector2.ZERO

var score = 0
var health = 5
onready var main = get_tree().get_current_scene()

func _ready():
	main.get_node("HUD").upgrade_score(score)
	main.get_node("HUD").upgrade_health(health)

func _physics_process(delta):
	var velocity = Vector2.ZERO
	if Input.is_action_just_pressed("ui_up"):
		velocity.y += -1
	elif Input.is_action_just_pressed("ui_down"):
		velocity.y += 1
	elif Input.is_action_just_pressed("ui_right"):
		velocity.x += 1
	elif Input.is_action_just_pressed("ui_left"):
		velocity.x += -1
	else:
		velocity = last_velocity
	animation(velocity)
	move_and_slide(velocity * speed)
	last_velocity = velocity

func animation(var a):
	if a == Vector2(1,0):
		$AnimatedSprite.rotation_degrees = 0
	elif a == Vector2(-1,0):
		$AnimatedSprite.rotation_degrees = 180
	elif a == Vector2(0,1):
		$AnimatedSprite.rotation_degrees = 90
	elif a == Vector2(0,-1):
		$AnimatedSprite.rotation_degrees = 270

func _on_Money_Area_body_entered(body):
	#print(body.get_cellv(body.world_to_map(position)))
	body.set_cellv(body.world_to_map(position),9)
	score += 1
	main.get_node("HUD").upgrade_score(score)


func _on_Dead_Area_body_entered(body):
	health += -1
	main.get_node("HUD").upgrade_health(health)
