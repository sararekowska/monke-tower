extends Node2D

var selected_menu = 0
onready var music = get_node("/root/Music/bgmusic")

func change_menu_color():
	$start.color = Color("#276468")
	$music.color = Color("#276468")
	$quit.color = Color("#276468")
	
	match selected_menu:
		0:
			$start.color = Color("#183f39")
		1:
			$music.color = Color("#183f39")
		2: 
			$quit.color = Color("#183f39")
	
func _ready():
	change_menu_color()
	
func _input(event):
	if Input.is_action_just_pressed("ui_down"):
		selected_menu = (selected_menu + 1) % 3
		change_menu_color()
	elif Input.is_action_just_pressed("ui_up"):
		if selected_menu > 0:
			selected_menu = selected_menu -1
		else:
			selected_menu = 2
		change_menu_color()
	if Input.is_action_just_pressed("ui_accept"):
		match selected_menu:
			0:
				get_tree().change_scene("res://world.tscn")
			1:
				if music.playing == false:
					music.playing = true
					get_node("music/Label").text = "MUSIC: ON"
				elif music.playing == true:
					music.playing = false
					get_node("music/Label").text = "MUSIC: OFF"
			2:
				get_tree().quit()
	
