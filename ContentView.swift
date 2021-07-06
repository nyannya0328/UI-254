//
//  ContentView.swift
//  UI-254
//
//  Created by nyannyan0328 on 2021/07/06.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        SplashScreen(imagesize:CGSize(width: 200, height: 200)) {
            
            
            MainView()
            
        } titleView: {
            
            Text("Chatty")
                .font(.system(size: 35, weight: .bold))
                .foregroundColor(.white)
            
        } logo: {
            
            Image("logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
              
            
        } navbutton: {
            
            
            Image("pro")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 60, height: 60)
                .clipShape(Circle())
            
            
        }
        

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
