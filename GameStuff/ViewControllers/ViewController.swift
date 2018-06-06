//
//  ViewController.swift
//  GameStuff
//
//  Created by Augusto Avelino on 05/06/18.
//  Copyright © 2018 Augusto Avelino. All rights reserved.
//

import UIKit
import SpriteKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let scene = GameScene(size: view.frame.size)
        guard let skView = view as? SKView else { return }
        skView.presentScene(scene)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

