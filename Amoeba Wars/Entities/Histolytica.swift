import SpriteKit
import GameplayKit

class Histolytica: GKEntity {
    
    init(team: Team) {
        super.init()
        let imageName = team.rawValue=="Left" ? ImageName.HistolyticaLeft : ImageName.HistolyticaRight;
        let texture = SKTexture(imageNamed: imageName)
        let spriteComponent = SpriteComponent(texture: texture)
        addComponent(spriteComponent)
        addComponent(TeamComponent(team: team))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
