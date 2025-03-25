//
//  ContentView.swift
//  instafilter
//
//  Created by Hadi Al zayer on 22/09/1446 AH.
//

import SwiftUI

struct ContentView: View {
    @State private var processedImage: Image?
    @State private var filterIntensity = 0.5
    var body: some View {
        NavigationStack{
            VStack{
               Spacer()
                
                if let processedImage{
                    processedImage
                        .resizable()
                        .scaledToFill()
                } else {
                    ContentUnavailableView("No picture", systemImage: "photo.badge.plus", description: Text("Tap to import a photo"))
                }
                
                HStack{
                    Text("Intensity")
                    Slider(value:$filterIntensity)
                }
                .padding(.vertical)
                
                HStack{
                    Button("Change Filter", action: changeFilter)
                    Spacer()
                }
            }
            .padding([.horizontal, .bottom])
            .navigationTitle("Instafilter")
        }
    }
    
    func changeFilter(){
        
    }
    
}

#Preview {
    ContentView()
}
