# Harpoon BufSync

> Bidirectional buffer synchronization between AstroNvim tabline and Harpoon marks

## Overview

Harpoon lets you pin frequently-used files for quick navigation. But your tabline (Heirline) doesn't reflect that order — it tracks buffers by open-time and internal buffer ID.

This recipe bridges that gap with **two keybindings**:

- **Harpoon → Tabline** (`<Leader>bsh`): Closes non-Harpoon buffers, opens missing Harpoon files, and sorts the tabline to match your Harpoon order
- **Tabline → Harpoon** (`<Leader><Leader>b`): Resets your Harpoon marks to match currently open buffers in tabline order

Work naturally with your buffers, snapshot them into Harpoon, or restore your Harpoon set — both directions available on demand.
