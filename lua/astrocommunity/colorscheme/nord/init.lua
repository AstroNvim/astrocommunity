return {
  'shaunsingh/nord.nvim',
  opts = function(_, opts)
     markdown = {
        headline_highlights = {
            "Headline1",
            "Headline2",
            "Headline3",
            "Headline4",
            "Headline5",
            "Headline6",
        },
        codeblock_highlight = "CodeBlock",
        dash_highlight = "Dash",
        quote_highlight = "Quote",
    },
  return opts
  end
  vim.g = {
    nord_contrast = true,
    nord_borders = false,
    nord_disable_background = false,
    nord_italic = true,
    nord_uniform_diff_background = true,
    nord_bold = false,
   }
  
}
