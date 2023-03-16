extends Node2D
var velocitat = 2
var comenca = false



#func _ready():
#	var button = Button.new()
#	button.text = "volar"
#	button.pressed.connect(self._button_pressed)


func _input(event):
	if event is InputEventKey:
		if event.pressed:
			comenca = true

func _physics_process(delta:float) -> void:
	if comenca == true:
		position += Vector2.LEFT * velocitat
#	position += Vector2.LEFT * velocitat

func _on_tubs_body_entered(body):
	if body.name == "ocell":
		body.die()


func _on_contador_body_entered(body):
	if body.name == "ocell":
		body.contador()

