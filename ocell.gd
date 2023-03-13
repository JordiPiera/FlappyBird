extends RigidBody2D

var velocitat = 300
var accio = true
var contador = 0

func volar(state: Physics2DDirectBodyState):
	state.linear_velocity = Vector2.UP * velocitat
	$AnimatedSprite.look_at($amunt.global_position)

func contador():
	contador += 1
	print("La teva puntuació és de: ", contador, " punts.")

func die():
	print("Has mort.")
	get_tree().paused = true



func _integrate_forces(state: Physics2DDirectBodyState) -> void:
	if state.linear_velocity.y > velocitat * 0.5:
		$AnimatedSprite.rotation = lerp_angle($AnimatedSprite.rotation,$abaix.position.normalized().angle(),0.1)

	if Input.is_action_just_pressed("volar") && accio:
		volar(state)

func _on_Area2D_body_entered(body):
	if body.name == "ocell":
		body.die()


func _on_AreaFinal_body_entered(body):
	if body.name == "ocell":
		print("Felicitats! T'has passat el joc.")
