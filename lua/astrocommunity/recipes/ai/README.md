# AI Completion Boilerplate

**Website:** <https://docs.astronvim.com/recipes/ai>

This plugin specification configures completion engines to make `<Tab>` function as only snippet navigation and AI suggestion acceptance. Navigating completion items would then be done with other mappings such as `<C-n>`/`<C-p>`. AI plugins can then interface with this by setting up the `vim.g.ai_accept` as a function to do their acceptance command.
