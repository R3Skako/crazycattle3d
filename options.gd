extends Node

func _ready():
    $Name.text = Global.playername
    var data = ResourceLoader.load("user://savefile.tres") as SaveData
    var muVol = data.musicvol
    var maVol = data.mastervol
    var fulSc = data.fullscreen
    $Master.value = maVol
    $Music.value = muVol
    $Fullscreen.button_pressed = fulSc

func _on_master_value_changed(value: float) -> void :
    AudioServer.set_bus_volume_db(0, value)
func _on_music_value_changed(value: float) -> void :
    AudioServer.set_bus_volume_db(1, value)

func _on_fullscreen_toggled(toggled_on: bool) -> void :
    if toggled_on == true:
        DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
    if toggled_on == false:
        DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)

func _on_name_text_changed(new_text: String) -> void :
    Global.playername = new_text


func _on_save_pressed() -> void :
    $Uirelease.play()
    var data = SaveData.new()
    data.mastervol = $Master.value
    data.musicvol = $Music.value
    data.fullscreen = $Fullscreen.button_pressed
    data.savename = Global.playername
    data.saveunlockedlevels = Global.unlockedlevels
    data.beatenlevels = Global.beatenlevels
    ResourceSaver.save(data, "user://savefile.tres")
    print("Saved")
    get_tree().change_scene_to_file("res://menu.tscn")

func _on_save_2_pressed() -> void :
    $Uirelease.play()
    var data = SaveData.new()
    Global.unlockedlevels = 1
    data.beatenlevels = 0
    Global.beatenlevels = 0
    data.saveunlockedlevels = Global.unlockedlevels
    $Baa.pitch_scale = randf_range(0.7, 1.3)
    $Baa.play()
    ResourceSaver.save(data, "user://savefile.tres")

    print("Progress Erased.")


func _on_master_drag_ended(value_changed: bool) -> void :
    $Baa.pitch_scale = randf_range(0.7, 1.3)
    $Baa.play()



func _on_save_button_down() -> void :
    $Uipress.play()
func _on_save_2_button_down() -> void :
    $Uipress.play()
func _on_save_2_mouse_entered() -> void :
    $Uihover.play()
func _on_save_mouse_entered() -> void :
    $Uihover.play()
