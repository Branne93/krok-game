extends Node2D
export var boost = 10000
var krok_controlable = true

func _ready():
	pass

func _physics_process(delta):
	#Skicka 1 eller -1
	if Input.is_action_pressed("krok_left") and krok_controlable:
		$krok/RigidBody2D.change_velocity(1)
	elif Input.is_action_pressed("krok_right") and krok_controlable:
		$krok/RigidBody2D.change_velocity(-1)
	
	if Input.is_action_just_pressed("spik_detach"):
		$spik/StaticBody2D/hitbox.disabled = true
		#krok_controlable = false
		$krok/RigidBody2D.boost_krok_right(boost)