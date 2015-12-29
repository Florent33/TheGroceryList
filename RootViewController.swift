//
//  RootViewController.swift
//  TheGroceryList
//
//  Created by Administrateur on 28/12/2015.
//  Copyright © 2015 www.com.epsi.projeti5.grocerylist. All rights reserved.
//

import UIKit

class RootViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    // Link between tableView maCellule and the last ViewVontroller
    @IBOutlet weak var tableView1: UITableView!
    
    // Link between button Add and the last ViewController
    @IBOutlet weak var buttonAdd1: UIBarButtonItem!
    
    // Create an empty list
    var liste1: NSMutableArray = []
    
    // Call to a segue with an argument segue: UIStoryboardSegue
    @IBAction func retourDeSegue(segue: UIStoryboardSegue) {
        //
    }
    
    // Methods UITableVIewDataSource
    // Function numberOfSectionsInTableView return the integer 1
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        print("Go to the function", __FUNCTION__)
        return 1
    }
    
    // Number of line in the section
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("Go to the function", __FUNCTION__)
        return self.liste1.count
    }
    
    // Add cell with text
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        print("Go to the function", __FUNCTION__)
        
        // Cell re-use with name of identifier given by the storyBoard
        // Replace var to let
        let cell = tableView.dequeueReusableCellWithIdentifier("MaCellule") as UITableViewCell?
        
        // Récupérer l'objet choseAFaire se trouvant à l'objet indice de la liste
        let uneChoseAFaire: ChoseAFaire = self.liste1.objectAtIndex(indexPath.row) as! ChoseAFaire
        
        // Récupèrer son nom
        cell?.textLabel?.text = uneChoseAFaire.nomDeLaChoseAFaire as String
        // Afficher la marque à gauche de la tableView suivant la valeur du booléen
        if uneChoseAFaire.effectue {
            cell?.accessoryType = .Checkmark
        } else {
            cell?.accessoryType = .None
        }
        
        return cell!
    }
    
    // Edit cell for delete it
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    // Delete title
    func tableView(tableView: UITableView, titleForDeleteConfirmationButtonForARowAtIndexPath indexPath: NSIndexPath) -> String {
        return "delete..."
    }
    
    // Function commitEditingStyle call when we want to delete cell
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, ForRowAtIndexPath indexPath: NSIndexPath) {
        
        // Delete object associated to this index and reload page
        if editingStyle == UITableViewCellEditingStyle.Delete {
            // Delete source
            self.liste1.removeObjectAtIndex(indexPath.row)
            // Delete cell form tableView
            self.tableView1.reloadData()
        }
    }
    
    // Initialization of an array
    func chargementInitial() {
        
        // replace var to let
        let element1 = ChoseAFaire(nom: "Read a novel book")
        self.liste1.addObject(element1)
        
        let element2 = ChoseAFaire(nom: "take the newspaper")
        self.liste1.addObject(element2)
        
        let element3 = ChoseAFaire(nom: "Buy some bread")
        self.liste1.addObject(element3)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Start ViewController and start ChoseAFaire
        self.chargementInitial()
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
