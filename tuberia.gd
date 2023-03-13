extends Node2D
var velocitat = 3


func _physics_process(delta:float) -> void:
	position += Vector2.LEFT * velocitat

func _on_tubs_body_entered(body):
	if body.name == "ocell":
		body.die()


func _on_contador_body_entered(body):
	if body.name == "ocell":
		body.contador()

