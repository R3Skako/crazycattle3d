extends Node2D


func _on_return_button_down() -> void :
    $Uipress.play()
    get_tree().change_scene_to_file("res://trophyroom.tscn")
func _on_return_button_up() -> void :
    $Uirelease.play()
func _on_return_mouse_entered() -> void :
    $Uihover.play()
