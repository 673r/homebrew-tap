cask "logicprodiscordrpc" do
  version "1.0.0" 
  sha256 "f86b214e886cb60a197980989da8b40f6ff38f154db316ba10ea1cd365c83287"

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
