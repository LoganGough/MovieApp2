//
//  ViewController.swift
//  MovieApp2
//
//  Created by LOGAN GOUGH on 1/14/25.
//
struct Movie: Codable{
    var Title: String
    var Year: Int
    
}



import UIKit

class ViewController: UIViewController{
    
    
    
    
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    var movies = [String]()
    
    
    @IBOutlet weak var tableViewOutlet: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func button(_ sender: UIButton) {
        var blah = textField.text!
        releaseYear(name: "\(blah)")
        for i in 0..<movies.count{
            print(movies[i])
        }
    }
    
    func releaseYear(name: String){
        print("\(name)")
        
        let session = URLSession.shared
        let movieURL = URL(string: "http://www.omdbapi.com/?i=tt3896198&apikey=2a2c0206&s=\(name)")!
        
        let dataTask = session.dataTask(with: movieURL) { data, response, error in
            if error != nil{
                DispatchQueue.main.async{
                    self.label.text = "error"
                }
            }
            else{
                if let d = data{
                    if let jsonObj = try? JSONSerialization.jsonObject(with: d, options: .fragmentsAllowed) as? NSDictionary{
                        //                        print(jsonObj)
                        
                        //get Movie object with JSONDecoder
                        if let movieObj = try? JSONDecoder().decode(Movie.self, from: d){
                            print(movieObj.Title)
                        }
                        else{
                            print("error decoding to movie object")
                        }
                        
                    }
                    
                    
                    
                    
                    
                }
                
            }
        }
            dataTask.resume()
        }
            
            
        }
    
    

