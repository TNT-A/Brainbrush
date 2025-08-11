extends Node2D

var good : bool

var good_list : Array = [
	preload("res://sprites/paint/green-splatter-1-624x521.png"),
	preload("res://sprites/paint/green-splatter-3-624x473.png"),
	preload("res://sprites/paint/green-splatter-5-624x620.png"),
	preload("res://sprites/paint/green-splatter-8-624x494.png"),
	preload("res://sprites/paint/green-splatter-9-624x407.png")
]

var bad_list : Array = [
	preload("res://sprites/paint/red-splatter-1.png"),
	preload("res://sprites/paint/red-splatter-4-624x643.png"),
	preload("res://sprites/paint/red-splatter-5-1-624x502.png"),
	preload("res://sprites/paint/red-splatter-6-624x408.png"),
	preload("res://sprites/paint/red-splatter-10-1-624x517.png"),
]

func _ready() -> void:
	var rand_sprite 
	var sprite_num : int = randi_range(0,4)
	if good:
		rand_sprite = good_list[sprite_num]
		print("good ", sprite_num)
	elif !good:
		rand_sprite = bad_list[sprite_num]
		print("bad ", sprite_num)
	var rand_scale = randf_range(1.2, 2.4)
	var rand_pos = Vector2(randf_range(10, 1142), randf_range(20, 620))
	var rand_rot = randf_range(0, 360)
	$Sprite2D.scale = Vector2(rand_scale, rand_scale)
	$Sprite2D.global_position = rand_pos
	$Sprite2D.rotation = rand_rot
	$Sprite2D.texture = rand_sprite
	$AnimationPlayer.play("spawn")
