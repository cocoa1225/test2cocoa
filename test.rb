::RBNACL_LIBSODIUM_GEM_LIB_PATH = './libsodium.dll'

require 'discordrb'
require 'open3'
require 'twitter'

bot = Discordrb::Commands::CommandBot.new token: 'MzQxNTkxOTIyNTUwNTA1NDcy.DSfVmg.dwQl5M1QhcUm41AdKPdVPexdaSg', prefix: '!'

play = 0

#遊び

bot.command (:taiki) do |event|
  event.send_message"佐野太紀チャレンジ!"

  array = Array["佐","野","太","紀"]
    sano = rand(0..3)
    sano1 = rand(0..3)
    sano2 = rand(0..3)
    sano3 = rand(0..3)
      sleep(1)
      event.send_message"「#{array[sano]}#{array[sano1]}#{array[sano2]}#{array[sano3]}」"

    end

    def oya
      @oya=0
        fin=0

    ai = rand(1..10)

    while fin < 1 do

      @oya += ai

      if @oya >= 19
        fin=1
      end

    if @oya <= 15
      plus1 = rand(1..6)
      @oya += plus1
    end

    end
    end

    bot.command (:blackjack) do |event|   #コマンド
      player = 0
     pfin = 0
     oya()
    @hito = event.user.name
      toranpu = rand(1..11)
      toranpu2 = rand(1..10)
       player +=toranpu
       player +=toranpu2

       event.send_message"
現在の手札の合計は(#{player})です
もう一枚カードを引きますか？ 1=ヒット 0=スタンド"

    while pfin < 1 do
       event.user.await(:guess) do |guess_event|

         ansplayer = guess_event.message.content.to_i

         if ansplayer == 0
           pfin =1

         elsif ansplayer == 1
           againplus = rand(1..11)
               player +=againplus
               event.send_message"
現在の手札の合計は(#{player})です
もう一枚カードを引きますか？ 1=ヒット 0=スタンド"

    else
      event.send_message"1か0を入力しろハゲ"
        end

    if player >= 22
      event.send_message"21を超えたため終了します"
      pfin = 1
    end

    end
    ""
    end
    event.send_message"AIが「#{@oya}」、#{@hito}が「#{player}」です"

    if @oya==player
      event.send_message"結果は引き分けです"

    elsif @oya >= 22 && player >= 22
      event.send_message"両方バストで引き分けです"

    elsif @oya >=22 && player <= 22
      event.send_message"AIがバスト、#{@hito}の勝ちです"

    elsif player >=22 && @oya <=22
      event.send_message"#{@hito}がバスト、AIの勝ちです"

    elsif @oya > player
      event.send_message"AIの勝ちです"

    else
      event.send_message"#{@hito}の勝ちです"
    end
    player = 0
    ""
    end
    #ここまでブラックジャック

    def tweet

      client = Twitter::REST::Client.new do |config|     #ツイートするアカウントの情報を取得
        config.consumer_key        = "K4R6MNRZzLkYU73QOtoT8yqct"
        config.consumer_secret     = "8H9TT23mPuuhQ16olm1TwO05wSpkHIqIW2BtfVah6QRW3JiztL"
        config.access_token        = "3501608173-wbOHmiIPi0orTcYWSDIUvTvWk0Yw43kA1lJIxoC"
        config.access_token_secret = "rJ7Fa8yk6jhYBwwPFZpxndo6Ar4prP5kJnK01uOiTXx2i"
    end
        client.update("Discordから「#{@hito}」のツイートです。『#{@naiyou}』") #実際にツイートする
    end

    bot.command (:tweet) do |client|

      @hito = client.user.name #コマンドを使った人の名前を@hitoに保存する
      client.send_message"ツイートしたい内容を入力してください"
      client.user.await(:wait) do |tweet|     #ツイートする内容を取得する

        @naiyou = tweet.message.content  #ツイートする内容を@naiyouに保存する

    tweet()   #def tweet に飛ぶ
    client.send_message"ツイートしました"
    end
    ""
    end
    #ここまでツイートシステム

      bot.command (:roseliacd) do |market|
        market.send_message "https://itunes.apple.com/jp/album/black-shout-ep/1226411401"
        market.send_message "https://itunes.apple.com/jp/album/re-birth-day-ep/id1253751814"
        market.send_message "https://itunes.apple.com/jp/album/%E7%86%B1%E8%89%B2%E3%82%B9%E3%82%BF%E3%83%BC%E3%83%9E%E3%82%A4%E3%83%B3-ep/1277565987"
        market.send_message "https://itunes.apple.com/jp/album/oneness-ep/1317171042"
      end


      array = Array["Skyrim","PUBG","Rust","カスタムメイド3D2","LoL","CSGO","Outlast","Fallout4","Fallout NV","elona","osu!","H1Z1","Destiny2","バンドリ","アズールレーン"]


      bot.command (:game) do |event|

      ransu = rand(0..15)

        event.send_message"これをやりましょう「#{array[ransu]}」"
      end

bot.command(:summon) do |event|
    bot.game = ("Discord")
  #!summonと打たれた時に実行する
channel = event.user.voice_channel
  #channelという変数?はevent.user.voice_channel(おそらくユーザーがボイスチャンネルに入っているかどうかを判定するやつ)
  next "ボイスチャンネルに入室してください！" unless channel
  #!summonと打った人がボイスチャンネルに入ってない時に表示する文  nextとかはよくわからない
  bot.voice_connect(channel)
  #botがボイスチャンネルに入った時に実行する
  "#{channel.name}に入室しました
!helpで現在再生可能な曲とコマンドが表示されます。"
end


bot.command (:risa)  do |event|
    if @playing === 1
      event.voice.stop_playing
      Open3.capture3('del /s *mp3')
      play = 1
    end

sleep (2)

    play = 0
     bot.game = ("陽だまりロードナイト")
   i = 0
    voice_bot = event.voice
     while play < 1 do
       @playing = 1
       i += 1
       a = i%10
       if a ===0
         event.send_message "#{i}回目の再生です。"
       end
       voice_bot.play_file('data/risa.m4a')
     end
  end

bot.run
