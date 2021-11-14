extends Camera2D
var speed = -1.2

func _ready():
	pass 

func _process(delta):
	self.position.y += speed

