import SpriteKit
import GameplayKit

class EntityManager {
    
    // 1
    var entities = Set<GKEntity>()
    let scene: SKScene
    var toRemove = Set<GKEntity>()
    
    lazy var componentSystems: [GKComponentSystem] = {
        let baseSystem = GKComponentSystem(componentClass: BaseComponent.self)
        let moveSystem = GKComponentSystem(componentClass: MoveComponent.self)
        let aiSystem = GKComponentSystem(componentClass: AiComponent.self)
        let attackSystem = GKComponentSystem(componentClass: AttackComponent.self)
        return [baseSystem, moveSystem, aiSystem, attackSystem]
    }()
    
    // 2
    init(scene: SKScene) {
        self.scene = scene
    }
    
    // 3
    func add(_ entity: GKEntity) {
        entities.insert(entity)
        
        if let spriteNode = entity.component(ofType: SpriteComponent.self)?.node {
            scene.addChild(spriteNode)
        }
        
        for componentSystem in componentSystems {
            componentSystem.addComponent(foundIn: entity)
        }
    }
    
    // 4
    func remove(_ entity: GKEntity) {
        if let spriteNode = entity.component(ofType: SpriteComponent.self)?.node {
            spriteNode.removeFromParent()
        }
        
        entities.remove(entity)
        
        toRemove.insert(entity)
    }
    
    func update(_ deltaTime: CFTimeInterval) {
        // 1
        for componentSystem in componentSystems {
            componentSystem.update(deltaTime: deltaTime)
        }
        
        // 2
        for currentRemove in toRemove {
            for componentSystem in componentSystems {
                componentSystem.removeComponent(foundIn: currentRemove)
            }
        }
        toRemove.removeAll()
    }
    
    func base(for team: Team) -> GKEntity? {
        for entity in entities {
            if let teamComponent = entity.component(ofType: TeamComponent.self),
                let _ = entity.component(ofType: BaseComponent.self) {
                if teamComponent.team == team {
                    return entity
                }
            }
        }
        return nil
    }
    
    func spawnHistolytica(team: Team) {
        // 1
        guard let teamEntity = base(for: team),
            let teamBaseComponent = teamEntity.component(ofType: BaseComponent.self),
            let teamSpriteComponent = teamEntity.component(ofType: SpriteComponent.self) else {
                return
        }
        
        // 2
        if teamBaseComponent.coins < GameConfig.HistolyticaCost {
            return
        }
        teamBaseComponent.coins -= GameConfig.HistolyticaCost
        scene.run(SoundManager.sharedInstance.soundSpawn)
        
        // 3
        let amoeba = Histolytica(team: team, entityManager: self)
        if let spriteComponent = amoeba.component(ofType: SpriteComponent.self) {
            spriteComponent.node.position = CGPoint(x: teamSpriteComponent.node.position.x, y: CGFloat.random(min: scene.size.height * 0.25, max: scene.size.height * 0.75))
            spriteComponent.node.zPosition = Layer.Amoeba
        }
        add(amoeba)
    }
    
    func spawnFowleri(team: Team) {
        // 1
        guard let teamEntity = base(for: team),
            let teamBaseComponent = teamEntity.component(ofType: BaseComponent.self),
            let teamSpriteComponent = teamEntity.component(ofType: SpriteComponent.self) else {
                return
        }
        
        // 2
        if teamBaseComponent.coins < GameConfig.FowleriCost {
            return
        }
        teamBaseComponent.coins -= GameConfig.FowleriCost
        scene.run(SoundManager.sharedInstance.soundSpawn)
        
        // 3
        let amoeba = Fowleri(team: team, entityManager: self)
        if let spriteComponent = amoeba.component(ofType: SpriteComponent.self) {
            spriteComponent.node.position = CGPoint(x: teamSpriteComponent.node.position.x, y: CGFloat.random(min: scene.size.height * 0.25, max: scene.size.height * 0.75))
            spriteComponent.node.zPosition = Layer.Amoeba
        }
        add(amoeba)
    }
    
    func spawnProteus(team: Team) {
        // 1
        guard let teamEntity = base(for: team),
            let teamBaseComponent = teamEntity.component(ofType: BaseComponent.self),
            let teamSpriteComponent = teamEntity.component(ofType: SpriteComponent.self) else {
                return
        }
        
        // 2
        if teamBaseComponent.coins < GameConfig.ProteusCost {
            return
        }
        teamBaseComponent.coins -= GameConfig.ProteusCost
        scene.run(SoundManager.sharedInstance.soundSpawn)
        
        // 3
        let amoeba = Proteus(team: team, entityManager: self)
        if let spriteComponent = amoeba.component(ofType: SpriteComponent.self) {
            spriteComponent.node.position = CGPoint(x: teamSpriteComponent.node.position.x, y: CGFloat.random(min: scene.size.height * 0.25, max: scene.size.height * 0.75))
            spriteComponent.node.zPosition = Layer.Amoeba
        }
        add(amoeba)
    }
    
    func entities(for team: Team) -> [GKEntity] {
        return entities.compactMap{ entity in
            if let teamComponent = entity.component(ofType: TeamComponent.self) {
                if teamComponent.team == team {
                    return entity
                }
            }
            return nil
        }
    }
    
    func moveComponents(for team: Team) -> [MoveComponent] {
        let entitiesToMove = entities(for: team)
        var moveComponents = [MoveComponent]()
        for entity in entitiesToMove {
            if let moveComponent = entity.component(ofType: MoveComponent.self) {
                moveComponents.append(moveComponent)
            }
        }
        return moveComponents
    }
    
    func entitiesForTeam(_ team: Team) -> [GKEntity] {
        
        return entities.compactMap{ entity in
            if let teamComponent = entity.component(ofType: TeamComponent.self) {
                if teamComponent.team == team {
                    return entity
                }
            }
            return nil
        }
        
    }
}
