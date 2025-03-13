//
//  ThemeSettings.swift
//  Portfolio app
//
//  Created by Adam Mason on 22/01/2025.
//

import SwiftUI

struct ThemeSettings: View {
    @State private var back = false
    @StateObject var Colour = Colours()
    var body: some View {
        NavigationStack{
            ZStack{
                Color(red:Colour.red,green: Colour.green,blue: Colour.blue)
                    .ignoresSafeArea()
                ScrollView {
                    VStack{
                        Text("In progress")
                            .foregroundColor(Colour.text)
                            .padding()
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .toolbarBackground(Color(red:Colour.red,green: Colour.green,blue: Colour.blue))
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    
                    Button {
                        back = true

                        
                    } label: {
                        // 4
                        HStack {
                            
                            Image(systemName: "chevron.backward")
                            Text("Themes").font(.headline)
                        }
                        .foregroundColor(Colour.text)
                    }
                }
            }
            
            .navigationDestination(isPresented: $back){
                Settings()
                    .navigationBarBackButtonHidden(true)
                    
            }
        }
    }
}
// so that i can preview what this will look like
#Preview {
    ThemeSettings()
               }
