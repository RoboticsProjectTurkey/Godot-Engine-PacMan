extends CanvasLayer

func upgrade_score(var a):
	$Score/score_label.text = str(a)

func uppgrade_health(var a):
	$Health/health_label.text = "(" + str(a) + ")"
	$Health/health_bar.value = a
