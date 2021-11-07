extends Node2D
onready var player = get_node("/root/world/player")
var wall_block = load("res://wall_block.tscn")
var block = load("res://platform.tscn")
var banana = load("res://banana.tscn")
var limit = 700

func _process(delta):
	if player.position.y < limit:
		limit -= 90
		platform_gen(limit-300, (randi() % 400 + 300))
		wall_gen(limit-300)

func _ready():
	randomize()

func platform_gen(height, x):
	for n in (randi() % 6 + 3):
		var block_instance = block.instance()
		add_child(block_instance)
		block_instance.position.x = x + 32*n
		block_instance.position.y = height 
		
		var banana_instance = banana.instance()
		add_child(banana_instance)
		banana_instance.position.x = x + 32*n
		banana_instance.position.y = height - 32

func wall_gen(height):
	for n in 3:
		var wall_block_left = wall_block.instance()
		add_child(wall_block_left)
		wall_block_left.position.x = 16
		wall_block_left.position.y = height+32*n-6
		
		var wall_block_right = wall_block.instance()
		add_child(wall_block_right)
		wall_block_right.position.x = 1024-16
		wall_block_right.position.y = height+32*n-6
