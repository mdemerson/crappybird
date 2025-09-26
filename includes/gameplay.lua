-- initialise the game
function init_game()
    init_bird()
    init_pipes()
    pipe.y=(16+pipe.gap+rnd(72))
    collision=false
    score=0
    state="menu"
end

-- game updates
function update_game()
    bird_flap()
    update_pipes()
    u_score()
    check_collision(bird, pipe)
end

-- draw everything
function draw_game()
    cls()
    map()
    draw_pipes()
    draw_bird()
    print(score,63,8,7)
    print(state)
end

-- check collision
-- function check_collision()
--     if abs(bird.x-pipe.x) < 1 then
--         if bird.y>pipe.y then
--             collision=true
--             state="game over"
--         elseif bird.y<pipe.y-pipe.gap then
--             collision=true
--             state="game over"
--         end
--     else
--         collision=false
--     end
-- end

function check_collision(sprite1, sprite2)
  return (sprite1.x < sprite2.x + sprite2.w and
          sprite1.x + sprite1.w > sprite2.x and
          sprite1.y < sprite2.y + sprite2.h and
          sprite1.y + sprite1.h > sprite2.y)
end




-- scoring
function init_u_score()
    score=0
end

function u_score()
    if (pipe.x == bird.x) then
        score+=1
    end
end

function draw_game_over()
    rectfill(40,60,96,86,0)
    print("game over!",50,63,7)
    print("❎ to restart", 43,80,7)
end

function draw_menu()
    cls()
    print("crappy bird", 45,63,7)
    print("❎ to start", 45,80,7)
end