import SpriteKit
import GameplayKit

class Proteus: GKEntity {
    
    init(team: Team, entityManager: EntityManager) {
        super.init()
        let imageName = team.rawValue=="Left" ? ImageName.ProteusLeft : ImageName.ProteusRight;
        let texture = SKTexture(imageNamed: imageName)
        let spriteComponent = SpriteComponent(texture: texture)
        addComponent(spriteComponent)
        addComponent(TeamComponent(team: team))
        addComponent(MoveComponent(maxSpeed: 50, maxAcceleration: 1, radius: Float(texture.size().width * 0.3), entityManager: entityManager))
        addComponent(HealthComponent(parentNode: spriteComponent.node, barWidth: texture.size().width, barOffset: texture.size().height/2, health: 80, entityManager: entityManager))
        addComponent(AttackComponent(damage: 12, destroySelf: false, damageRate: 0.5, recievedDamage: false, sound: SoundManager.sharedInstance.soundSmallHit, entityManager: entityManager))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
