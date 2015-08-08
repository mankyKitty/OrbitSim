module Main

-- Some constants
-- Taken from http://www.braeunig.us/space/constant.htm
import Data.Floats

massOfEarth : Float
massOfEarth = 5.9737e24

radiusOfEarth : Float
radiusOfEarth = 6378.137

gravitationG : Float
gravitationG = 6.67259e-11

gMEarth : Float
gMEarth = 3.986005e14

circularVelocity : Float -> Float
circularVelocity r = sqrt (gMEarth / r)

centripetalAccel : Float -> Float -> Float
centripetalAccel v r = (pow v 2) / r

centripetalForce : Float -> Float -> Float -> Float
centripetalForce m v r = (m * (pow v 2)) / r

cartToPolar : (Float,Float,Float) -> Float
cartToPolar (x,y,z) = sqrt (sq x + sq y + sq z)
  where
    sq n = pow n 2

gravitationalForce : (Float,Float,Float) -> Float -> Float
gravitationalForce v m = (gravitationG * m * massOfEarth) / (pow r 2)
  where
    r = cartToPolar v

main : IO ()
main =
  let r = (radiusOfEarth + 200) * 1000 in
  putStrLn $ show (circularVelocity r)
