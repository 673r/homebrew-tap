cask "logicprodiscordrpc" do
  version "1.0.0" 
  sha256 "59d3e725b6bdcd177661c6a34ec6c5cc825d60b7c099b940283b56b20e43e09c"

url "https://github.com/673r/LogicProDiscordRPC/releases/download/v#{version}/LogicProDiscordRPC.zip"
  name "Logic Pro Discord RPC"
  desc "Discord Rich Presence for Logic Pro"
  homepage "https://github.com/673r/LogicProDiscordRPC"

  app "LogicRPC.app"

  postflight do
    system_command "xattr", args: ["-cr", "#{appdir}/LogicRPC.app"], sudo: false, must_succeed: false
    system_command "codesign", args: ["--force", "--deep", "--sign", "-", "#{appdir}/LogicRPC.app"], sudo: false, must_succeed: false
  end
end
