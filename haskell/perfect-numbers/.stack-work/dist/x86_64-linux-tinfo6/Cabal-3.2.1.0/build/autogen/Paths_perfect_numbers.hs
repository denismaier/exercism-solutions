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

bindir     = "/root/exercism/haskell/perfect-numbers/.stack-work/install/x86_64-linux-tinfo6/2ea83fcc2af6c8417dbd4c92c01bfb5d5bcf3a4fb4dfacf782b9e4f9a1dfb291/8.10.7/bin"
libdir     = "/root/exercism/haskell/perfect-numbers/.stack-work/install/x86_64-linux-tinfo6/2ea83fcc2af6c8417dbd4c92c01bfb5d5bcf3a4fb4dfacf782b9e4f9a1dfb291/8.10.7/lib/x86_64-linux-ghc-8.10.7/perfect-numbers-1.1.0.4-4HZxTrZat22589wezTIn2n"
dynlibdir  = "/root/exercism/haskell/perfect-numbers/.stack-work/install/x86_64-linux-tinfo6/2ea83fcc2af6c8417dbd4c92c01bfb5d5bcf3a4fb4dfacf782b9e4f9a1dfb291/8.10.7/lib/x86_64-linux-ghc-8.10.7"
datadir    = "/root/exercism/haskell/perfect-numbers/.stack-work/install/x86_64-linux-tinfo6/2ea83fcc2af6c8417dbd4c92c01bfb5d5bcf3a4fb4dfacf782b9e4f9a1dfb291/8.10.7/share/x86_64-linux-ghc-8.10.7/perfect-numbers-1.1.0.4"
libexecdir = "/root/exercism/haskell/perfect-numbers/.stack-work/install/x86_64-linux-tinfo6/2ea83fcc2af6c8417dbd4c92c01bfb5d5bcf3a4fb4dfacf782b9e4f9a1dfb291/8.10.7/libexec/x86_64-linux-ghc-8.10.7/perfect-numbers-1.1.0.4"
sysconfdir = "/root/exercism/haskell/perfect-numbers/.stack-work/install/x86_64-linux-tinfo6/2ea83fcc2af6c8417dbd4c92c01bfb5d5bcf3a4fb4dfacf782b9e4f9a1dfb291/8.10.7/etc"

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
  return (dir ++ "/" ++ name)
