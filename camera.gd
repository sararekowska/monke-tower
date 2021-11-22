extends Camera2D
var speed = -1.2
onready var player = get_parent().get_node("player")

func _ready():
	pass 

func _process(delta):
	var h = self.position.y-player.position.y
	if h > 1:
		self.position.y = lerp(self.position.y, player.position.y, 0.02)
	self.position.y += speed
		
	

