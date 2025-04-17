extends Label3D
var localnum = 0
func _ready():
    text = str(Global.sheepnum)
    localnum = Global.sheepnum
    Global.sheepnum += 1
    $Label3D2.text = str(localnum)
