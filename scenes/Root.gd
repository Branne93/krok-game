extends Node2D
export var boost = 10000
var krok_controlable = true

var krok_start_position

func _ready():
	#Kolla om något har kommit in i resetarean
	$resetarea/Area2D.connect("reset_signal", self, "reset")


func _physics_process(delta):
	#Skicka 1 eller -1
	if Input.is_action_pressed("krok_left") and krok_controlable:
		$krok/RigidBody2D.change_velocity(1)
	elif Input.is_action_pressed("krok_right") and krok_controlable:
		$krok/RigidBody2D.change_velocity(-1)
	
	if Input.is_action_just_pressed("spik_detach") and krok_controlable:
		$spik/StaticBody2D/hitbox.disabled = true
		krok_controlable = false
		$krok/RigidBody2D.boost_krok_right(boost)
		
func reset():
	get_tree().reload_current_scene()
	print("reseting")