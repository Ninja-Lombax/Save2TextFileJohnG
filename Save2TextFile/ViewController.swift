//
//  ViewController.swift
//  Save2TextFile
//
//  Created by John Grasser on 10/7/20.
//  Copyright © 2020 John Grasser. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBAction func writeMyText(_ sender: Any) {
        
        let fm = FileManager.default
        let urls = fm.urls(for: .documentDirectory, in: .userDomainMask)
        let url = urls.last?.appendingPathExtension("file.txt")
        
        do{
            try typeTextHere.text.write(to: url!, atomically: true, encoding: String.Encoding.utf8)
        }
        catch{
            print("Error Writing To File")
            
        }
    }
    
    
    @IBAction func readMyText(_ sender: Any) {
        
               let fm = FileManager.default
         let urls = fm.urls(for: .documentDirectory, in: .userDomainMask)
         let url = urls.last?.appendingPathExtension("file.txt")
        
        do{
            let fileContent = try String(contentsOf: url!, encoding: String.Encoding.utf8)
            displayTextHere.text = fileContent
            
        }
        catch{
            
            print("Error Reading File")
        }
    }
    
    
    @IBOutlet var typeTextHere: UITextView!
    
    
    @IBOutlet var displayTextHere: UITextView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        typeTextHere.text = "Type your new text right here"
        displayTextHere.text = ""
        // Do any additional setup after loading the view.
    }


}

