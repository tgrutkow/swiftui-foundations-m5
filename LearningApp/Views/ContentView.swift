//
//  ContentView.swift
//  LearningApp
//
//  Created by Thomas Grutkowski on 4/26/21.
//

import SwiftUI

struct ContentView: View {
  @EnvironmentObject var model: ContentModel

  var body: some View {
    ScrollView{
      LazyVStack {
      
        if model.currentModule != nil {
        
          ForEach(0..<model.currentModule!.content.lessons.count) { index in
             //Lesson Card
            ContentViewRow(index:index)
           
          }
        }
      }
      .padding()
      .navigationTitle("Learn \(model.currentModule?.category ?? "")")
      .accentColor(.red)
    }
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
      ContentView()
    }
}
