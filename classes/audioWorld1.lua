local TEMPO = 100 -- BPM ; Beats per minute
local SIGNATURE = 4 -- BPB ; Beats per bar
local SAMPLE_RATE = 44100 -- Hertz

local BLOCK_SIZE = math.floor(SAMPLE_RATE * (60 /(TEMPO/SIGNATURE)))

  -- load music
local theme = audio.loadStream("audio/theme.wav")

  -- play music
local themeChannel = audio.play(theme,{channel =1, loops=-1})

function update() {
    outputIndex = 0
    outputCount = output.length

    if( playing == false ) {
        -- silent samples need to be pushed to the output stream
        while( outputIndex < outputCount ) {
            output[ outputIndex++ ] = 0.0
        }
        -- the remainder of the function should not be executed
        return
    }

    chnCount = channels.length

    -- the length of the music, in samples
    musicLength = BLOCK_SIZE * channels[ 0 ].length

    while( outputIndex < outputCount ) {
        chnIndex = 0

        -- the bar of music that the sequencer playhead is pointing at
        barIndex = floor( position / BLOCK_SIZE )

        -- set the output sample value to zero (silent)
        output[ outputIndex ] = 0.0

        while( chnIndex < chnCount ) {
            -- check the channel flag to see if the block should be played
            if( channels[ chnIndex ][ barIndex ] == 1 ) {
                -- the position of the block in the "input" stream
                inputOffset = BLOCK_SIZE * chnIndex

                -- index into the "input" stream
                inputIndex = inputOffset + ( position % BLOCK_SIZE )

                -- add the block sample to the output sample
                output[ outputIndex ] += input[ inputIndex ]
            }
            chnIndex++
        }

        -- advance the playhead position
        position++

        if( position >= musicLength ) {
            -- reset the playhead position to loop the music
            position = 0
        }

        outputIndex++
    }
}
