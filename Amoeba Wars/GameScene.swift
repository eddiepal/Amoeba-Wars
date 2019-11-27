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
        histolyticaButton = ButtonNode(iconName: ImageName.HistolyticaLeft, text: String(GameConfig.HistolyticaCost), onButtonPress: histolyticaPressed)
        histolyticaButton.position = CGPoint(x: size.width * 0.25, y: margin + histolyticaButton.size.height / 2)
        addChild(histolyticaButton)
        
        // MARK: Add fowleri button
        
        fowleriButton = ButtonNode(iconName: ImageName.FowleriLeft, text: String(GameConfig.FowleriCost), onButtonPress: fowleriPressed)
        fowleriButton.position = CGPoint(x: size.width * 0.50, y: margin + fowleriButton.size.height / 2)
        addChild(fowleriButton)
        
        // MARK: Add proteus button
        
        proteusButton = ButtonNode(iconName: ImageName.ProteusLeft, text: String(GameConfig.ProteusCost), onButtonPress: proteusPressed)
        proteusButton.position = CGPoint(x: size.width * 0.75, y: margin + proteusButton.size.height / 2)
        addChild(proteusButton)
        
        // MARK: Add coin left indicator
        
        let coinLeft = SKSpriteNode(imageNamed: ImageName.Coin)
        
        coinLeft.position = CGPoint(x: margin + coinLeft.size.width/2,
                                    y: size.height - margin - coinLeft.size.height/2)
        addChild(coinLeft)
        coinLeftLabel.fontSize = 50
        coinLeftLabel.fontColor = SKColor.black
        coinLeftLabel.position = CGPoint(x: coinLeft.position.x + coinLeft.size.width/2 + margin, y: coinLeft.position.y)
        coinLeftLabel.zPosition = Layer.HUD
        coinLeftLabel.horizontalAlignmentMode = .left
        coinLeftLabel.verticalAlignmentMode = .center
        coinLeftLabel.text = "0"
        self.addChild(coinLeftLabel)
        
        // MARK: Add coin right indicator
        
        let coinRight = SKSpriteNode(imageNamed: ImageName.Coin)
        
        coinRight.position = CGPoint(x: size.width - margin - coinRight.size.width/2,
                                     y: size.height - margin - coinRight.size.height/2)
        addChild(coinRight)
        coinRightLabel.fontSize = 50
        coinRightLabel.fontColor = SKColor.black
        coinRightLabel.position = CGPoint(x: coinRight.position.x - coinRight.size.width/2 - margin, y: coinRight.position.y)
        coinRightLabel.zPosition = Layer.HUD
        coinRightLabel.horizontalAlignmentMode = .right
        coinRightLabel.verticalAlignmentMode = .center
        coinRightLabel.text = "0"
        self.addChild(coinRightLabel)
        
        // MARK: Add base left
        
        // MARK: Add base right
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) { }
    
    override func update(_ currentTime: TimeInterval) { }
    
    //MARK: - Button methods
    func histolyticaPressed() {
        print("Histolytica pressed!")
    }
    
    func fowleriPressed() {
        print("Fowleri pressed!")
    }
    
    func proteusPressed() {
        print("Proteus pressed!")
    }
    
}
