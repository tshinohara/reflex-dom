module Test.Util.UnshareNetwork where

import System.Linux.Namespaces
import System.Posix
import System.Process

unshareNetork :: IO ()
unshareNetork = do
  uid <- getEffectiveUserID
  unshare [User, Network]
  writeUserMappings Nothing [UserMapping 0 uid 1]
  callCommand "ip link set lo up ; ip addr"
