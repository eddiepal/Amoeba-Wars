import SpriteKit


import UIKit

struct ImageName {
    static let Background = "Background"
    static let Button = "Button"
    static let HistolyticaLeft = "HistolyticaLeft"
    static let FowleriLeft = "FowleriLeft"
    static let ProteusLeft = "ProteusLeft"
    static let Coin = "Coin"
    static let BaseLeft = "Base_Left_Attack"
    static let BaseRight = "Base_Right_Attack"
}

struct Layer {
    static let Background: CGFloat = -500
    static let Button: CGFloat = 4
    static let Left: CGFloat = 5
    static let Right: CGFloat = 5
    static let HUD: CGFloat = 1
}

struct PhysicsCategory {
}

struct GameConfig {
    static let HistolyticaCost = 10
    static let FowleriCost = 25
    static let ProteusCost = 50
}
