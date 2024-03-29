--
-- xmonad example config file.
--
-- A template showing all available configuration hooks,
-- and how to override the defaults in your own xmonad.hs conf file.
--
-- Normally, you'd only override those defaults you care about.
--
 
{-# OPTIONS_GHC -fglasgow-exts #-} -- required for XMonad.Layout.MultiToggle

import XMonad
import System.Exit
import qualified XMonad.StackSet as W
import qualified Data.Map        as M
-- allows fullscreen toggle, without Full layout
import XMonad.Layout.MultiToggle 
import XMonad.Layout.MultiToggle.Instances
-- Setup for proper java application handling 
-- (IntelliJ and Android Studio)
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ICCCMFocus
import XMonad.Hooks.SetWMName
 
---- Tools
-- The preferred terminal program, which is used in a binding below and by
-- certain contrib modules.
--
--myTerminal      = "urxvt -bg rgba:1500/1000/3000/9999 -fg rgba:9999/cccc/eeee/eeee +sb"
myTerminal      = "gnome-terminal --hide-menubar"
myRanger        = "urxvt -bg rgba:1500/1000/3000/9999 -fg rgba:9999/cccc/eeee/eeee +sb  -e ranger ~"
 
--myDmenu         = "/usr/bin/dmenu_run -nb darkblue -nf lightblue -sb blue -sf lightblue"
myDmenu         = "/usr/bin/dmenu_run"
myChrome        = "/usr/bin/google-chrome"
mySteam         = "/usr/games/steam"
mySpotify       = "/snap/bin/spotify"
myShadow        = "${HOME}/bin/shadow"
myNotemenu      = "${HOME}/bin/notemenu"
myRMNotemenu    = "${HOME}/bin/rmnotemenu"
myBgpic         = "${HOME}/bin/bgpic"
myCyclepic      = "${HOME}/bin/cyclepic"

amberclock      = "echo `date` | dzen2 -fg orange -p 10 -x 10 -y 10 -w 300"
amberbattery    = "echo `cat /sys/class/power_supply/BAT0/capacity` | dbar | dzen2 -fg orange -p 10 -x 10 -y 40 -w 400"
ambertemp       = "echo `cat /sys/class/thermal/thermal_zone0/temp` | dzen2 -fg orange -p 10 -x 10 -y 40 -w 400"
whiteOClock      = "oclock -fg white -bg white -bd white -transparent -geometry 100x100+10+10"
blackOClock      = "oclock -fg black -bg black -bd black -transparent -geometry 100x100+10+10"

volumeUp5       = "amixer -c 0 set Master playback 5dB+"
volumeUp10      = "amixer -c 0 set Master playback 10dB+"
volumeDn5       = "amixer -c 0 set Master playback 5dB-"
volumeDn10      = "amixer -c 0 set Master playback 10dB-"

-- Width of the window border in pixels.
--
myBorderWidth   = 1
 
-- modMask lets you specify which modkey you want to use. The default
-- is mod1Mask ("left alt").  You may also consider using mod3Mask
-- ("right alt"), which does not conflict with emacs keybindings. The
-- "windows key" is usually mod4Mask.
--
myModMask       = mod1Mask
 
-- The mask for the numlock key. Numlock status is "masked" from the
-- current modifier status, so the keybindings will work with numlock on or
-- off. You may need to change this on some systems.
--
-- You can find the numlock modifier by running "xmodmap" and looking for a
-- modifier with Num_Lock bound to it:
--
-- > $ xmodmap | grep Num
-- > mod2        Num_Lock (0x4d)
--
-- Set numlockMask = 0 if you don't have a numlock key, or want to treat
-- numlock status separately.
--
-- myNumlockMask   = mod2Mask
 
-- The default number of workspaces (virtual screens) and their names.
-- By default we use numeric strings, but any string may be used as a
-- workspace name. The number of workspaces is determined by the length
-- of this list.
--
-- A tagging example:
--
-- > workspaces = ["web", "irc", "code" ] ++ map show [4..9]
--
myWorkspaces    = ["1code","2code","3steam","4","5music","6tmp","7","8web","9web"]
 
-- Border colors for unfocused and focused windows, respectively.
--
myNormalBorderColor  = "#332299"
myFocusedBorderColor = "#000000"
 
------------------------------------------------------------------------
-- Key bindings. Add, modify or remove key bindings here.
--
myKeys conf@(XConfig {XMonad.modMask = modm}) = M.fromList $
 
    -- launch a terminal
    [ ((modm .|. shiftMask,   xK_Return  ), spawn myRanger )
    , ((modm .|. controlMask, xK_Return  ), spawn $ XMonad.terminal conf )

    -- launch a browser
    , ((controlMask, xK_n  ), spawn $ myChrome )

    -- launch steam
    , ((controlMask, xK_m  ), spawn $ mySteam )

    -- launch shadow
    , ((controlMask, xK_slash  ), spawn $ myShadow )

    -- launch spotify
    , ((controlMask, xK_period ), spawn $ mySpotify )

    -- launch dmenu
    , ((modm,               xK_p        ), spawn myDmenu )

    -- random bgpic
    , ((mod4Mask,               xK_grave    ), spawn myBgpic )
    , ((mod4Mask .|. shiftMask, xK_grave    ), spawn myCyclepic )

    -- launch gmrun
    , ((modm .|. shiftMask, xK_p        ), spawn "gmrun")
 
    -- launch clock
    , ((modm, xK_grave ), spawn amberclock )
    , ((modm .|. shiftMask, xK_grave    ), spawn whiteOClock )

    -- battery monitor
    , ((modm, xK_Escape ), spawn amberbattery )
    -- temp monitor
    , ((modm .|. shiftMask, xK_Escape ), spawn ambertemp )

    -- volume controls
    , ((modm,               xK_equal    ), spawn volumeUp5  )
    , ((modm .|. shiftMask, xK_equal    ), spawn volumeUp10 )
    , ((modm,               xK_minus    ), spawn volumeDn5  )
    , ((modm .|. shiftMask, xK_minus    ), spawn volumeDn10 )

    -- close focused window 
    , ((modm .|. shiftMask, xK_c     ), kill)
 
     -- Rotate through the available layout algorithms
    , ((modm,               xK_space ), sendMessage NextLayout)
 
    --  Reset the layouts on the current workspace to default
    , ((modm .|. shiftMask, xK_space ), setLayout $ XMonad.layoutHook conf)
 
    -- Fullscreen
    , ((modm,               xK_f     ), sendMessage $ Toggle FULL)
    , ((modm ,              xK_F1    ), sendMessage $ Toggle FULL)

    -- Search for and edit notes
    , ((modm,               xK_n     ), spawn myNotemenu)
    -- Search for and remove notes
    , ((modm,               xK_d     ), spawn myRMNotemenu)
    
    -- Resize viewed windows to the correct size
    --, ((modm,               xK_n     ), refresh)
 
    --
    -- Move focus to the next window
    , ((modm,               xK_Tab   ), windows W.focusDown)
 
    -- Move focus to the next window
    , ((modm,               xK_j     ), windows W.focusDown)
 
    -- Move focus to the previous window
    , ((modm,               xK_k     ), windows W.focusUp  )
 
    -- Move focus to the master window
    , ((modm,               xK_m     ), windows W.focusMaster  )
 
    -- Swap the focused window and the master window
    , ((modm,               xK_Return), windows W.swapMaster)
 
    -- Swap the focused window with the next window
    , ((modm .|. shiftMask, xK_j     ), windows W.swapDown  )
 
    -- Swap the focused window with the previous window
    , ((modm .|. shiftMask, xK_k     ), windows W.swapUp    )
 
    -- Shrink the master area
    , ((modm,               xK_h     ), sendMessage Shrink)
 
    -- Expand the master area
    , ((modm,               xK_l     ), sendMessage Expand)
 
    -- Push window back into tiling
    , ((modm,               xK_t     ), withFocused $ windows . W.sink)
 
    -- Increment the number of windows in the master area
    , ((modm              , xK_comma ), sendMessage (IncMasterN 1))
 
    -- Deincrement the number of windows in the master area
    , ((modm              , xK_period), sendMessage (IncMasterN (-1)))
 
    -- toggle the status bar gap
    -- TODO, update this binding with avoidStruts , ((modm , xK_b ), sendMessage ToggleStruts)
 
    -- Quit xmonad
    , ((modm .|. shiftMask, xK_q     ), io (exitWith ExitSuccess))
 
    -- Restart xmonad
    , ((modm              , xK_q     ), restart "xmonad" True)
    ]
    ++
 
    --
    -- mod-[1..9], Switch to workspace N
    -- mod-shift-[1..9], Move client to workspace N
    --
    [((m .|. modm, k), windows $ f i)
        | (i, k) <- zip (XMonad.workspaces conf) [xK_1 .. xK_9]
        , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]
    ++
 
    --
    -- mod-{w,e,r}, Switch to physical/Xinerama screens 1, 2, or 3
    -- mod-shift-{w,e,r}, Move client to screen 1, 2, or 3
    --
    [((m .|. modm, key), screenWorkspace sc >>= flip whenJust (windows . f))
        | (key, sc) <- zip [xK_w, xK_e, xK_r] [0..]
        , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]]
 
 
------------------------------------------------------------------------
-- Mouse bindings: default actions bound to mouse events
--
myMouseBindings (XConfig {XMonad.modMask = modMask}) = M.fromList $
 
    -- mod-button1, Set the window to floating mode and move by dragging
    [ ((modMask, button1), (\w -> focus w >> mouseMoveWindow w))
 
    -- mod-button2, Raise the window to the top of the stack
    , ((modMask, button2), (\w -> focus w >> windows W.swapMaster))
 
    -- mod-button3, Set the window to floating mode and resize by dragging
    , ((modMask, button3), (\w -> focus w >> mouseResizeWindow w))
 
    -- you may also bind events to the mouse scroll wheel (button4 and button5)
    ]
 
------------------------------------------------------------------------
-- Layouts:
 
-- You can specify and transform your layouts by modifying these values.
-- If you change layout bindings be sure to use 'mod-shift-space' after
-- restarting (with 'mod-q') to reset your layout state to the new
-- defaults, as xmonad preserves your old layout settings by default.
--
-- The available layouts.  Note that each layout is separated by |||,
-- which denotes layout choice.
--
myLayout = mkToggle (single FULL) (tiled ||| Mirror tiled ||| Full)
  where
     -- default tiling algorithm partitions the screen into two panes
     tiled   = Tall nmaster delta ratio
 
     -- The default number of windows in the master pane
     nmaster = 1
 
     -- Default proportion of screen occupied by master pane
     ratio   = 1/2
 
     -- Percent of screen to increment by when resizing panes
     delta   = 3/100
 
------------------------------------------------------------------------
-- Window rules:
 
-- Execute arbitrary actions and WindowSet manipulations when managing
-- a new window. You can use this to, for example, always float a
-- particular program, or have a client always appear on a particular
-- workspace.
--
-- To find the property name associated with a program, use
-- > xprop | grep WM_CLASS
-- and click on the client you're interested in.
--
-- To match on the WM_NAME, you can use 'title' in the same way that
-- 'className' and 'resource' are used below.
--
myManageHook = composeAll . concat $
    [ [className  =? "MPlayer"                                     --> doFloat]
    , [className  =? "Gimp"                                        --> doFloat]
    , [className  =? "Clock"                                      --> doFloat]
    , [(className =? "Firefox" <&&> resource =? "Dialog")          --> doFloat]
    , [resource   =? "desktop_window"                              --> doIgnore]
    , [resource   =? "kdesktop"                                    --> doIgnore ]]
 
-- Whether focus follows the mouse pointer.
myFocusFollowsMouse :: Bool
myFocusFollowsMouse = True
 
 
------------------------------------------------------------------------
-- Status bars and logging
 
-- Perform an arbitrary action on each internal state change or X event.
-- See the 'DynamicLog' extension for examples.
--
-- To emulate dwm's status bar
--
-- > logHook = dynamicLogDzen
--
-- original
-- myLogHook = return ()
-- required for IntelliJ and Android Studio
myLogHook = takeTopFocus
 
------------------------------------------------------------------------
-- Startup hook
 
-- Perform an arbitrary action each time xmonad starts or is restarted
-- with mod-q.  Used by, e.g., XMonad.Layout.PerWorkspace to initialize
-- per-workspace layout choices.
--
-- By default, do nothing.
-- myStartupHook = return ()
-- required for IntelliJ and Android Studio
myStartupHook = setWMName "LG3D"
 
------------------------------------------------------------------------
-- Now run xmonad with all the defaults we set up.
 
-- Run xmonad with the settings you specify. No need to modify this.
--
main = xmonad defaults
--main = xmonad =<< xmobar defaults
 
-- A structure containing your configuration settings, overriding
-- fields in the default config. Any you don't override, will 
-- use the defaults defined in xmonad/XMonad/Config.hs
-- 
-- No need to modify this.
--
defaults = defaultConfig {
      -- simple stuff
        terminal           = myTerminal,
        focusFollowsMouse  = myFocusFollowsMouse,
        borderWidth        = myBorderWidth,
        modMask            = myModMask,
        --numlockMask        = myNumlockMask,
        workspaces         = myWorkspaces,
        normalBorderColor  = myNormalBorderColor,
        focusedBorderColor = myFocusedBorderColor,
 
      -- key bindings
        keys               = myKeys,
        mouseBindings      = myMouseBindings,
 
      -- hooks, layouts
        layoutHook         = myLayout,
        manageHook         = myManageHook,
        logHook            = myLogHook,
        startupHook        = myStartupHook
}
