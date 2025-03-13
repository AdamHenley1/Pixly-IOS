//
//  SettingsPage.swift
//  Portfolio app
//
//  Created by Adam Mason on 21/01/2025.
//

import SwiftUI
import SwiftUICore
import UIKit

struct Settings: View {
    @StateObject var Colour = Colours()
    @State private var Signout = false
    @State private var Themes = false
    @State private var back = false
    var body: some View {
        NavigationView{
            ZStack{
                Color(red:Colour.red,green: Colour.green,blue: Colour.blue)
                ScrollView {
                    VStack {
                        Button(){
                            Themes = true
                        }label: {
                            HStack {
                                Text("Themes")
                            }
                            .foregroundColor(Colour.text)
                        }.settingsbuttonstyle()
                        
                        Button(){
                            Signout = true
                        }label: {
                            HStack {
                                Text("Sign-Out")
                            }
                            .foregroundColor(Colour.text)
                        }.settingsbuttonstyle()
                        
                    }
                    .padding()
                }
                .background(Color(red:Colour.red,green: Colour.green,blue: Colour.blue))
            }
            .toolbarBackground(Color(red:Colour.red,green: Colour.green,blue: Colour.blue))
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading){
                    ZStack{
                        Button {
                            back = true
                            
                        } label: {
                            HStack {
                                Image(systemName: "chevron.backward")
                                Text("Settings").font(.headline)
                            }
                            .foregroundColor(Colour.text)
                            
                        }
                    }
                }
            }
            
            
            .navigationDestination(isPresented: $back) {
                MainPage()
                    .navigationBarBackButtonHidden(true)
            }

            
            .navigationDestination(isPresented: $Signout){
                LoginPage()
                    .navigationBarBackButtonHidden(true)
            }
           
            .navigationDestination(isPresented: $Themes){
                ThemeSettings()
                    .navigationBarBackButtonHidden(true)
                    
            }
        }
    }
}


struct SettingsButtonStyle: ViewModifier {
    @StateObject var Colour = Colours()
    func body(content: Content) -> some View {
        content
            .padding()
            .frame(
                width:UIScreen.main.bounds.width-10,
                height:45,
                alignment: .leading
            )
            .foregroundColor(Colour.text)
            .background(Color(red: Colour.red-0.3, green: Colour.green-0.3, blue: Colour.blue-0.3).opacity(0.2))
            .cornerRadius(10)
    }
}

extension View {
    func settingsbuttonstyle() -> some View {
        self.modifier(SettingsButtonStyle())
    }
}

// so that i can preview what this will look like

#Preview {
    Settings()
}

