# Avante.nvim

avante.nvim is a Neovim plugin designed to emulate the behaviour of the Cursor AI IDE. It provides users with AI-driven code suggestions and the ability to apply these recommendations directly to their source files with minimal effort.

Everytime you open a file, the plugin will ask you to enter a Anthropic API key for Claude 3.5 Sonnet model. To avoid this, set an environment variable to store your API key:

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

Repository: [https://github.com/yetone/avante.nvim](https://github.com/yetone/avante.nvim)
