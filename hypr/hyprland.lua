-- Minimal Hyprland config for CachyOS + own dots + Quickshell
-- Config path: ~/.config/hypr/hyprland.lua  (Hyprland 0.55+)
-- Wiki: https://wiki.hypr.land/Configuring/Start/

require("keybinds")

----------------
---- MONITOR ---
----------------
-- Run `hyprctl monitors` after first login and pin this.
hl.monitor({
    output   = "DP-1",
    mode     = "2560x1440@143.97",
    position = "0x0",
    scale    = "1",
})

hl.monitor({
    output   = "DP-3",
    mode     = "2560x1440@143.97",
    position = "2560x0",
    scale    = "1",
})

hl.workspace_rule({
  workspace   = "1",
  monitor     = "DP-3",
  default     = true,
  persistent  = true
})

hl.workspace_rule({
  workspace   = "2",
  monitor     = "DP-1",
  default     = true,
  persistent  = true
})

----------------
---- AUTOSTART -
----------------
hl.on("hyprland.start", function()
    -- Portal / polkit
    hl.exec_cmd("systemctl --user start hyprpolkitagent.service")
    hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")

    -- Wallpaper (optional; comment out if you use something else)
    hl.exec_cmd("hyprpaper")

    -- Desktop shell
    hl.exec_cmd("qs -n")
end)

----------------
---- ENV -------
----------------
-- If you later switch to UWSM, move these to ~/.config/uwsm/env instead.
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")
hl.env("QT_QPA_PLATFORM", "wayland")
hl.env("GDK_BACKEND", "wayland,x11")
hl.env("MOZ_ENABLE_WAYLAND", "1")
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

----------------
---- LOOK ------
----------------
hl.config({
    general = {
        gaps_in     = 4,
        gaps_out    = 8,
        border_size = 2,
        col = {
            active_border   = "rgba(89b4faee)",
            inactive_border = "rgba(313244aa)",
        },
        layout = "dwindle",
        resize_on_border = false,
        allow_tearing    = false,
    },

    decoration = {
        rounding = 8,
        active_opacity   = 1.0,
        inactive_opacity = 1.0,
        shadow = {
            enabled = false,
        },
        blur = {
            enabled = true,
            size    = 4,
            passes  = 1,
        },
    },

    animations = {
        enabled = true,
    },

    dwindle = {
        preserve_split = true,
    },

    input = {
        kb_layout    = "us",
        follow_mouse = 1,
        sensitivity  = 0,
        touchpad = {
            natural_scroll = true,
        },
    },

    misc = {
        force_default_wallpaper = 0,
        disable_hyprland_logo   = true,
        disable_splash_rendering = true,
    },

    xwayland = {
        force_zero_scaling = true,
    },
})

----------------
---- RULES -----
----------------
hl.window_rule({
    name  = "suppress-maximize-events",
    match = { class = ".*" },
    suppress_event = "maximize",
})

hl.window_rule({
    name  = "float-pickers",
    match = { title = "^(Open File|Save File|Open Folder|Save As)$" },
    float = true,
})

-- Keep Quickshell surfaces as layers, not tiled windows
hl.layer_rule({
    name  = "quickshell-blur",
    match = { namespace = "^quickshell" },
    blur  = true,
})
