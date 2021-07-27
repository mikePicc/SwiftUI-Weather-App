//
//  WeatherButton.swift
//  SwiftUi-weather
//
//  Created by Michael Piccerillo on 7/27/21.
//
import SwiftUI
import UIKit
import Foundation


struct weatherButton: View {
    
    var title: String
    var textColor: Color
    var backgroundColor: Color
    
    var body: some View {
        Text(title)
            .frame(width: 280, height: 50)
            .background(backgroundColor)
            .foregroundColor(textColor)
            .font(.system(size: 23, weight: .medium))
            .cornerRadius(25)
        
    }
}
