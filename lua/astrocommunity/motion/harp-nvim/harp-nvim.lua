return {
    {
        "Thorinori/harp-nvim",
        lazy = false,
        dependencies = {
            "AstroNvim/astrocore",
            opts = {
                mappings = {
                    n = {
                        ["<Leader>i"] = {function() require("harp").get() end,desc = ":edit file in given register"},
                        ["<Leader>I"] = {function() require("harp").set() end,desc = "Store current buffer path in given register"},
                        ["<Leader>x"] = {function() require("harp").percwd_get() end,desc = ":edit file in given register, specific to this project"},
                        ["<Leader>X"] = {function() require("harp").percwd_set() end,desc = "Store current buffer path in given register, specific to this project"},
                        ["'"] = {function() require("harp").perbuffer_mark_get() end,desc = "Show local marks"},
                        ["m"] = {function() require("harp").perbuffer_mark_set() end,desc = "Set local mark"},
                        ["<Leader>'"] = {function() require("harp").global_mark_get() end,desc = "Show global marks"},
                        ["<Leader>m"] = {function() require("harp").global_mark_set() end,desc = "Set global mark"},
                        ["<Leader>z"] = {function() require("harp").cd_get() end,desc = "CD to path stored in register"},
                        ["<Leader>Z"] = {function() require("harp").cd_set() end,desc = "Set CWD in register"},
                    }
                },
            },
        },
    }
}
