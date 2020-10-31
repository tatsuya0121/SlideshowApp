//
//  ExpansionViewController.swift
//  SlideshowApp
//
//  Created by 田中達也 on 2020/10/27.
//  Copyright © 2020 yanata.denmai. All rights reserved.
//

import UIKit

class ExpansionViewController: UIViewController {
    
    @IBOutlet weak var ExpansionImage: UIImageView!
    
    
    var img:UIImage! = nil
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        ExpansionImage.image = img

        // Do any additional setup after loading the view.
    }
    
    
    
   
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
