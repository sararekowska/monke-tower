extends Area2D
signal player

func _on_Area2D_body_entered(body):
	print(self)
	queue_free()
	body._on_banana_enter()

