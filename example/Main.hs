--------------------------------------------------------------------------------
module Main where


--------------------------------------------------------------------------------
import           Control.Concurrent         (threadDelay)
import           Control.Monad              (forever)


--------------------------------------------------------------------------------
import qualified Firefly                    as F
import qualified Firefly.Input.Keys         as FK
import qualified Firefly.Input.MouseButtons as FMB
import           Firefly.Vector


--------------------------------------------------------------------------------
main :: IO ()
main = F.firefly $ do
    F.setVideoMode (800, 600)

    background  <- F.textureFromPng "example/background.png"
    img         <- F.textureFromPng "example/acid.png"
    font        <- F.fontFromTtf "example/japanese.ttf" 120
    sound       <- F.soundFromFile "example/sound.wav"

    F.playSound sound

    putStrLn $ "Image size: " ++ show (F.textureSize img)
    putStrLn $ "Sound: " ++ F.soundFilePath sound
    F.playMusic "example/music.mp3" F.DontLoop

    loop background img font


--------------------------------------------------------------------------------
loop :: F.Texture -> F.Texture -> F.Font -> IO ()
loop background img font = do
    F.flushInput
    quit       <- F.hasReceivedQuit
    esc        <- F.isKeyDown FK.escape
    mousePos   <- F.getMousePosition
    ticks      <- F.getTicks
    screenSize <- F.getScreenSize

    let ticks' = fromIntegral (ticks `mod` 1000) / 1000

    F.frame $ do
        let (sw, sh) = screenSize

        F.pushMatrix $ do
            F.translate $ F.Vector (- ticks' * fromIntegral sw) 0
            F.drawTexture background
            F.translate $ F.Vector (fromIntegral sw) 0
            F.drawTexture background

        F.pushMatrix $ F.pushColor $ do
            F.translate $ F.fromInts (sw `div` 2, 120)

            F.setColor $ F.fromRgba 0 0 0 0.2
            F.drawStringCentered font "ラーメン"

            F.translate $ F.fromInts (0, -5)
            F.setColor $ F.fromHsv ticks' 0.8 1
            F.drawStringCentered font "ラーメン"


        F.translate $ Vector 0 80 .+. F.fromInts screenSize ./ 2
        F.rotate $ 2 * pi * ticks'
        F.drawTextureCentered img

        -- F.drawTextureDebug img

    F.delay 10

    if quit || esc then return () else loop background img font
