tool
extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _draw():
    var lightningPoint1 = self.get_child(0).get_pos()
    var lightningPoint2 = self.get_child(1).get_pos()
    var color = Color(200,200,200)

    var lightning_samples = 10
    var toPoint = lightningPoint2 - lightningPoint1
    var vectorLength = toPoint.length()
    var previousPoint = lightningPoint1
    var nextPoint
    var randomOffset

    for i in range(lightning_samples):
        if(i == 0 || i == lightning_samples -1):
             randomOffset = Vector2(0,0)
        else:
             randomOffset = Vector2(randf() * 2.0 - 1, randf() * 2.0 - 1) * 35
        nextPoint =  float(i) /  lightning_samples * toPoint + lightningPoint1 + randomOffset
        draw_line(previousPoint, nextPoint, color)
        previousPoint = nextPoint



func _process(delta):
    update()

func _ready():
    set_process(true)