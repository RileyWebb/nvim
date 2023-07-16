local wilder = require('wilder')
  wilder.setup({
	modes = {':', '/', '?'},
})

  local highlighters = {
	wilder.pcre2_highlighter(),
	wilder.basic_highlighter(),
  }

  local popupmenu_renderer = wilder.popupmenu_renderer(
	wilder.popupmenu_border_theme({
	  border = 'rounded',
	  empty_message = wilder.popupmenu_empty_message_with_spinner(),
	  highlighter = highlighters,
	  left = {
		' ',
		wilder.popupmenu_devicons(),
		wilder.popupmenu_buffer_flags({
		  flags = ' a + ',
		  icons = {['+'] = '', a = '', h = ''},
		}),
	  },
	  right = {
		' ',
		wilder.popupmenu_scrollbar(),
	  },
	})
  )

  wilder.set_option('renderer', wilder.renderer_mux({
	[':'] = popupmenu_renderer,
	['/'] = popupmenu_renderer,
  }))
