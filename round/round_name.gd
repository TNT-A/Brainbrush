extends Node2D

@onready var icon_name = $CenterContainer/VBoxContainer/Name
@onready var icon_img = $Icon

func fade_in():
	#visible = true
	$AnimationPlayer.play("fade_in")

func fade_out():
	$AnimationPlayer.play("fade_out")
	#await get_tree().create_timer(.8).timeout
	#visible = false
