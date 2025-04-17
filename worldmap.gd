extends Node2D


func updateUnlocks():
    if Global.unlockedlevels >= 1:
        $Worldmap / ire.disabled = false
        if Global.unlockedlevels >= 2:
            $Worldmap / egy.disabled = false
            if Global.unlockedlevels >= 3:
                $Worldmap / swe.disabled = false

func updateUIticks():
    if Global.beatenlevels >= 1:
        $Worldmap / Yes.show()
        if Global.beatenlevels >= 2:
            $Worldmap / Yes2.show()
            if Global.beatenlevels >= 3:
                    $Worldmap / Yes3.show()

func _on_swe_pressed() -> void :
    $Worldmap / Uirelease.play()
    get_tree().change_scene_to_file("res://sweden.tscn")

func _on_ire_pressed() -> void :
    $Worldmap / Uirelease.play()
    get_tree().change_scene_to_file("res://environment2.tscn")


func _on_egy_pressed() -> void :
    $Worldmap / Uirelease.play()
    get_tree().change_scene_to_file("res://egypt.tscn")

func _on_return_pressed() -> void :
    $Worldmap / Uirelease.play()
    get_tree().change_scene_to_file("res://menu.tscn")

func _ready():
    Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
    updateUnlocks()
    updateUIticks()

func _on_return_2_pressed() -> void :
    $Worldmap / Uirelease.play()
    get_tree().change_scene_to_file("res://trophyroom.tscn")


func _on_swe_button_down() -> void :
    $Worldmap / Uipress.play()


func _on_ire_button_down() -> void :
    $Worldmap / Uipress.play()


func _on_egy_button_down() -> void :
    $Worldmap / Uipress.play()


func _on_return_button_down() -> void :
    $Worldmap / Uipress.play()


func _on_return_2_button_down() -> void :
    $Worldmap / Uipress.play()



func _on_swe_mouse_entered() -> void :
    if $Worldmap / swe.disabled == false:
        $Worldmap / Uihover.play()


func _on_ire_mouse_entered() -> void :
    if $Worldmap / ire.disabled == false:
        $Worldmap / Uihover.play()


func _on_egy_mouse_entered() -> void :
    if $Worldmap / egy.disabled == false:
        $Worldmap / Uihover.play()


func _on_return_mouse_entered() -> void :
    $Worldmap / Uihover.play()

func _on_return_2_mouse_entered() -> void :
    $Worldmap / Uihover.play()
