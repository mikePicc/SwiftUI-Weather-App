//
//  ContentView.swift
//  SwiftUi-weather
//
//  Created by Michael Piccerillo on 7/27/21.
//

import SwiftUI

/*
 notes:
 swiftUi is all about views
 every view you create is going to return a body and a view
  cmd-shift-L -> shortvcut for modifiers
 
 
 ORDER OF THE MODIFIERS MATTER
    you're wrapping a view within another view
 */

struct ContentView: View {
    
    @State private var isNight: Bool = false
    
    var body: some View {
      
        ZStack {
            backgroundView(isNight: $isNight)
            
            VStack{
                cityText(cityName: "Cupertino, CA")
                weatherTempWidget(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill",
                                  temp: 76)

                
                HStack{
                    weatherDayView(dayOfWeek: "TUE",
                                   imageName: "cloud.sun.fill",
                                   temp: 74)
                    weatherDayView(dayOfWeek: "WED",
                                   imageName: "sun.max.fill",
                                   temp: 70)
                    weatherDayView(dayOfWeek: "THU",
                                   imageName: "wind",
                                   temp: 66)
                    weatherDayView(dayOfWeek: "FRI",
                                   imageName: "sunset.fill",
                                   temp: 60)
                    weatherDayView(dayOfWeek: "SAT",
                                   imageName: "moon.stars.fill",
                                   temp: 55)
                }
                
                Spacer()
                
                Button(action: {
                    isNight.toggle()
                    
                }, label: {
                    weatherButton(title: "Change Day Time",
                                  textColor: .accentColor,
                                  backgroundColor: .white)
                })
                
                Spacer()
                
            }
            
        }
           
        
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



struct weatherDayView: View{
    
    var dayOfWeek: String
    var imageName: String
    var temp: Int
    
    
    var body: some View {
        VStack{
            Text(dayOfWeek) //day of week
                .font(.system(size: 20, weight: .medium))
                .foregroundColor(.white)
                
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 50)
            
            Text("\(temp)")
                .font(.system(size: 30, weight: .bold))
                .foregroundColor(.white)
            
                
        }
        .padding(5)
    }
}

struct backgroundView: View {
    
   @Binding var isNight: Bool
    
    
    var body: some View {
        
        
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue,
                                                   isNight ? .gray : Color("lightBlue")]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}

struct cityText:  View{
    
    var cityName: String
    
    var body: some View{
        
        Text(cityName)
            .font(.system(size: 32, weight: .medium))
            .foregroundColor(.white)
            .padding()
    }
}

struct weatherTempWidget: View {
    
    var imageName: String
    var temp: Int
    
    var body: some View {
        VStack(spacing: 10){
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            
            Text("\(temp)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }
        .padding(.bottom, 40)
    }
}

