//
//  CustomContexMenu.swift
//  UI-254
//
//  Created by nyannyan0328 on 2021/07/06.
//

import SwiftUI

struct CustomContexMenu<Content:View,PreView : View>: View {
    var content : Content
    var preView : PreView
    var menu : UIMenu
    var onEnd : ()->()
    
    
    init(@ViewBuilder content : @escaping()->Content,@ViewBuilder preView : @escaping()->PreView,actions :@escaping()-> UIMenu,onEnd : @escaping()->()){
        
        
        self.content = content()
        self.preView = preView()
        self.menu = actions()
        self.onEnd = onEnd
    }
    var body: some View {
        ZStack{
            
            content
                .hidden()
                .overlay(
                
                    ContextMenuHelper(content: content, preView: preView, actions: menu, onEnd: onEnd)
                )
        }
    }
}

struct CustomContexMenu_Previews: PreviewProvider {
    static var previews: some View {
        ContextView()
    }
}

struct ContextMenuHelper<Content : View,PreView : View> : UIViewRepresentable{
    
    var content : Content
    var preView : PreView
    var menu : UIMenu
    var onEnd : ()->()
    
    init(content : Content,preView : PreView,actions : UIMenu,onEnd : @escaping()->()){
        
        self.content = content
        self.menu = actions
        self.preView = preView
        
        self.onEnd = onEnd
    }
    
    
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }
    
  
    
    
    func makeUIView(context: Context) -> UIView {
        
        let view = UIView()
        view.backgroundColor = .clear
        
      
        
        let hostView = UIHostingController(rootView: content)
        
       

        hostView.view.translatesAutoresizingMaskIntoConstraints = false

        let constrains = [

            view.topAnchor.constraint(equalTo: view.topAnchor),
            view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            view.heightAnchor.constraint(equalTo: view.heightAnchor),
            view.widthAnchor.constraint(equalTo: view.widthAnchor),

        ]

        view.addConstraints(constrains)
        view.addSubview(hostView.view)
        
        let interaction = UIContextMenuInteraction(delegate: context.coordinator)
        
        view.addInteraction(interaction)
        
        
        return view
            
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        
    }
    
    class Coordinator : NSObject,UIContextMenuInteractionDelegate{
      
        
        
        
        var parent : ContextMenuHelper
        
        init(parent : ContextMenuHelper){
            
            self.parent = parent
        }
        
        func contextMenuInteraction(_ interaction: UIContextMenuInteraction, configurationForMenuAtLocation location: CGPoint) -> UIContextMenuConfiguration? {
            UIContextMenuConfiguration(identifier: nil){
                
                let preViewController = UIHostingController(rootView: self.parent.preView)
                preViewController.view.backgroundColor = .clear
                
                return preViewController
                
            } actionProvider: { item in
                
                self.parent.menu
            }
        }
        
        
        func contextMenuInteraction(_ interaction: UIContextMenuInteraction, willPerformPreviewActionForMenuWith configuration: UIContextMenuConfiguration, animator: UIContextMenuInteractionCommitAnimating) {
            
            
            animator.addCompletion {
                
                self.parent.onEnd()
                
                
            }
            
        }
    }
}
