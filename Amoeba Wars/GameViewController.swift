import UIKit
import SpriteKit

class GameViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let aspectRatio = view.bounds.size.width / view.bounds.size.height
        
        let scene =
            GameScene(size:CGSize(width: 640 * aspectRatio, height:640))
        let skView = self.view as! SKView
        skView.showsFPS = true
        skView.showsNodeCount = true
        skView.ignoresSiblingOrder = true
        scene.scaleMode = .aspectFill
        skView.presentScene(scene)
    }
    
    override var prefersStatusBarHidden : Bool  {
        return true
    }
}
