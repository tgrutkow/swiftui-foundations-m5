//
//  ContentDetailView.swift
//  LearningApp
//
//  Created by Thomas Grutkowski on 4/26/21.
//

import SwiftUI
import AVKit

struct ContentDetailView: View {
  
  @EnvironmentObject var model: ContentModel
  
  var body: some View {
    
    let lesson = model.currentLesson
    let url = URL(string: Contstants.videoHostUrl + (lesson?.video ?? ""))
    VStack {
      if url != nil {
        VideoPlayer(player: AVPlayer(url: url!))
          .cornerRadius(10)
      }
      // Description
      // Next lesson button
      if model.hasNextLesson() {
        Button(action:
                { model.nextLesson()},
               label: {
                ZStack {
                  Rectangle ()
                    .frame(height:48)
                    .foregroundColor(Color.green)
                    .cornerRadius(20)
                    .shadow(radius: 5)
                  Text("Next Lesson: \(model.currentModule!.content.lessons[model.currentLessonIndex+1].title)")
                    .bold()
                    .foregroundColor(.white)
                }
               })
      }
    }
    .padding()
  }
}

struct ContentDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ContentDetailView()
    }
}
