--------------------------------------------------------------------------------
module Firefly.Input.Internal
    ( Key (..)
    , MouseButton (..)
    ) where


--------------------------------------------------------------------------------
import           Foreign.C.Types (CInt)


--------------------------------------------------------------------------------
-- | See "Firefly.Input.Keys" for a list
newtype Key = Key CInt


--------------------------------------------------------------------------------
-- | See "Firefly.Input.MouseButtons" for a list
newtype MouseButton = MouseButton CInt
