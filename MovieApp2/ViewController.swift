//
//  ViewController.swift
//  MovieApp2
//
//  Created by LOGAN GOUGH on 1/14/25.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    
    
    
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
        print("\(blah)")
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
                    //getting the json object from the api
                    if let jsonObj = try? JSONSerialization.jsonObject(with: d, options: .fragmentsAllowed) as? NSDictionary{
                        print(jsonObj)
                        if jsonObj.value(forKey: "Error") as? String == "Movie not found!"{
                            DispatchQueue.main.async{
                                self.label.text = "error"
                            }
                            return
                        }
                        if let movieArray = jsonObj.value(forKey: "Search") as? [NSDictionary]{
                            DispatchQueue.main.async{
                                for i in 0..<movieArray.count{
                                    var blah = "\(movieArray[i])"
                                    self.movies.append(blah)
                                    print(blah)
                                }
                            }
                                                        
                        }
                        
                        
                    }
                    else{
                        print("couldnt get data")
                    }
                }
                else{
                    print("no data")
                }
            }
        }
        dataTask.resume()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell") as? CrazyCell3
        var blat = movies[indexPath.row]
        cell!.label1?.text = blat
        return cell!
        
    }
    
    
}

