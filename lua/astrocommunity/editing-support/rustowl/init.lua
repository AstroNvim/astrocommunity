return {
  "cordx56/rustowl",
  version = "*",
  build = "cargo binstall rustowl --locked --no-confirm || cargo install rustowl",
  lazy = false,
  opts = {},
}
