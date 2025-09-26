-- Called at first run
function _init()
    init_game()
end

-- called 30/s
function _update()
    if state=="game" then
        update_game()
    elseif state=="game over" then
        draw_game_over()
        if btnp(❎) then
            cls()
            _init()
            state="game"
        end
    elseif state=="menu" then
        draw_menu()
        if btnp(❎) then
            state="game"
        end
    end
end

-- called 30/s after update
function _draw()
    if state=="game" then
        draw_game()
    end
end

