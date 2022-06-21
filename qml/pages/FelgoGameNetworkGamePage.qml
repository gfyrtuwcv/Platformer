import Felgo 3.0
import QtQuick 2.0
import "../helper"

Page {
    id: page

    FelgoGameNetwork {
        id: gameNetwork
        gameId: Constants.felgoGameNetworkGameId // create your own gameId in the Web Dashboard
        secret: Constants.felgoGameNetworkSecret // https://cloud.felgo.com/games
        gameNetworkView: gameNetworkUI // we use the id of our view below
    }

    GameNetworkView { // adds the default game network UI
        id: gameNetworkUI

        onBackClicked: page.navigationStack.pop()
    }
}
