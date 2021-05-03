//
//  ContentView.swift
//  Shared
//
//  Created by Ali Kadir BAGCIOGLU on 5/3/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var name = ""
    @State var showResetAlert = false
    @State var imageSize:CGFloat = 150
    
    var body: some View {
        VStack {
            Image("square")
                .resizable()
                .frame(width: imageSize, height: imageSize, alignment: .center)
                .cornerRadius(8.0)
                .padding()
                .shadow(radius: 10)
            
            Stepper(value: $imageSize, in: 150...320, step: 10){
            }.padding().padding(.bottom, 50)
            
            TextField("Your Name...", text: $name).textFieldStyle(RoundedBorderTextFieldStyle())
                .fixedSize()
            
            Text("Hi, \(name) How are you?")
                .padding()
            
            Button("Reset Name",action:{
                name = "";
                showResetAlert.toggle();
            }).padding()
            
            
        }.alert(isPresented: $showResetAlert) { () -> Alert in Alert(title: Text("Reseted Name"), message: Text("Reset Name Succeded"))
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

