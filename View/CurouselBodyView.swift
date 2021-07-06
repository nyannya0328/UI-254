//
//  CurouselBodyView.swift
//  UI-254
//
//  Created by nyannyan0328 on 2021/07/06.
//

import SwiftUI

struct CurouselBodyView: View {
    @State var offset : CGFloat = 0
    @State var show = false
    var index : Int
    var body: some View {
        GeometryReader{proxy in
            
            let size = proxy.size
            
            ZStack{
                
                Image("p\(index)")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: size.width - 10, height: size.height / 1.3)
                    .cornerRadius(12)
                
                VStack{
                    
                    
                    VStack(alignment: .leading, spacing: 15) {
                        
                        Text("Human Intergration Super Busy")
                            .font(.title.bold())
                            .foregroundStyle(.gray)
                        
                        
                        Text("Animal Amazing Power")
                            .font(.footnote.weight(.heavy))
                            .foregroundStyle(.gray)
                        
                        
                    }
                    
                    Spacer(minLength: 0)
                        .padding(.top,10)
                    
                    
                    VStack(alignment:.leading){
                        
                        HStack(spacing: 15){
                            Button {
                                show.toggle()
                                
                            } label: {
                                
                                Image("pro")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 60, height: 60)
                                    .clipShape(Circle())
                                
                            }

                            VStack(alignment: .leading, spacing: 15) {
                                
                                Text("Girl")
                                
                                Text("Buterfull")
                                
                            }
                            
                            
                            
                            
                        }
                        
                        HStack{
                            
                            VStack{
                                
                                
                                Text("1300")
                                    .font(.title.italic())
                                   
                                
                                Text("Posts")
                                    .foregroundStyle(.secondary)
                            }
                            .frame(maxWidth: .infinity)
                            
                            VStack{
                                
                                
                                Text("3100")
                                    .font(.title.italic())
                                
                                Text("Followers")
                                    .foregroundStyle(.secondary)
                            }
                            .frame(maxWidth: .infinity)
                            
                            
                            VStack{
                                
                                
                                Text("1500")
                                    .font(.title.italic())
                                
                                Text("Following") .foregroundStyle(.secondary)
                            }
                            .frame(maxWidth: .infinity)
                            
                        }
                        
                        
                    }
                    .padding(.horizontal)
                    .padding(.vertical,10)
                    .background(.white,in: RoundedRectangle(cornerRadius: 10))
                    
                    
                    
                    
                    
                    
                    
                }
                
                
                
                
            }
            .frame(width: size.width - 10, height: size.height / 1.3)
            .frame(width: size.width, height: size.height)
            
        }
        .tag("p\(index)")
        
        .rotation3DEffect(.init(degrees:getProgress() * 90 ), axis: (x: 0, y: 1, z: 0), anchor:offset < 0 ?  .trailing : .leading, anchorZ: 0, perspective: 0.6)
        
        
        .modifier(ScrollViewOffsetModify(offset: $offset, anchorPoint: .leading))
        
        
        
        
        
    }
    
    func getProgress ()->CGFloat{
        
        
        let progress = -offset / UIScreen.main.bounds.width
        
        return progress
    }
    
    
}

struct CurouselBodyView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
