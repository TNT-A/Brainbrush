extends Node2D

var test_started : bool = false

func _ready() -> void:
	SignalBus.start_test.connect(start_test)
	SignalBus.game_won.connect(end_game)
	SignalBus.reset_game.connect(reset)

func start_test(type):
	$GameOver.visible = false
	test_started = true
	if test_started:
		$Main.visible = true
		$TitleScreen.visible = false
	else:
		$Main.visible = false
		$TitleScreen.visible = true

func end_game():
	test_started = false
	$Main.visible = false
	$TitleScreen.visible = false
	$GameOver.visible = true

func reset():
	$GameOver.visible = false
	$Main.visible = false
	$TitleScreen/AnimationPlayer.play("RESET")
	$TitleScreen.visible = true
