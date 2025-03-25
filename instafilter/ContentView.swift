//
//  ContentView.swift
//  instafilter
//
//  Created by Hadi Al zayer on 22/09/1446 AH.
//
import CoreImage
import CoreImage.CIFilterBuiltins
import PhotosUI
import SwiftUI

struct ContentView: View {
    @State private var processedImage: Image?
    @State private var filterIntensity = 0.5
    @State private var selectedItem : PhotosPickerItem?
    
    var body: some View {
        NavigationStack{
            VStack{
               Spacer()
                PhotosPicker(selection:$selectedItem){
                    if let processedImage{
                        processedImage
                            .resizable()
                            .scaledToFill()
                    } else {
                        ContentUnavailableView("No picture", systemImage: "photo.badge.plus", description: Text("Tap to import a photo"))
                    }
                }
                .onChange(of: selectedItem , loadImage)
                
                /// to remove the default color
                //  .buttonStyle(.plain)
                
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
    
    func loadImage(){
        Task{
            guard let imageData = try await selectedItem?.loadTransferable(type: Data.self) else{ return }
            
            guard let inputImage = UIImage(data:imageData) else {return }
            
        }
    }
    
}

#Preview {
    ContentView()
}
