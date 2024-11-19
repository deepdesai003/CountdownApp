//
//  CountdownWidget.swift
//  CountdownWidget
//
//  Created by Deep on 2024-11-18.
//

import WidgetKit
import SwiftUI

extension View {
    func widgetBackground(backgroundView: some View) -> some View {
        if #available(watchOS 10.0, iOSApplicationExtension 17.0, iOS 17.0, macOSApplicationExtension 14.0, *) {
            return containerBackground(for: .widget) {
                backgroundView
            }
        } else {
            return background(backgroundView)
        }
    }
}

struct CountdownWidgetEntryView: View {
    var entry: CountdownWidgetProvider.Entry
    
    

    var body: some View {
        
        
        ZStack {  // Set the color you want and adjust the opacity
        
            Image("NewHouseBackground")
                // Make the image resizable
                .scaledToFill()// Ensure it fills the widget
           
            Color.gray.opacity(0.15)
            
            
            VStack {
                Text(entry.remainingTime)  // This is the countdown text.
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .fontDesign(.serif)

                Text("To New Home!")  // This is the countdown text.
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .fontDesign(.rounded)
                    
                
            }
            
        }
        .widgetBackground(backgroundView: Color.clear)
    }
}


struct CountdownWidget: Widget {
    let kind: String = "CountdownWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: CountdownWidgetProvider()) { entry in
            CountdownWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("Event Countdown")
        .description("Displays a countdown to a specific event.")
        .supportedFamilies([.systemSmall, .systemMedium, .systemLarge])
    }
}

