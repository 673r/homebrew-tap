cask "logicprodiscordrpc" do
  version "1.0.0" # Adım 3'teki tag (başındaki 'v' olmadan yazılacak)
  sha256 "59d3e725b6bdcd177661c6a34ec6c5cc825d60b7c099b940283b56b20e43e09c"

  url "https://github.com/673r/LogicProDiscordRPC/releases/download/v#{version}/LogicProDiscordRPC.zip"
  name "Logic Pro Discord RPC"
  desc "Discord Rich Presence for Logic Pro"
  homepage "https://github.com/673r/LogicProDiscordRPC"

  app "LogicProDiscordRPC.app"

  # İşte Sihir Burada: İndirme bittikten sonra otomatik yerel imza atar!
  postflight do
    system_command "codesign",
                   args: ["--force", "--deep", "--sign", "-", "#{appdir}/LogicProDiscordRPC.app"],
                   sudo: false
  end
end
