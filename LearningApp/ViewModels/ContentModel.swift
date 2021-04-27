//
//  ContentModel.swift
//  LearningApp
//
//  Created by Thomas Grutkowski on 4/24/21.
//

import Foundation

class ContentModel : ObservableObject {
  
  // List of modules
  @Published var modules = [Module] ()
  
  // List of lessons
//  @Published var lessons = [Lesson] ()
  
  // Current module
  @Published var currentModule: Module?
  var currentModuleIndex = 0
  
  // Current Lesson
  @Published var currentLesson: Lesson?
  var currentLessonIndex=0
  
  var styleData : Data?
  
  init() {
    
    getLocalData()
  }
  
  // MARK: - Modeule navigation methods
  func beginModule(_ moduleid:Int) {
    // Find the index for this module id
    for index in 0..<modules.count {
      if modules[index].id == moduleid {
        currentModuleIndex = index
        break
      }
    }
    currentModule = modules[currentModuleIndex]
  }
  
  func beginLesson(_ lessonid:Int) {
    // Find the index for this module id
    print ("lessonid is " + String(lessonid))
    if lessonid < currentModule!.content.lessons.count {
      currentLessonIndex = lessonid
    }
    else {
      currentLessonIndex = 0
    }
    
    print (String(currentLessonIndex))
    currentLesson = currentModule!.content.lessons[currentLessonIndex]
  }
  
  func hasNextLesson() -> Bool {
    
    return currentLessonIndex + 1 < currentModule!.content.lessons.count
    
  }
  
  func nextLesson() {
    
    currentLessonIndex += 1
    
    if currentLessonIndex < currentModule!.content.lessons.count {
      currentLesson = currentModule?.content.lessons[currentLessonIndex]
    }
    else {
      currentLessonIndex = 0
      currentLesson = nil
    }
    
  }

  
  
  
  // MARK: - Data Methods
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
