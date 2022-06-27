import QtQuick 2.0
import Felgo 3.0
import QtMultimedia 5.0

//音频管理
Item {
    id: audioManager

    Component.onCompleted: changeBackGroundMusic()

    //背景音乐
    BackgroundMusic{
        id:menuMusic

        autoPlay: false

        source: "../assets/audio/music/menuMusic.mp3"

    }
    BackgroundMusic{
        id: gamingMusic

        autoPlay: false

        source: "../assets/audio/music/playMusic.mp3"
    }

    //游戏音效
    SoundEffect{
        id: playerJump
        source: "../assets/audio/sounds/phaseJump1.wav"
    }
    SoundEffect{
        id: playerHit
        source: "../assets/audio/sounds/whizz.wav"
    }
    SoundEffect{
        id: playerDefeated
        source: "../assets/audio/sounds/lose.wav"
    }
    SoundEffect{
        id: playerInvincible
        source: "../assets/audio/sounds/threeTone2.wav"
    }
    SoundEffect{
        id: collectCoin
        source:"../assets/audio/sounds/coin_3.wav"
    }
    SoundEffect{
        id: collectMushroom
        source: "../assets/audio/sounds/zapThreeToneUp.wav"
    }
    SoundEffect{
        id: finish
        source: "../assets/audio/sounds/coin-04.wav"
    }
    SoundEffect{
        id: walkerMonsterDefeated
        source: "../assets/audio/sounds/bird-chirp.wav"
    }
    SoundEffect{
        id: jumperMonsterDefeated
        source: "../assets/audio/sounds/twitch.wav"
    }
    SoundEffect{
        id: start
        source: "../assets/audio/sounds/yahoo.wav"
    }
    SoundEffect{
        id: click
        source: "../assets/audio/sounds/click1.wav"
    }

    function changeBackGroundMusic(){
        if(activeScene === gameScene){
//            if()
        }
    }

    function playSound(sound){
        if(sound === "playerJump")
          playerJump.play()
          else if(sound === "playerHit")
          playerHit.play()
        else if(sound === "playerDefeated")
          playerDie.play()
        else if(sound === "playerInvincible")
          playerInvincible.play()
        else if(sound === "collectCoin")
          collectCoin.play()
          else if(sound === "collectMushroom")
          collectMushroom.play()
        else if(sound === "finish")
          finish.play()
        else if(sound === "walkerMonsterDefeated")
          opponentWalkerDie.play()
        else if(sound === "jumperMonsterDefeated")
          opponentJumperDie.play()
        else if(sound === "start")
          start.play()
        else if(sound === "click")
          click.play()
        else
          console.debug("unknown sound name:", sound)
    }

}
