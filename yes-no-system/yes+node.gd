extends Control

var color : String = "Blue"

func _on_button_pressed() -> void:
	color = "Blue"
	SignalBus.button_pressed.emit(color)

func _on_button_2_pressed() -> void:
	color = "Red"
	SignalBus.button_pressed.emit(color)

func _on_button_3_pressed() -> void:
	color = "Yellow"
	SignalBus.button_pressed.emit(color)

func _on_button_4_pressed() -> void:
	color = "Orange"
	SignalBus.button_pressed.emit(color)

func _on_button_5_pressed() -> void:
	color = "Green"
	SignalBus.button_pressed.emit(color)

func _on_button_6_pressed() -> void:
	color = "Purple"
	SignalBus.button_pressed.emit(color)

func slide_down():
	$AnimationPlayer.play("slide_down")

func slide_up():
	$AnimationPlayer.play("slide_up")
	visible = true
