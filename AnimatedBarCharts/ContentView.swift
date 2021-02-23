//
//  ContentView.swift
//  AnimatedBarCharts
//
//  Created by Justin Viasus on 2/22/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var pickerSelectedItem = 0
    
    @State var dataPoints: [[CGFloat]] = [
        [50, 100, 150, 30, 40],
        [150, 100, 50, 200, 10],
        [10, 20, 30, 50, 100]
    ]
    
    var body: some View {
        ZStack {
            
            Color("appBackground").edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("Calorie Intake")
                    .foregroundColor(Color("title"))
                    .font(.system(size: 34))
                    .fontWeight(.heavy)
                
                Picker(selection: $pickerSelectedItem, label: Text(""), content: {
                    Text("Weekday").tag(0) // the tag values corespond to the pickerSelectedItem, if we set pickerSelectedItem to 1, the afternoon will be highlighted when the app starts
                    Text("Afternoon").tag(1)
                    Text("Evening").tag(2)
                }).pickerStyle(SegmentedPickerStyle())
                .padding(.horizontal, 24)
                
                HStack (spacing: 16){
                    BarView(value: dataPoints[pickerSelectedItem][0])
                    BarView(value: dataPoints[pickerSelectedItem][1])
                    BarView(value: dataPoints[pickerSelectedItem][2])
                    BarView(value: dataPoints[pickerSelectedItem][3])
                    BarView(value: dataPoints[pickerSelectedItem][4])
                    
                }.padding(.top, 24)
                .animation(.default) // when you change the state of whatever is inside the HStack, it is going to animate it
            }
        }
    }
}

struct BarView: View {
    
    var value: CGFloat
    
    var body: some View {
        VStack {
            ZStack (alignment: .bottom){
                Capsule().frame(width: 30, height: 200)
                    .foregroundColor(Color(#colorLiteral(red: 0.2912432551, green: 0.9053429365, blue: 0.7233905792, alpha: 1)))
                Capsule().frame(width: 30, height: value)
                    .foregroundColor(.white)
            }
            Text("D").padding(.top, 8)
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
