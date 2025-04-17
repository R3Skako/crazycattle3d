extends Node

func initialise_game():
    if ResourceLoader.exists("user://savefile.tres") == true:
        print("Savefile Exists; Skipping Initialisation")
    else:
        var data = SaveData.new()
        data.savename = "Nardo Polo"
        data.saveunlockedlevels = 1
        data.mastervol = 0
        data.musicvol = 0
        data.beatenlevels = 0
        ResourceSaver.save(data, "user://savefile.tres")
        print("Savefile not found; Initialising")



func loadData():

    var data = ResourceLoader.load("user://savefile.tres") as SaveData
    Global.unlockedlevels = data.saveunlockedlevels
    Global.playername = data.savename
    Global.beatenlevels = data.beatenlevels
    AudioServer.set_bus_volume_db(0, data.mastervol)
    AudioServer.set_bus_volume_db(1, data.musicvol)
    if data.fullscreen == true:
        DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
    if data.fullscreen == false:
        pass


    print("Loaded with name " + Global.playername + " and " + str(Global.unlockedlevels) + " unlocked levels")

func _ready():
    randomize()
    initialise_game()
    loadData()

func uiHover():
    $Uihover.play()

func uiPress():
    $Uipress.play()

func uiRelease():
    $Uirelease.play()

func _on_ng_pressed() -> void :
    get_tree().change_scene_to_file("res://worldmap.tscn")

func _on_opt_pressed() -> void :
    get_tree().change_scene_to_file("res://options.tscn")

func _on_quit_pressed() -> void :
    $quit.disabled = true
    $opt.disabled = true
    $ng.disabled = true
    $Baa.pitch_scale = randf_range(0.7, 1.3)
    $Baa.play()

func _on_ng_mouse_entered() -> void :
    uiHover()
func _on_opt_mouse_entered() -> void :
    uiHover()
func _on_quit_mouse_entered() -> void :
    uiHover()

func _on_ng_button_up() -> void :
    uiRelease()
func _on_ng_button_down() -> void :
    uiPress()

func _on_opt_button_up() -> void :
    uiRelease()
func _on_opt_button_down() -> void :
    uiPress()
func _on_quit_button_down() -> void :
    uiPress()
func _on_quit_button_up() -> void :
    uiRelease()

func _on_baa_finished() -> void :
    get_tree().quit()
