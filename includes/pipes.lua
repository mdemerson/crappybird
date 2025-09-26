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

    -- Loop the pipe back to start
    if pipe.x<-16 then
        pipe.x=128
        pipe.y=(16+pipe.gap+rnd(72))
    end
end

function draw_pipes()
    -- Lower Pipe
    spr(9,pipe.x,pipe.y,2,1)
    lower_tube=pipe.y
    while lower_tube < 128 do
        spr(25, pipe.x, lower_tube+8,2,1)
        lower_tube+=8
    end
    -- Upper Pipe
    spr(9,pipe.x,pipe.y-pipe.gap,2,1)
    upper_tube=pipe.y
    while upper_tube > 0 do
        spr(25,pipe.x,upper_tube-8-pipe.gap,2,1)
        upper_tube-=8
    end
end

