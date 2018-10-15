import Foundation

class WeatherGetter {
  
  private let darkSkyBaseApiURL = "https://api.darksky.net/forecast"
  private let darkSkyAPIKey = "307ff69f9c1ffcd18bd147431e2b0bc3"
  private let darkSkyLocation = "53.23,19.57"
  private let darkSkyArguments = "units=si&exclude=currently,minutely,hourly,alerts,flags"
  
  func getWeather() {
    
    // This is a pretty simple networking task, so the shared session will do.
    let session = NSURLSession.sharedSession()
    
    let weatherRequestURL = NSURL(string: "\(darkSkyBaseApiURL)/\(darkSkyAPIKey)/\(darkSkyLocation)?\(darkSkyArguments)")!
    
    // The data task retrieves the data.
    let dataTask = session.dataTask(with: weatherRequestURL) {
      (data: NSData?, response: NSURLResponse?, error: NSError?) in
      if let error = error {
        // Case 1: Error
        print("Error:\n\(error)")
      }
      else {
		print("Raw data:\n\(data!)\n")
		let dataString = String(data: data!, encoding: NSUTF8StringEncoding)
		print("Human-readable data:\n\(dataString!)")
		if let mainDictionary = jsonObj!.value(forKey: "daily") as? NSDictionary {
			if let dataArray = mainDictionary.value(forKey: "data") {
				// do something with the array
			} else {
				print("Unable to find data in JSON")
			}
		} else {
			print("Error when parsing JSON")
		}
      }
    }
    
    // The data task is set up...launch it!
    dataTask.resume()
  }
  
}