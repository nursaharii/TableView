//
//  ViewController.swift
//  LandmarkBook
//
//  Created by Nurşah on 16.11.2021.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource  {
    var secilenSehir = ""
    var secilenImg = UIImage()
    var landmarkNames = [String]()
    var landmarkImages = [UIImage]()

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = landmarkNames[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return landmarkNames.count
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            landmarkNames.remove(at: indexPath.row)
            landmarkImages.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.left)
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        secilenSehir = landmarkNames[indexPath.row]
        secilenImg = landmarkImages[indexPath.row]
        performSegue(withIdentifier: "toImageViewController", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toImageViewController" {
            let destinationVC = segue.destination as! ViewController2
            destinationVC.secilenSehir = secilenSehir
            destinationVC.secilenImg = secilenImg
        }
    }
    
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        landmarkNames.append("İstanbul")
        landmarkNames.append("Ankara")
        landmarkNames.append("İzmir")
        
        landmarkImages.append(UIImage(named: "istanbul")!)
        landmarkImages.append(UIImage(named: "ankara")!)
        landmarkImages.append(UIImage(named: "izmir")!)
        
    }
    
    
}

