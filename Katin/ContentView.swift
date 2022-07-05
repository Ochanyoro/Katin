//
//  ContentView.swift
//  Katin
//
//  Created by 大和田一裕 on 2022/07/05.
//

import SwiftUI

struct ContentView: View {
    @State var selection: Int = 0
    let maxCount: Int = 11
    @State var timerAdded: Bool = false
    @State var finish: Bool = false
    @State var start: Bool = false
    
    
    var body: some View {
        
        
        VStack {
            HStack(spacing:0) {
                Image(systemName: "heart.fill")
                    .foregroundColor(.pink)
                    .padding(.leading,10)
                Text("かほに一番似合うイケメンは誰🙄？？？")
                    .font(.headline)
                    .fontWeight(.bold)
                    .padding()
                    .padding(.leading,0)
            }
            .background(Color.red.opacity(0.2))
            .cornerRadius(10)
            
            Spacer().frame(height: 40)
            
            Button(action: {
                start = true
            }, label: {
                Text("スタート")
                    .padding()
                    .background(Color.green.opacity(0.7))
                    .cornerRadius(10)
                    .shadow(radius: 5)

            })
            .foregroundColor(.white)
            
            ZStack {
                TabView(selection: $selection,
                        content:  {
                    ForEach(0..<maxCount) { count in
                        Image("\(count)")
                            .resizable()
                            .scaledToFill()
                            .tag(count)
                    }
                })
                //.tabViewStyle(CarouselTabViewStyle)
                //.font(.system(size: 0.1))
                .frame(height: 300)
                .animation(.default)
                .opacity(start ? 1.0 : 0.0)
                .onAppear(perform: {
                    if !timerAdded {
                        addTimer()
                    }
            })
                
                    
                Image("top")
                    .resizable()
                    .scaledToFill()
                    .frame(height: 300)
                    .opacity(finish ? 1.0 : 0.0)
                    .animation(.easeOut(duration: 3.0))
                    .zIndex(-1)
                VStack {
                    
                    Text("俺でしたーーーーーー")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            
                            .opacity(finish ? 1.0 : 0.0)
                        .animation(.easeOut(duration: 3.0))
                Image(systemName: "heart.fill")
                    .font(.system(size: 80))
                    .foregroundColor(.white)
                   
                    .opacity(finish ? 1.0 : 0.0)
                    .animation(.easeOut(duration: 3.0))
                }
                
              
            }
            
            Button(action: {
                finish = true
                start = false
            }, label: {
                Text("結果を出す")
                    .padding()
                    .background(Color.blue.opacity(0.7))
                    .cornerRadius(10)
                    .shadow(radius: 5)
            })
            .opacity(finish ? 0.0 : 1.0)
            .foregroundColor(Color.white)
        }
    }
    
    // MARK: FUNCTIONS
    
    func addTimer() {
        
        timerAdded = true
        let timer = Timer.scheduledTimer(withTimeInterval: 0.15, repeats: true) { (timer) in
            
            selection = Int.random(in:0...10)
        }
        
        timer.fire()
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
