# venn.nvim

Draw ASCII diagrams in Neovim with ease.

**Repository:** <https://github.com/jbyuki/venn.nvim>

1. Enable venn mode with `:ToggleVenn`
   - note this enable vim virtual edit mode which allows editing anywhere in the window
2. now click any place and write down the texts
3. use visual block [Ctrl-v] mode to wrap around the text and press f to draw the box
4. connect the boxes using HJKL towards the next box to connect

```
                        ┌───┐
               ┌────────│ A │──────────┐
               │        └───┘          │
               │                       │
               ▼        ┌───┐          ▼
               B───────►│ C │          D
                        └─┬─┘          │
                          │            │
                        ┌─┴─┐          │
                        │ E │◄─────────┘
                        └───┘
```
