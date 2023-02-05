extends CanvasLayer

onready var sprite = get_tree().get_current_scene().get_node("Player/AnimatedSprite")

func upgrade_score(var a):
	$Score/score_label.text = str(a)

func upgrade_health(var a):
	$Health/health_label.text = "(" + str(a) + ")"
	$Health/health_bar.value = a
	if a == 4:
		get_tree().paused = true
		sprite.animation = "dead"

func _on_exit_button_pressed():
	get_tree().quit()

func _on_restart_button_pressed():
	get_tree().change_scene_to(load("res://Assets/Main.tscn"))


func _on_AnimatedSprite_animation_finished():
	if sprite.animation == "dead":
		sprite.playing = false
		$Header/Label.text = "GAME OVER"
		$menu.show()

