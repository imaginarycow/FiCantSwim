//
//  GameViewController.swift
//  Fi Can't Swim
//
//  Created by beltranmc on 2/17/17.
//  Copyright © 2017 Ramiro Beltran. All rights reserved.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        buildCharacters()
        
        let scene = MenuScene(size: view.bounds.size)
        let SKView = view as! SKView
        currView = SKView
        SKView.ignoresSiblingOrder = true
        SKView.showsFPS = true
        SKView.showsNodeCount = true
        //SKView.showsPhysics = true
        SKView.presentScene(scene)
        //printFonts()
        
    }

    override var shouldAutorotate: Bool {
        return false
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    func printFonts() {
        let fontFamilyNames = UIFont.familyNames
        for familyName in fontFamilyNames {
            print("------------------------------")
            print("Font Family Name = [\(familyName)]")
            let names = UIFont.fontNames(forFamilyName: familyName)
            print("Font Names = [\(names)]")
        }
    }
}
