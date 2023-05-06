return {
  'j-morano/buffer_manager.nvim',

  opts = {
    select_menu_item_commands = {
      c = {
        key = '<C-c>',
        command = 'bd',
      },

      t = {
        key = '<C-t>',
        command = 'tabe',
      },

      v = {
        key = '<C-v>',
        command = 'split'
      },

      h = {
        key = '<C-x>',
        command = 'vsplit'
      }
    }
  },
}
