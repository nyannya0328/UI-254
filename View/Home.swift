//
//  Home.swift
//  UI-254
//
//  Created by nyannyan0328 on 2021/07/06.
//

import SwiftUI

struct Home: View {
    @State var currentImage = "p1"
    var body: some View {
        ZStack{
            
            GeometryReader{proxy in
                
                let size = proxy.size
                
                Image(currentImage)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: size.width, height: size.height)
                
                
                
                
                
            }
            .ignoresSafeArea()
            .overlay(.ultraThinMaterial)
            
            
            TabView(selection: $currentImage) {
                
                ForEach(1...6,id:\.self){index in
                    
                    
                    CurouselBodyView(index: index)
                    
                    
                    
                    
                }
                
                
                
                
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
