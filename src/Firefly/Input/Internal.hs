--------------------------------------------------------------------------------
module Firefly.Input.Internal
    ( Key (..)
    ) where


--------------------------------------------------------------------------------
import           Foreign.C.Types (CInt)


--------------------------------------------------------------------------------
newtype Key = Key CInt