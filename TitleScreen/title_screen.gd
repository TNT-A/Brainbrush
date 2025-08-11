extends Node2D

func _on_button_eye_pressed() -> void:
	open_main("Eyes")

func _on_button_monster_color_pressed() -> void:
	open_main("Colors")

var main = preload("res://main/main.tscn")
func open_main(test):
	$AnimationPlayer.play("fade_out")
	await get_tree().create_timer(.8).timeout
	SignalBus.start_test.emit(test)
