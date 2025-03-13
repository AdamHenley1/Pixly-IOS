import SwiftUI
import PhotosUI

// TO-DO LIST
// MAKE IT SO IT ADDS THE IMAGES TO A FOLDER
// HAVE THE IMAGES LOAD IN A GRID ON HOME PAGE
// BE ABLE TO OPEN THE IMAGES TO FULL SCREEN
// OPTION TO DELETE THE IMAGE REMOVING IT FROM FOLDER
struct MainPage: View {
    @State private var pickerItem: PhotosPickerItem?
    @State private var selectedImage: Image?
    @StateObject var Colour = Colours()
    @State private var mainback = false
    @State private var settings = false
    var body: some View {
        NavigationView{
            ZStack{
                // background colour
                Color(red:0.67,green: 0.61,blue: 1.39)
                    .ignoresSafeArea()
                // scrollable view on top of both
                ScrollView{
                    VStack {
                        PhotosPicker("Select a picture", selection: $pickerItem, matching: .images)
                        selectedImage?
                            .resizable()
                            .scaledToFit()
                    }
                    .onChange(of: pickerItem) { NewValue in
                        Task {
                            selectedImage = try await pickerItem?.loadTransferable(type: Image.self)
                        }
                    }
                }
                
        }
        .toolbarBackground(Color(red:Colour.red,green: Colour.green,blue: Colour.blue))
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing){
                ZStack{
                    HStack{
                        Text("Pixly")
                            .font(.headline)
                            .offset(x:-UIScreen.main.bounds.width+(UIScreen.main.bounds.width/5.5))
                    }.foregroundColor(Colour.text)
                    Button {
                        settings = true
                        
                    } label: {
                        HStack {
                            Image(systemName: "line.3.horizontal")
                            
                        }
                        .offset(x: 10)
                        .foregroundColor(Colour.text)
                    }
                }
            }
        }
            
            
            .navigationDestination(isPresented: $settings) {
                Settings()
                    .navigationBarBackButtonHidden(true)
            }
        }
    }
}

// so that i can preview what this will look like

#Preview {
    MainPage()
}
