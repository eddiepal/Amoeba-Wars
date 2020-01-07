//
//  Fowleri.swift
//  Amoeba Wars
//
//  Created by 20075129 on 07/01/2020.
//  Copyright © 2020 20075129. All rights reserved.
//

import SpriteKit
import GameplayKit

class Fowleri: GKEntity {
    
    init(team: Team, entityManager: EntityManager) {
        super.init()
        let imageName = team.rawValue=="Left" ? ImageName.FowleriLeft : ImageName.FowleriRight;
        let texture = SKTexture(imageNamed: imageName)
        let spriteComponent = SpriteComponent(texture: texture)
        addComponent(spriteComponent)
        addComponent(TeamComponent(team: team))
        addComponent(MoveComponent(maxSpeed: 50, maxAcceleration: 1, radius: Float(texture.size().width * 0.3), entityManager: entityManager))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
