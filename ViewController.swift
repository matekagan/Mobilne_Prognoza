//
//  ViewController.swift
//  Wheather App
//
//  Created by Student on 09.10.2018.
//  Copyright © 2018 agh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var data: [[String: Any]]=[]
    var currentItem : Int = 0;
    
    func setData(data: [[String: Any]]) -> Void {
        self.data = data
        var text1 =
            (self.data[self.currentItem]["temperatureHigh"]! as! Double).description
        var text2 =
            (self.data[self.currentItem]["temperatureLow"]! as! Double).description
        self.temperature.text = "\(text1) - \(text2)"
        text1 =
            (self.data[self.currentItem]["pressure"]! as! Double).description
        self.pressure.text = text1
        
        
        
    }
    
    @IBOutlet weak var prevButton: UIButton!
    @IBOutlet weak var temperature: UILabel!
    @IBOutlet weak var wind: UILabel!
    @IBOutlet weak var pressure: UILabel!
    @IBOutlet weak var date: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let weather = WeatherGetter()
        weather.getWeather(){
            (data: [[String:Any]]) in
            self.setData(data: data)
        }
    }

    // MARK: Actions
    
    @IBAction func goToNextItem(_ sender: UIButton) {
    }
    
    @IBAction func goToPreviousItem(_ sender: UIButton) {
    }
}

