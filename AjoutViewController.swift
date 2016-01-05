//
//  AjoutViewController.swift
//  TheGroceryList
//
//  Created by Administrateur on 28/12/2015.
//  Copyright © 2015 www.com.epsi.projeti5.grocerylist. All rights reserved.
//

import UIKit

class AjoutViewController: UIViewController {

    @IBOutlet weak var textField1: UITextField!
    var nouvelleChoseAFaire: ChoseAFaire!
    
    override func viewDidLoad() {
         super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    // Catch the segue
    
    // Surcharge le prepareForSegue
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        switch segue.identifier {
        
        // Récupérer la segue1 et l'afficher
        case "segue1  "? :
                print("segue1")
                if (self.textField1.text?.isEmpty != nil) {
                    self.nouvelleChoseAFaire = ChoseAFaire(nom: self.textField1.text!)
                }
                
                // Récupérer un pointeur sur la destination de la segue
                let destination: RootViewController = segue.destinationViewController as! RootViewController
                
                // Ajoute l'objet à la destination et on peut recharger tous le tableView
                let element: ChoseAFaire = nouvelleChoseAFaire
                destination.liste1.addObject(element)
                destination.tableView1.reloadData()
            default:
                print("default")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
