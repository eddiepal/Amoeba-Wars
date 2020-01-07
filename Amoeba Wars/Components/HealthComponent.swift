import SpriteKit
import GameplayKit

class HealthComponent: GKComponent {
    
    let maxHealth: CGFloat
    var currentHealth: CGFloat
    let healthBarMaxWidth: CGFloat
    let healthBar: SKShapeNode
    let entityManager: EntityManager
    let hitSound = SKAction.playSoundFileNamed("smallHit.wav", waitForCompletion: false)
    
    init(parentNode: SKNode, barWidth: CGFloat,
         barOffset: CGFloat, health: CGFloat, entityManager: EntityManager) {
        
        self.maxHealth = health
        self.currentHealth = health
        self.entityManager = entityManager
        
        healthBarMaxWidth = barWidth
        healthBar = SKShapeNode(rectOf:
            CGSize(width: healthBarMaxWidth, height: 5), cornerRadius: 1)
        healthBar.fillColor = UIColor.red
        healthBar.strokeColor = UIColor.red
        healthBar.position = CGPoint(x: 0, y: barOffset)
        parentNode.addChild(healthBar)
        
        healthBar.isHidden = true
        super.init()
    }
    
    @discardableResult func takeDamage(_ damage: CGFloat) -> Bool {
        currentHealth = max(currentHealth - damage, 0)
        
        healthBar.isHidden = false
        let healthScale = currentHealth/maxHealth
        let scaleAction = SKAction.scaleX(to: healthScale, duration: 0.5)
        
        healthBar.run(SKAction.group([hitSound, scaleAction]))
        
        if currentHealth == 0 {
            if let entity = entity {
                let baseComponent = entity.component(ofType: BaseComponent.self)
                if baseComponent == nil {
                    entityManager.remove(entity)
                }
            }
        }
        
        return currentHealth == 0
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
