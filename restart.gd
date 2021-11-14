extends Node2D

var selected_menu = 0

func change_menu_color():
	$restart.color = Color("#276468")
	$quit.color = Color("#276468")
	
	match selected_menu:
		0:
			$restart.color = Color("#183f39")
		1: 
			$quit.color = Color("#183f39")
	
func _ready():
	change_menu_color()
	
func _input(event):
	if Input.is_action_just_pressed("ui_down"):
		selected_menu = (selected_menu + 1) % 2
		change_menu_color()
	elif Input.is_action_just_pressed("ui_up"):
		if selected_menu > 0:
			selected_menu = selected_menu -1
		change_menu_color()
	if Input.is_action_just_pressed("ui_accept"):
		match selected_menu:
			0:
				get_tree().change_scene("res://world.tscn")
			1:
				get_tree().quit()
	
