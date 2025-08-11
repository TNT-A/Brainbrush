extends Node2D

@onready var paint_scene = preload("res://paint/paint_splash.tscn")

var test_started : bool = false
var val : int = 0

var sets : Dictionary = {
	"Colors" = preload("res://question_set_resources/resources/Colors.tres"),
	"Eyes" = preload("res://question_set_resources/resources/Eyes.tres"),
}

var resource : Resource
var prompt_list : Array
var answer_list : Array

func _ready() -> void:
	SignalBus.start_test.connect(start_test)
	SignalBus.button_pressed.connect(check_win)
	$"Yes+Node".visible = false

func start_test(type):
	$Label.text = "Round " + str(val+1)
	print(type)
	if !test_started:
		resource = sets[type]
		print(resource)
		$RoundName.icon_img.texture = resource.icon_symbol
		$RoundName.icon_name.text = resource.icon_text
		prompt_list = resource.prompt_list
		answer_list = resource.answer_list
		print("Oh yea!")
	$"Yes+Node".slide_up()
	$RoundName.fade_in()

func check_win(color_guess):
	if val < len(answer_list) - 1:
		if answer_list[val] == color_guess:
			var new_paint = paint_scene.instantiate()
			new_paint.good = true
			$PaintCanvas.add_child(new_paint)
			val += 1
			next_question()
		else:
			var new_paint = paint_scene.instantiate()
			new_paint.good = false
			$PaintCanvas.add_child(new_paint)
		$Label.text = "Round " + str(val+1)
	else:
		SignalBus.game_won.emit()
		val = 0
		for child in $PaintCanvas.get_children():
			child.queue_free()

func next_question():
	$RoundName.fade_out()
	$"Yes+Node".slide_down()
	await get_tree().create_timer(.8).timeout
	if val < len(prompt_list):
		$RoundName.fade_in()
		$"Yes+Node".slide_up()
		$RoundName/Icon.texture = prompt_list[val] 

func set_image():
	pass
