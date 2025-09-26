-- Bird code

function init_bird()
    bird={
    x=35,
    y=63,
    w=8,
    h=8,
    flap_amount=6,
    flap=0,
    gravity=1,
    sprite=2
    }
end

function bird_flap()
    bird.y+=bird.gravity -- gravity
    if btnp(❎) then
        bird.flap=bird.flap_amount
    end
    if bird.flap>0 then
        bird.flap-=1
        bird.sprite=1
    else
        bird.sprite=2
    end
    bird.y-=bird.flap
    if bird.y>=120 then
        bird.y=120
    elseif bird.y<=0 then
        bird.y=0
    end
end

function draw_bird()
    spr(bird.sprite,bird.x,bird.y)
end