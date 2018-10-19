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
    
    func refreshData() -> Void {
        let arrayItem = data[currentItem]
        let tempLow = (arrayItem["temperatureLow"]! as! Double).description
        let tempHigh = (arrayItem["temperatureHigh"]! as! Double).description
        temperature.text = "temperature: \(tempLow)°C - \(tempHigh)°C"
        
        let press = (arrayItem["pressure"]! as! Double).description
        pressure.text = "pressure: \(press) hPa"
        
        let windSpeed = (arrayItem["windSpeed"]! as! Double).description
        let windDir = WindDirection(arrayItem["windBearing"]! as! Double).description
        wind.text = "wind: \(windSpeed) m/s \(windDir)"
        
        let precip = (arrayItem["precipIntensity"]! as! Double).description
        rain.text = "precip: \(precip) mm/h"
        
        let iconName = data[currentItem]["icon"]! as! String
        icon.image = UIImage(named: iconName)
        
        let date = Date(timeIntervalSince1970: arrayItem["time"]! as! Double)
        let dayTimeFormatter = DateFormatter()
        dayTimeFormatter.dateFormat = "dd MMMM YYY"
        self.date.text = dayTimeFormatter.string(from: date as Date)
        
        nextButton.isEnabled = currentItem < data.capacity - 1
        prevButton.isEnabled = currentItem > 0
    }
    
    func setData(data: [[String: Any]]) -> Void {
        self.data = data
    }
    
    @IBOutlet weak var prevButton: UIButton!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var pressure: UILabel!
    @IBOutlet weak var rain: UILabel!
    @IBOutlet weak var wind: UILabel!
    @IBOutlet weak var temperature: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let weather = WeatherGetter()
        weather.getWeather(){
            (data: [[String:Any]]) in
            self.setData(data: data)
            self.refreshData()
        }
    }

    // MARK: Actions
    
    @IBAction func goToNextItem(_ sender: UIButton) {
        currentItem += 1
        refreshData()
    }
    
    @IBAction func goToPreviousItem(_ sender: UIButton) {
        currentItem -= 1
        refreshData()
    }
}

