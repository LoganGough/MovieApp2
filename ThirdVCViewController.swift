//
//  ViewController.swift
//  MovieApp2
//
//  Created by LOGAN GOUGH on 1/14/25.
//




import UIKit

class ThirdVCViewController: UIViewController{
    
    
    
    
    

    
    var movies = [String]()
    var years = [String]()
    var types = [String]()
    

    @IBOutlet weak var textView: UITextView!
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textView.text = "Movie: \(AppData.globalMovie)\nReleased: \(AppData.gobalYear)\nType: \(AppData.globalType)"
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        textView.text = "Movie: \(AppData.globalMovie)\nReleased: \(AppData.gobalYear)\nType: \(AppData.globalType)"
    }
    
    
        
          
    


}
