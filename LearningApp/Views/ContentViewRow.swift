//
//  ContentViewRow.swift
//  LearningApp
//
//  Created by Thomas Grutkowski on 4/26/21.
//

import SwiftUI

struct ContentViewRow: View {
  @EnvironmentObject var model: ContentModel
  var index:Int
 
  var body: some View {
    let lesson = model.currentModule!.content.lessons[index]

    ZStack (alignment: .leading) {
      Rectangle()
        .foregroundColor(.white)
        .cornerRadius(10)
        .shadow(color:.black,radius: 10)
        .frame(height:66)
      HStack (spacing:20){
        Text("\(index+1)")
          .bold()
        VStack (alignment: .leading){
          Text(lesson.title)
            .bold()
          Text(lesson.duration)
        }
      }
      .padding()
    }
  }
}

struct ContentViewRow_Previews: PreviewProvider {
    static var previews: some View {
      ContentViewRow(index:0)
    }
}
