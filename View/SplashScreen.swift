//
//  SplashScreen.swift
//  UI-254
//
//  Created by nyannyan0328 on 2021/07/06.
//

import SwiftUI

struct SplashScreen<Content : View,TitleView : View,LogoView : View,NavButton : View>: View {
    
    var content : Content
    var titleView : TitleView
    var logo : LogoView
    var imagesize : CGSize
    var navbutton : NavButton
    
    init(imagesize : CGSize, @ViewBuilder content : @escaping()->Content,@ViewBuilder titleView : @escaping()->TitleView,@ViewBuilder logo : @escaping()->LogoView,@ViewBuilder navbutton : @escaping()->NavButton){
        
        self.content = content()
        self.titleView = titleView()
        self.logo = logo()
        self.imagesize = imagesize
        self.navbutton = navbutton()
        
        
        
    }
    
    @State var textAniamition = false
    @State var endAniamition = false
    
    @State var showNave = false
    
    @Namespace var animation
    
   
    var body: some View{
        
        VStack(spacing:0){
            
            
            ZStack{
                
                Color("c1")
                    .background(Color("c1"))
                
                    .overlay(
                    
                        ZStack{
                        
                        titleView
                            .offset(y:textAniamition ? 0 :  110)
                            .scaleEffect(endAniamition ? 0.7 : 1)
                            .offset(y: 10)
                        
                        if !endAniamition{
                            
                            logo
                                .matchedGeometryEffect(id: "LOGO", in: animation)
                                .frame(width: imagesize.width, height: imagesize.height)
                        }
                    }
                    
                    )
                
                    .overlay(
                    
                        HStack{
                            
                            navbutton
                                .opacity(showNave ? 1 : 0)
                                .offset(y: 10)
                            
                            Spacer()
                          
                            if endAniamition{
                            logo
                                .matchedGeometryEffect(id: "LOGO", in: animation)
                                .frame(width: 60, height: 60)
                                .offset(y: 5)
                                
                        }
                       
                    }
                        .padding(.horizontal)
                    
                    )
                
               
                
               
                    
                
                
               
            }
            .frame(height: endAniamition ? 50 : nil)
            .zIndex(1)
            
            content
                .frame(height: endAniamition ? nil : 0)
                .zIndex(0)
            
        }
        .frame(maxHeight: .infinity, alignment: .top)
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                
                withAnimation(.spring()){
                    
                    
                    textAniamition.toggle()
                }
                
                withAnimation(Animation.interactiveSpring(response: 0.6, dampingFraction: 1, blendDuration: 1)){
                    
                    
                    
                    endAniamition.toggle()
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                    
                    withAnimation(.spring()){
                        
                        
                        showNave.toggle()
                    }
                
                
                }
                
                
            }
        }
    }
    
    
    
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
