//
//  ChoseAFaire.swift
//  TheGroceryList
//
//  Created by Administrateur on 28/12/2015.
//  Copyright © 2015 www.com.epsi.projeti5.grocerylist. All rights reserved.
//

import UIKit

class ChoseAFaire: NSObject {
    
    // Chaine de caractere
    var nomDeLaChoseAFaire: NSString
    
    // Si la chose a été effectué ou non
    var effectue: Bool = false
    
    // Date de création
    var dateDeCreation: NSDate = NSDate()
    
    init(nom:String) {
        self.nomDeLaChoseAFaire = nom
    }

}
