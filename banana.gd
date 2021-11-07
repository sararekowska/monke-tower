extends Area2D

func _on_banana_body_entered(body):
	queue_free()
	pass


func _on_Area2D_body_entered(body):
	queue_free()
	pass
