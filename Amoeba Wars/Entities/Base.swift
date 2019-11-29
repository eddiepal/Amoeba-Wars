import SpriteKit
import GameplayKit

// 1
class Base: GKEntity {
    
    init(imageName: String, team: Team) {
        super.init()
        
        // 2
        let spriteComponent = SpriteComponent(texture: SKTexture(imageNamed: imageName))
        addComponent(spriteComponent)
        
        addComponent(TeamComponent(team: team))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
