extends Node2D

func _on_button_monster_color_pressed() -> void:
	SignalBus.reset_game.emit()
