import SpriteKit

class GameScene: SKScene {
    
    let margin = CGFloat(30)
    
    var histolyticaButton: ButtonNode!
    var fowleriButton: ButtonNode!
    var proteusButton: ButtonNode!
    
    let coinLeftLabel = SKLabelNode(fontNamed: "Courier-Bold")
    let coinRightLabel = SKLabelNode(fontNamed: "Courier-Bold")
    
    var lastUpdateTimeInterval: TimeInterval = 0
    
    var gameOver = false
    
    override func didMove(to view: SKView) {
        
        
        // MARK: Create entity manager
        
        // MARK: Start background music
        
        let bgMusic = SKAudioNode(fileNamed: SoundFile.BackgroundMusic)
        bgMusic.autoplayLooped = true
        addChild(bgMusic)
        
        // MARK: Add background
        
        let background = SKSpriteNode(imageNamed: ImageName.Background)
        background.position = CGPoint(x: size.width/2, y: size.height/2)
        background.zPosition = Layer.Background
        addChild(background)
        
        // MARK: Add histolytica button
        
        // MARK: Add fowleri button
        
        // MARK: Add proteus button
        
        // MARK: Add coin left indicator
        
        // MARK: Add coin right indicator
        
        // MARK: Add base left
        
        // MARK: Add base right
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) { }
    
    override func update(_ currentTime: TimeInterval) { }
    
    //MARK: - Button methods
    
}
