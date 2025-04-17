extends Node2D

func resume():
    get_tree().paused = false
    $Panel.visible = false

func pause():
    Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
    get_tree().paused = true
    $Panel.visible = true

func testEsc():
    if Input.is_action_just_pressed("pause") and get_tree().paused == false:
        pause()
    elif Input.is_action_just_pressed("pause") and get_tree().paused == true:
        resume()


func _on_resume_pressed() -> void :
    $Panel / Uirelease.play()
    resume()


func _on_restart_pressed() -> void :
    $Panel / Uirelease.play()
    Global.global_sheep = 0
    Global.sheepnum = 0
    Global.eliminated = ""
    resume()
    get_tree().reload_current_scene()


func _on_quit_pressed() -> void :
    $Panel / Uirelease.play()
    resume()
    Global.global_sheep = 0
    Global.sheepnum = 0
    Global.eliminated = ""
    get_tree().change_scene_to_file("res://menu.tscn")

func _process(delta):
    testEsc()

func _on_resume_mouse_entered() -> void :
    $Panel / Uihover.play()

func _on_restart_mouse_entered() -> void :
    $Panel / Uihover.play()

func _on_quit_mouse_entered() -> void :
    $Panel / Uihover.play()



func _on_quit_button_down() -> void :
    $Panel / Uipress.play()
func _on_restart_button_down() -> void :
    $Panel / Uipress.play()
func _on_resume_button_down() -> void :
    $Panel / Uipress.play()
