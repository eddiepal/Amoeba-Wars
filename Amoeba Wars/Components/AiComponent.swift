import Foundation
import GameplayKit

enum AmoebaType {
    case histolytica
    case fowleri
    case proteus
    
    static let allValues = [histolytica, fowleri, proteus]
}

class AiComponent: GKComponent {
    
    var amoebaChoice = AmoebaType.histolytica
    let entityManager: EntityManager
    
    init(entityManager: EntityManager) {
        self.entityManager = entityManager
        super.init()
    }
    
    override func update(deltaTime seconds: TimeInterval) {
        
        guard let teamComponent = entity?.component(ofType: TeamComponent.self),
            let baseComponent = entity?.component(ofType: BaseComponent.self) else {
                return
        }
        
        if amoebaChoice == .histolytica && baseComponent.coins >= GameConfig.HistolyticaCost {
            entityManager.spawnHistolytica(team: teamComponent.team)
            amoebaChoice = AmoebaType.allValues[Int(arc4random()) % AmoebaType.allValues.count]
        }
        
        if amoebaChoice == .fowleri && baseComponent.coins >= GameConfig.FowleriCost {
            entityManager.spawnFowleri(team: teamComponent.team)
            amoebaChoice = AmoebaType.allValues[Int(arc4random()) % AmoebaType.allValues.count]
        }
        
        if amoebaChoice == .proteus && baseComponent.coins >= GameConfig.ProteusCost {
            entityManager.spawnProteus(team: teamComponent.team)
            amoebaChoice = AmoebaType.allValues[Int(arc4random()) % AmoebaType.allValues.count]
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
