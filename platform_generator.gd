extends Node2D
onready var player = get_node("/root/world/player")
var limit = 700

func _process(delta):
	if player.position.y < limit:
		limit -= 90
		platform_gen(limit-300, (randi() % 400 + 300))
		print(limit)

func _ready():
	randomize()

func platform_gen(height, x):
	for n in (randi() % 6 + 3):
		var block = load("res://platform.tscn")
		var block_instance = block.instance()
		block_instance.set_name("block")
		add_child(block_instance)
		block_instance.position.x = x + 32*n
		block_instance.position.y = height 
