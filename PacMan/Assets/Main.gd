extends Node2D

var ghost = 0
onready var main = get_tree().get_current_scene()

func _on_Timer_timeout():
	if ghost == 0:
		main.get_node("Ghost1").lock = false
		$Timer.start()
	elif ghost == 1:
		main.get_node("Ghost2").lock = false
		$Timer.start()
	elif ghost == 2:
		main.get_node("Ghost3").lock = false
		$Timer.start()
	elif ghost == 3:
		main.get_node("Ghost4").lock = false
		$Timer.stop()
	ghost += 1
