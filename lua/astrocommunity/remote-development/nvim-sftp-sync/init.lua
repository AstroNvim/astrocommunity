return {
  "dcampos/nvim-sftp-sync",
  build = ":UpdateRemotePlugins",
  cmd = {
    "SftpDisable",
    "SftpEnable",
    "SftpOpenLog",
    "SftpReset",
    "SftpSelectServer",
    "SftpSend",
  },
}
