//
//  ContentView.swift
//  DarkMode_tutorial
//
//  Created by Jeff Jeong on 2021/03/31.
//

import SwiftUI

struct ContentView: View {
    
    @State fileprivate var shouldShowAlert = false
    
    @Environment(\.colorScheme) var scheme
    
    var body: some View {

        ZStack{
//            Color.yellow
            Theme.myBackgroundColor(forScheme: scheme)
            VStack{
                
                Spacer()
                
                Button(action: {
                    print("버튼이 클릭되었다")
                    shouldShowAlert.toggle()
                }, label: {
                    Text("로그인 하러 가기")
                        .font(.system(size: 18))
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                        .padding()
                        .background(Theme.myButtonBackgroundColor(forScheme: scheme))
                        .cornerRadius(13)
                        .overlay(
                            RoundedRectangle(cornerRadius: 13)
                                .stroke(Color.white, lineWidth: 3)
                        )
                })
                .alert(isPresented: $shouldShowAlert, content: {
                    Alert(title: Text("안녕하세요?!"), message: Text("오늘도 빡코딩!🔥👨‍💻"), dismissButton: .default(Text("닫기")))
                })
                Spacer().frame(height: 100)
            }
            
        }.edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Theme {
    static func myBackgroundColor(forScheme scheme: ColorScheme) -> Color {
        
        let lightColor = Color.white
        let darkColor = Color.init(#colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1))
        
        switch scheme {
        case .light:        return lightColor
        case .dark:         return darkColor
        @unknown default:   return lightColor
        }
        
    }
    
    static func myButtonBackgroundColor(forScheme scheme: ColorScheme) -> Color {
        
        let lightColor = Color.init(#colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1))
        let darkColor = Color.init(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1))
        
        switch scheme {
        case .light:        return lightColor
        case .dark:         return darkColor
        @unknown default:   return lightColor
        }
        
    }

}
