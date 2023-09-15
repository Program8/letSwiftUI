//
//  ButtonView.swift
//  iOS
//
//  Created by Vijay Sachan on 13/09/23.
//

import SwiftUI
struct ButtonView: View {
    let font1=Font.title
    let font2=Font.largeTitle
    let fontColor = Color.gray
    var body: some View {
        ScrollView(.vertical){
            ZStack(alignment: .topLeading){
                Color.clear
                VStack(alignment:.center,spacing: 20){
                    Group {
                        // PrimitiveButtonStyle
                        Button("ButtonStyle .plain",action: {}).buttonStyle(.plain).font(font1)
                        Button("ButtonStyle .automatic",action: {}).buttonStyle(.automatic).font(font1)
                        Button("ButtonStyle .bordered",action: {}).buttonStyle(.bordered).font(font1)
                        Button("ButtonStyle .borderedProminent",action: {}).buttonStyle(.borderedProminent).font(font1)
                        Button("ButtonStyle .borderless",action: {}).buttonStyle(.borderless).font(font1)
                        // ButtonRole
                        Button("ButtonRole .cancel", role:.cancel, action: {}).font(font1)
                        Button("ButtonRole .destructive", role:.destructive, action: {}).font(font1)
                        // clipShape
                        Button("clipShape Capsule",action: {}).buttonStyle(.borderedProminent).font(font1).clipShape(Capsule())
                        Button("clipShape RoundedRectangle",action: {}).buttonStyle(.borderedProminent).font(font1).clipShape(RoundedRectangle(cornerRadius: 15))
                        Button("clipShape\nCircle",action: {}).font(font1).frame(width:150,height:150).background(Color.blue).foregroundColor(Color.white)
.clipShape(Circle())
                    }
                    Group {
                        VStack(spacing: 5){
                            Text("ButtonStyle custom \n Tap below button to change background image").multilineTextAlignment(.center).font(.title3).fixedSize(horizontal: false, vertical: true)
                            Button(action: {}, label: {
                                ZStack{
                                    
                                }.frame(width:150,height:150)
                            }).buttonStyle(ButtonStyleBGImage())
                        }
                        // Custom ButtonStyle
                        Button("ButtonStyle custom \n Tap button to tint background color",action: {}).buttonStyle(ButtonStyleTintBGColor()).font(font1)
                    }
                    
                }.frame(maxWidth: .infinity).background(Color.clear).padding(.all,5)
            }
        }
    }
}
//private struct MyButtonView<S>: View where S:PrimitiveButtonStyle{
//    let subText:String
//    var buttonStyle:S
//    let font1=Font.title
//    let font2=Font.title3
//    var body: some View {
//        VStack(alignment: .center,spacing: 5){
//            Button("Button",action: {}).buttonStyle(buttonStyle).font(font1)
//            Text(subText).font(font2)
//        }
//
//    }
//}
private struct ButtonStyleTintBGColor:ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(configuration.isPressed ? Color.red : Color.yellow)
        //            .foregroundStyle(.white)
    }
}
private struct ButtonStyleBGImage:ButtonStyle{
    let imageDefault=Image(systemName: "square.and.arrow.up.circle").resizable()
    let imagePressed=Image(systemName: "square.and.arrow.up.circle.fill").resizable()
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .background(content: {
                configuration.isPressed ? imagePressed : imageDefault
            })
    }
}
struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView()
    }
}
