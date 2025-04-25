return {
  "cordx56/rustowl",
  version = "*",
  build = "cd rustowl && cargo install --path . --locked",
  lazy = false,
  opts = {},
}
