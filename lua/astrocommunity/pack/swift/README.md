# Swift Language Pack

**Requirements:**

1. Make sure you have [sourcekit-lsp](https://github.com/apple/sourcekit-lsp) installed on your machine.

2. Install Xcode Device Simulators:
   To enable simulator functionality from within Neovim, you need to have Xcode Device Simulators installed on your machine. You can install these simulators from Xcode.

3. Configure the Plugin Options (`opts` table):
   To run the simulator from within Neovim, you'll need to configure the plugin's `opts` table. Add the name of the desired simulator device to the `opts` table in your Neovim configuration. Here's an example:
   Refer to [xBase](https://github.com/kkharji/xbase#neovim-3) documentation for more details on options that can be passed to the plugin.

```lua
opts = {
  -- ... (other options)

  simctl = {
    iOS = {
      -- "iPhone 15", -- Uncomment and specify the devices you want to include
      -- Add more iOS devices as needed, e.g., "iPhone 12", "iPad Pro (11-inch)", etc.
    },
    watchOS = {},
    tvOS = {},
  },

  -- ... (other options)
}
```
