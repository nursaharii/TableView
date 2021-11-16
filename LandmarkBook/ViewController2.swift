//
//  ViewController2.swift
//  LandmarkBook
//
//  Created by Nurşah on 16.11.2021.
//

import UIKit

class ViewController2: UIViewController {

    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var sehir: UILabel!
    var secilenSehir = ""
    var secilenImg = UIImage()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        img.image = secilenImg
        sehir.text = secilenSehir
    }
}
