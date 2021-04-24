//
//  ContentModel.swift
//  LearningApp
//
//  Created by Thomas Grutkowski on 4/24/21.
//

import Foundation

class ContentModel : ObservableObject {
  
  @Published var modules = [Module] ()
  var styleData : Data?
  
  init() {
    
    getLocalData()
  }
  
  func getLocalData() {
    //Get a url to the json file
    let jsonUrl = Bundle.main.url(forResource: "data", withExtension: "json")
    do {
      let jsonData = try Data(contentsOf: jsonUrl!)
      
      // Try to decode the json
      let jsonDecoder = JSONDecoder()
      let modules = try jsonDecoder.decode([Module].self,from: jsonData)
      
      // Assign parsed modules to modules  property
      
      self.modules = modules
      
    }
    catch {
      print("Can't open \(jsonUrl!)")
      print(error)
    }
    
    // Parse the style Data
    
    let styleUrl = Bundle.main.url(forResource: "style", withExtension: "html")
    
    do {
      
        // Read the file into ta data object
        let styleData = try Data(contentsOf: styleUrl!)
      
      self.styleData = styleData
    }
    catch {
      // Log Error
      print("Count't parse style data")
    }
    
  }
}
