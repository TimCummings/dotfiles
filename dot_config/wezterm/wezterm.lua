return {
  -- color_scheme = 'Ayu Mirage',
  -- color_scheme = 'Batman',
  -- color_scheme = 'BlulocoDark',
  -- color_scheme = 'ChallengerDeep',
  -- color_scheme = 'Darkside',
  -- color_scheme = 'FirefoxDev',
  -- color_scheme = 'Firewatch',
  -- color_scheme = 'MaterialDark',
  -- color_scheme = 'OceanicMaterial',
  -- color_scheme = 'Thayer Bright',
  -- color_scheme = 'onedark',

  -- warning: `color_scheme` overrides all `colors` options!
  colors = {
    foreground = "#cbe1e7",
    background = "#1e1c31",
    cursor_bg = "#cbe1e7",
    cursor_border = "#cbe1e7",
    cursor_fg = "#1e1c31",
    selection_bg = "#cbe1e7",
    selection_fg = "#1e1c31",

    ansi = { "#141228","#ff5458","#62d196","#ffb378","#65b2ff","#906cff","#63f2f1","#a6b3cc" },
    brights = { "#565575","#ff8080","#95ffa4","#ffe9aa","#91ddff","#c991e1","#aaffe4","#cbe3e7" },
  },

  adjust_window_size_when_changing_font_size = false,
  bold_brightens_ansi_colors = false,
  harfbuzz_features = {"calt=0", "clig=0", "liga=0"},
  hide_tab_bar_if_only_one_tab = true,
}
