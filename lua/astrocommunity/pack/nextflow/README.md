# Nextflow Language Pack

This plugin pack does the following:

- Sets up `nextflow` filetype
- Adds [`vim-language-nextflow`](https://github.com/nextflow-io/vim-language-nextflow) for syntax highlighting
- Adds configuration for [`nextflow_ls`](https://github.com/nextflow-io/language-server) to `lspconfig`
  - See below for instructions on enabling it
- Adds `nextflow` icons to `mini.icons`

## Enabling the Nextflow Language Server

While the Nextflow language server is young in development it is yet to be added to Mason or `nvim-lspconfig` so it currently requires manual configuration to get up and running.

### Requirements

- Java 17 or later
- `language-server-all.jar` downloaded from the [Nextflow Language Server Releases](https://github.com/nextflow-io/language-server/releases) or built from the source

### Add to your `plugins/`

```lua
return {
  "AstroNvim/astrolsp",
  opts = {
    -- This line enables the setup of the Nextfow language server
    servers = { "nextflow_ls" },
    configs = {
      -- Must set the command with the path to your JAR file
      nextflow_ls = {
        cmd = { "java", "-jar", "<path to language-server-all.jar>" },
      },
    },
  },
}
```
