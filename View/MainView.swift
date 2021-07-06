//
//  MainView.swift
//  UI-254
//
//  Created by nyannyan0328 on 2021/07/06.
//

import SwiftUI

struct MainView: View {
    @State var selected = "All Photo"
    @Namespace var animation
    var body: some View {
        VStack(spacing:0){
            
            
            HStack(spacing:0){
                
                
                ForEach(["All Photo","Chat","Statas"],id:\.self){index in
                    
                    
                    TabButton(title: index, selected: $selected, animation: animation)
                    
                    
                }
                
                
               
                
                
            }
            .padding(.top,20)
            .background(Color("c1"))
            
            switch selected{
                
                
            case "All Photo" : scroll()
                
                
                
            case "Chat" : Home()
            case "Statas" : ContextView()
            default : Text("")
            }
            
                
            
                
                
                
          
            
            
          
        }
        .background(.quaternary)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct scroll : View{
    
    var body: some View{
        
        ScrollView(.vertical, showsIndicators: false) {
            
            
            VStack(spacing:15){
                
                
                ForEach(1...6,id:\.self){index in
                    
                    
                    
                    
                    Image("p\(index)")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: UIScreen.main.bounds.width - 10, height: 300)
                        .cornerRadius(10)
                }
            }
            .padding()
            
            
            
            
            
        }
    }
}
struct TabButton : View{
    
    
    var title : String
    @Binding var selected : String
    var animation : Namespace.ID
    
    var body: some View{
        
        
        Button {
            
            withAnimation{
                
                selected = title
            }
        } label: {
            VStack{
                
                ZStack{
                    
                    if selected == title{
                        
                        
                        RoundedRectangle(cornerRadius: 3)
                            .fill(.green)
                            .frame(height: 3.5)
                            .matchedGeometryEffect(id: "TAB", in:   animation)
                    }
                    
                    
                    else{
                        
                        RoundedRectangle(cornerRadius: 3)
                            .fill(.clear)
                            .frame(width: 15, height: 1)
                        
                        
                    }
                }
                
                
                Text(title)
                    .font(.caption.italic())
                    .foregroundColor(selected == title ? .white : .gray)
                
                
              
                
                
                
            }
           .frame(maxWidth: .infinity)
            
          

            
        }

    }
}

