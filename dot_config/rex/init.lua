rex.bind("ctrl+space>shift+r", "client.config.reload")
rex.bind("ctrl+space>shift+;", "client.palette.toggle")



-- Sessions
rex.bind("ctrl+space>shift+4", "session.rename")
rex.bind("ctrl+space>s", "session.switch")



-- Tabs
rex.bind("ctrl+space>,", "client.tab.rename")
rex.bind("ctrl+space>t", "client.tab.new")
rex.bind("ctrl+space>n", "client.tab.next")
rex.bind("ctrl+space>p", "client.tab.previous")



-- Panes
rex.bind("ctrl+space>c", "pane.close")
rex.bind("ctrl+space>shift+t", "pane.move_to_new_tab")
rex.bind("ctrl+space>shift+[", "pane.move.left")
rex.bind("ctrl+space>shift+]", "pane.move.right")
rex.bind("ctrl+space>z", "pane.zoom")
rex.bind("ctrl+space>v", "pane.split", { direction = "right" })
rex.bind("ctrl+space>x", "pane.split", { direction = "down" })

rex.bind("alt+left", "pane.focus", { direction = "left", wrap = false })
rex.bind("alt+down", "pane.focus", { direction = "down", wrap = false })
rex.bind("alt+up", "pane.focus", { direction = "up", wrap = false })
rex.bind("alt+right", "pane.focus", { direction = "right", wrap = false })

rex.bind("alt+h", "pane.focus", { direction = "left", wrap = false })
rex.bind("alt+j", "pane.focus", { direction = "down", wrap = false })
rex.bind("alt+k", "pane.focus", { direction = "up", wrap = false })
rex.bind("alt+l", "pane.focus", { direction = "right", wrap = false })

rex.bind("ctrl+space>h", "pane.focus", { direction = "left", wrap = false })
rex.bind("ctrl+space>j", "pane.focus", { direction = "down", wrap = false })
rex.bind("ctrl+space>k", "pane.focus", { direction = "up", wrap = false })
rex.bind("ctrl+space>l", "pane.focus", { direction = "right", wrap = false })

rex.bind("ctrl+space>space", "pane.balance")
rex.bind("ctrl+space>shift+,", "pane.resize", { direction = "left" })
rex.bind("ctrl+space>shift+.", "pane.resize", { direction = "right" })
rex.bind("ctrl+space>-", "pane.resize", { direction = "down" })
rex.bind("ctrl+space>shift+=", "pane.resize", { direction = "up" })



-- Pane Resize Mode
rex.mode("resize", { exclusive = true })
rex.bind("ctrl+space>r", "client.mode.enter", { name = "resize" })

rex.bind("resize/left", "pane.resize", { direction = "left" })
rex.bind("resize/down", "pane.resize", { direction = "down" })
rex.bind("resize/up", "pane.resize", { direction = "up" })
rex.bind("resize/right", "pane.resize", { direction = "right" })

rex.bind("resize/h", "pane.resize", { direction = "left" })
rex.bind("resize/j", "pane.resize", { direction = "down" })
rex.bind("resize/k", "pane.resize", { direction = "up" })
rex.bind("resize/l", "pane.resize", { direction = "right" })

rex.bind("resize/=", "pane.balance")
