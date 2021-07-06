//
//  ContextView.swift
//  UI-254
//
//  Created by nyannyan0328 on 2021/07/06.
//

import SwiftUI

struct ContextView: View {
    @State var onEnd = false
    @State var show = false
    var body: some View {
        NavigationView{
            
            ZStack{
                
                CustomContexMenu(content: {
                    
                    Label {
                        
                        Text("Lock Me")
                        
                    } icon: {
                        Image(systemName: "lock.fill")
                    }
                    .font(.title.bold())
                    .foregroundColor(.white)
                    .padding(.vertical,10)
                    .padding(.horizontal,15)
                    .background(Color.purple)
                    .cornerRadius(10)

                    
                }, preView: {
                    
                    Image("pro")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                    
                    
                    
                }, actions: {
                    
                    let like = UIAction(title:"Heart",image: UIImage(systemName: "suit.heart.fill")) { _ in
                        
                        print("A")
                    

                    }
                    
                    let Share = UIAction(title:"Share",image: UIImage(systemName: "square.and.arrow.up.fill")) { _ in
                        
                        
                        print("B")
                    }
                    
                    
                    return UIMenu(title:"",children: [like,Share])
                }, onEnd: {
                    
                    
                    withAnimation{
                        
                        onEnd.toggle()
                    }
                    
                    
                    
                    
                })
                
                if onEnd{
                    
                    
                    GeometryReader{proxy in
                        
                        let size = proxy.size
                        
                        Image("pro")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: size.width, height: size.height)
                        
                        
                        
                        
                    }
                    .ignoresSafeArea(.all, edges: .bottom)
                    .transition(.identity)
                    
                    
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            
                            
                            Button("Close"){
                                
                                
                                onEnd.toggle()
                            }
                            
                        }
                    }
                    
                  
                    
                    
                    
                    
                    
                }
            }
            .navigationBarTitle(onEnd ? "Unlocked" : "CustomContentMenu")
            .navigationBarTitleDisplayMode(onEnd ? .inline : .large)
            .overlay(
            
                ZStack{
                
                if show{
                    
                    
                    ContentView()
                }
            }
            )
        }
    }
}

struct ContextView_Previews: PreviewProvider {
    static var previews: some View {
        ContextView()
    }
}
