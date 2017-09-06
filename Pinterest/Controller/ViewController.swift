//
//  ViewController.swift
//  Pinterest
//
//  Created by Eryus Developer on 06/09/17.
//  Copyright © 2017 Eryushion Techsol. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textLabel1: UILabel!
    @IBOutlet weak var textLabel2: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        let text = "We can use auto layout, where we use a content view in scrollview, which can be pinned to the scrollview and the height and width constraints given equal to the main view. Then if we want the height to vary dynamically we can give height constraint a low priority compared to the others and hence the content view's height will increase based on its intrinsic size, because of its sub views.We can use auto layout, where we use a content view in scrollview, which can be pinned to the scrollview and the height and width constraints given equal to the main view. Then if we want the height to vary dynamically we can give height constraint a low priority compared to the others and hence the content view's height will increase based on its intrinsic size, because of its sub views.We can use auto layout, where we use a content view in scrollview, which can be pinned to the scrollview and the height and width constraints given equal to the main view. Then if we want the height to vary dynamically we can give height constraint a low priority compared to the others and hence the content view's height will increase based on its intrinsic size, because of its sub views.We can use auto layout, where we use a content view in scrollview, which can be pinned to the scrollview and the height and width constraints given equal to the main view. Then if we want the height to vary dynamically we can give height constraint a low priority compared to the others and hence the content view's height will increase based on its intrinsic size, because of its sub views."
        self.textLabel1.text = text
        self.textLabel2.text = text
    }
}
