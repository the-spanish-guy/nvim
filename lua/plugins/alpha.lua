return {
	"goolord/alpha-nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},

	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.startify")
    dashboard.section.header.val = {
      [["_____________________                              _____________________ ]],
      [["`-._:  .:'   `:::  .:\           |\__/|           /::  .:'   `:::  .:.-' ]],
      [[    "\      :          \          |:   |          /         :       /     ]],
      [[     "\     ::    .     `-_______/ ::   \_______-'   .      ::   . /      ]],
      [[      "|  :   :: ::'  :   :: ::'  :   :: ::'      :: ::'  :   :: :|       ]],
      [[      "|     ;::         ;::         ;::         ;::         ;::  |       ]],
      [[      "|  .:'   `:::  .:'   `:::  .:'   `:::  .:'   `:::  .:'   `:|       ]],
      [[      "/     :           :           :           :           :    \       ]],
      [[     "/______::_____     ::    .     ::    .     ::   _____._::____\      ]],
      [[                   "`----._:: ::'  :   :: ::'  _.----'                    ]],
      [[                          "`--.       ;::  .--'                           ]],
      [[                              "`-. .:'  .-'                               ]],
      [[                                 "\    / :SPANISH:                        ]],
      [[                                  "\  /                                   ]],
      [[                                   "\/                                    ]],
      [[                                                                          ]],
    }
			dashboard.section.header.opts = {
		 position = "center",
		 hl = "Type",
		}

    dashboard.section.terminal = {
      type = "terminal",
      command = nil,
      width = 69,
      height = 8,
      opts = {
          redraw = true,
          window_config = {},
      },
  }


    dashboard.section.buttons = {
      opts = {
        position = "center"
      }
    }
    dashboard.section.footer = {
      type = "text",
      opts = {
          position = "center",
          hl = "Number",
      }}

		alpha.setup(dashboard.opts)
	end,
}
