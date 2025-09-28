-- initialise ipes
function init_pipes()
    pipe={
        y=80,
        x=128,
        w=16,
        h=8,
        gap=32
    }
end

function update_pipes()
    -- Move pipe to left
    pipe.x-=1

    -- Loop the pipe back to start with a different height
    if pipe.x<-16 then
        pipe.x=128
        pipe.y=(16+pipe.gap+rnd(72))
    end
end

function draw_pipes()
    -- Lower Pipe
    spr(17,pipe.x,pipe.y,1,1)
    spr(17,pipe.x+8,pipe.y,1,1,true)
    lower_tube=pipe.y
    while lower_tube < 128 do
        spr(18, pipe.x, lower_tube+8,1,1)
        spr(18, pipe.x+8, lower_tube+8,1,1,true)
        lower_tube+=8
    end
    -- Upper Pipe
    spr(17,pipe.x,pipe.y-pipe.gap,1,1)
    spr(17,pipe.x+8,pipe.y-pipe.gap,1,1,true)
    upper_tube=pipe.y
    while upper_tube > 0 do
        spr(18,pipe.x,upper_tube-8-pipe.gap,1,1)
        spr(18,pipe.x+8,upper_tube-8-pipe.gap,1,1,true)
        upper_tube-=8
    end
end

