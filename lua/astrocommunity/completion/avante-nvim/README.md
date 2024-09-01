Avante.nvim is a Neovim plugin that emulates the Cursor AI IDE's functionality. It provides AI-driven code suggestions and allows users to apply these recommendations directly to their source files with minimal effort.

Everytime you open a file, the plugin will ask you to enter an Anthropic API key for Claude 3.5 Sonnet. To avoid repeating this, set an environment variable to store your API key locally:

For Claude:

```sh
export ANTHROPIC_API_KEY=your-api-key
```

For OpenAI:

```sh
export OPENAI_API_KEY=your-api-key
```

For Azure OpenAI:

```sh
export AZURE_OPENAI_API_KEY=your-api-key
```

> [!IMPORTANT]
>
> `avante.nvim` is currently only compatible with Neovim 0.10.1 or later.

For more information, please refer to:

Repository: <https://github.com/yetone/avante.nvim>
