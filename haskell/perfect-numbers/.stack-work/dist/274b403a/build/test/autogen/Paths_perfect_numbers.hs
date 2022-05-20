{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_perfect_numbers (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [1,1,0,4] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "C:\\Users\\denis\\dateien\\docs\\2-archiv\\ich\\lernen\\dev\\exercism\\haskell\\perfect-numbers\\.stack-work\\install\\0d1e2608\\bin"
libdir     = "C:\\Users\\denis\\dateien\\docs\\2-archiv\\ich\\lernen\\dev\\exercism\\haskell\\perfect-numbers\\.stack-work\\install\\0d1e2608\\lib\\x86_64-windows-ghc-8.10.7\\perfect-numbers-1.1.0.4-6Z3qbdM7Iiw1hmR1ZlI3II-test"
dynlibdir  = "C:\\Users\\denis\\dateien\\docs\\2-archiv\\ich\\lernen\\dev\\exercism\\haskell\\perfect-numbers\\.stack-work\\install\\0d1e2608\\lib\\x86_64-windows-ghc-8.10.7"
datadir    = "C:\\Users\\denis\\dateien\\docs\\2-archiv\\ich\\lernen\\dev\\exercism\\haskell\\perfect-numbers\\.stack-work\\install\\0d1e2608\\share\\x86_64-windows-ghc-8.10.7\\perfect-numbers-1.1.0.4"
libexecdir = "C:\\Users\\denis\\dateien\\docs\\2-archiv\\ich\\lernen\\dev\\exercism\\haskell\\perfect-numbers\\.stack-work\\install\\0d1e2608\\libexec\\x86_64-windows-ghc-8.10.7\\perfect-numbers-1.1.0.4"
sysconfdir = "C:\\Users\\denis\\dateien\\docs\\2-archiv\\ich\\lernen\\dev\\exercism\\haskell\\perfect-numbers\\.stack-work\\install\\0d1e2608\\etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "perfect_numbers_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "perfect_numbers_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "perfect_numbers_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "perfect_numbers_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "perfect_numbers_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "perfect_numbers_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "\\" ++ name)
