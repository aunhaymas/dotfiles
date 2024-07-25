return{


    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    config = function()

    end,
    git_status = {
      symbols = {
	--change type
	added = "✚",
	deleted = "✖",
	modified = "",
	renamed   = "󰁕",-- this can only be used in the git_status source
        untracked = "",
        ignored   = "",
        unstaged  = "󰄱",
        staged    = "",
        conflict  = "",
      },
      window = {
	position = "float",
	mappings = {
	  ["A"] = "git_add_all",
	  ["gu"]= "git_unstage_file",
	  ["gr"]= "git_revert_file",
	  ["gc"]= "git_commit",
	  ["gp"]= "git_push",
	  ["ga"]= "git_commit_a",
	}
      }
    }
}


