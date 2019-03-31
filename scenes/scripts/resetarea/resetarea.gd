extends Area2D

signal reset_signal

func _ready():
	pass


func body_entered(body):
	emit_signal("reset_signal")
	print(body)



