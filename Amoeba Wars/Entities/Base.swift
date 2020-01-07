import SpriteKit
import GameplayKit

// 1
class Base: GKEntity {
    
    init(imageName: String, team: Team, entityManager: EntityManager) {
        super.init()
        
        // 2
        let spriteComponent = SpriteComponent(texture: SKTexture(imageNamed: imageName))
        addComponent(spriteComponent)
        
        addComponent(TeamComponent(team: team))
        addComponent(BaseComponent())
        addComponent(MoveComponent(maxSpeed: 0, maxAcceleration: 0, radius: Float(spriteComponent.node.size.width / 2), entityManager: entityManager))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
