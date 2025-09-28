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
    -- check collision bottom pipe
    if check_collision(bird.x, bird.y, bird.w, bird.h, pipe.x, pipe.y, pipe.w, 128-pipe.y) then
        collision=true
        state="game over"
    end
    -- check collision top pipe
    if check_collision(bird.x, bird.y, bird.w, bird.h, pipe.x, 0, pipe.w, pipe.y-pipe.gap) then
        collision=true
        state="game over"
    end
end

-- draw everything
function draw_game()
    cls()
    map()
    draw_pipes()
    draw_bird()
    print(score,63,8,7)
end


-- check collision AABB
function check_collision(bird_x, bird_y, bird_w, bird_h, pipe_x, pipe_y, pipe_w, pipe_h)
  return bird_x < pipe_x + pipe_w and
         bird_x + bird_w > pipe_x and
         bird_y < pipe_y + pipe_h and
         bird_y + bird_h > pipe_y
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
    rectfill(32,60,96,86,0)
    print("game over!",47,63,7)
    print("❎ to restart", 40,80,7)
end

function draw_menu()
    cls()
    print("crappy bird", 45,63,7)
    print("❎ to start", 45,80,7)
end