import Foundation
import SpriteKit
import GameplayKit

class AttackComponent: GKComponent {
    
    let damage: CGFloat
    let destroySelf: Bool
    let damageRate: CGFloat
    var previousDamageTime: TimeInterval
    let recievedDamage: Bool
    let sound: SKAction
    let entityManager: EntityManager
    
    init(damage: CGFloat, destroySelf: Bool, damageRate: CGFloat, recievedDamage: Bool, sound: SKAction, entityManager: EntityManager) {
        self.damage = damage
        self.destroySelf = destroySelf
        self.damageRate = damageRate
        self.recievedDamage = recievedDamage
        self.previousDamageTime = 0
        self.entityManager = entityManager
        self.sound = sound
        super.init()
    }

    override func update(deltaTime seconds: TimeInterval) {
        
        super.update(deltaTime: seconds)
        
        guard let teamComponent = entity?.component(ofType: TeamComponent.self),
            let spriteComponent = entity?.component(ofType: SpriteComponent.self) else
        {
                return
        }
        
        var damageCaused = false
        let enemyEntities = entityManager.entitiesForTeam(teamComponent.team.oppositeTeam())
        for enemyEntity in enemyEntities
        {
            
            guard let enemySpriteComponent = enemyEntity.component(ofType: SpriteComponent.self),
                let enemyHealthComponent = enemyEntity.component(ofType: HealthComponent.self) else
            {
                    continue
            }
            
            // collision detection ... basically
            if (spriteComponent.node.calculateAccumulatedFrame().intersects(enemySpriteComponent.node.calculateAccumulatedFrame()))
            {
                
                if (CGFloat(CACurrentMediaTime() - previousDamageTime) > damageRate) {
                    
                    spriteComponent.node.parent?.run(sound)
                    if (recievedDamage)
                    {
                        damageCaused = true
                    } else
                    {
                        previousDamageTime = CACurrentMediaTime()
                    }
                    
                    enemyHealthComponent.takeDamage(damage)

                    if destroySelf
                    {
                        entityManager.remove(entity!)
                    }
                }
            }
        }
        
        if (damageCaused)
        {
            previousDamageTime = CACurrentMediaTime()
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
