extends Area2D
signal player

func _on_Area2D_body_entered(body):
	body._on_banana_enter()
	queue_free()
	pass
