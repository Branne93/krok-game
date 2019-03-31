extends RigidBody2D
#Krokens svinghastighet
export var force = 500
export var offset = 100

var velocity = Vector2()


func _ready():

	pass

func _physics_process(delta):
	push_krok(velocity)
	velocity = Vector2()

func push_krok(force_vector):
	var dir = Vector2(sin(rotation), cos(rotation))
	dir = 50 * dir.normalized()
	apply_impulse(dir, force_vector)

#Kroken flyger inte tillräckligt bra när spiken släpper, vi langar en 45 graders boost åt höger
func boost_krok_right(boost):
	var boost_direction = Vector2(cos(PI / 4), -1)
	push_krok(boost_direction * boost)
	
	
#Kontrollern kommer ske i rotnoden, så separerar vi funktionaliteten
#Den här metoden måste lista ut vad som är höger och vänster, argumentet ändrar om det är +pi/2 eller -pi/2
func change_velocity(direction):
	#Hitta "riktningen", krokens upp riktning
	var dir = Vector2(sin(rotation), cos(rotation))
	dir = dir.rotated(direction * PI / 2)
	dir = dir.normalized()
	velocity += force * dir