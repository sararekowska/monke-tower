extends Node2D

func _ready():
	randomize()
	for n in 4:
		platform_gen(300 - 90*n, (randi() % 500 + 300))

func platform_gen(height, x):
	for n in (randi() % 6 + 2):
		var block = load("res://platform.tscn")
		var block_instance = block.instance()
		block_instance.set_name("block")
		add_child(block_instance)
		block_instance.position.x = x + 32*n
		block_instance.position.y = height 
