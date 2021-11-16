return {
  -- color_scheme = 'Ayu Mirage',
  -- color_scheme = 'Batman',
  -- color_scheme = 'BlulocoDark',
  -- color_scheme = 'ChallengerDeep',

  -- warning: `color_scheme` overrides all `colors` options!
  -- Challenger Deep (modified)
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

  -- -- Material Oceanic
  -- colors = {
  --   foreground = "#b0bec5",
  --   background = "#263238",
  --   cursor_bg = "#cbe1e7",
  --   cursor_border = "#cbe1e7",
  --   cursor_fg = "#1e1c31",
  --   selection_bg = "#546e7a",
  --   selection_fg = "#fff",

  --   ansi = { "#eeffff","#ff5370","#c3e88d","#f78c6c","#82aaff","#c792ea","#89ddff","#546e7a" },
  --   brights = { "#eeffff","#f07178","#c3e88d","#ffcb6b","#82aaff","#c792ea","#89ddff","#546e7a" },
  -- },

  -- Custom (borrowing heavily from Challenger Deep & Nightfox)
  -- colors = {
  --   foreground = "#abb2bf",
  --   background = "#192330",
  --   cursor_bg = "#cbe1e7",
  --   cursor_border = "#cbe1e7",
  --   cursor_fg = "#1e1c31",
  --   selection_bg = "#5f7e97",
  --   selection_fg = "#fff",

  --   -- CD/NF Blend
  --   -- ansi = { "#141228","#ff5458","#58cd8b","#f4a261","#719cd6","#906cff","#63cdcf","#a6b3cc" },
  --   -- brights = { "#475072","#ff8080","#95ffa4","#ffcb6b","#84cee4","#c991e1","#59f0ff","#cbe3e7" },

  --   -- variant
  --   -- ansi = { "#141228","#ff5458","#62d196","#ffb378","#65b2ff","#906cff","#3c909b","#a6b3cc" },
  --   -- brights = { "#282c34","#ff8080","#95ffa4","#ffcb6b","#5cc8ff","#c678dd","#56b6c2","#cbe3e7" },

  --   -- -- nightfox?
  --   -- ansi = { "#393b44","#c94f6d","#81b29a","#f4a261","#719cd6","#9d79d6","#63cdcf","#a6b3cc" },
  --   -- brights = { "#475072","#d6616b","#58cd8b","#f6a878","#84cee4","#b8a1e3","#59f0ff","#cbe3e7" },

  --   -- ansi = { "#d6deeb","#ef5350","#addb67","#f78c6c","#82aaff","#7e57c2","#7fdbca","#637777" },
  --   -- brights = { "#eeffff","#f07178","#addb67","#ecc48d","#82aaff","#c792ea","#7fdbca","#637777" },
  -- },

  adjust_window_size_when_changing_font_size = false,
  bold_brightens_ansi_colors = false,
  harfbuzz_features = {"calt=0", "clig=0", "liga=0"},
  hide_tab_bar_if_only_one_tab = true,
}
