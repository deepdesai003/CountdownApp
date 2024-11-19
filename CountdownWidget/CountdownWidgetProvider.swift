//
//  CountdownWidgetProvider.swift
//  CountdownApp
//
//  Created by Deep on 2024-11-18.
//

import WidgetKit
import SwiftUI

struct CountdownWidgetEntry: TimelineEntry {
    let date: Date
    let countdownDate: Date
    var remainingTime: String
}

struct CountdownWidgetProvider: TimelineProvider {
    typealias Entry = CountdownWidgetEntry

    // Set your target date here (e.g., New Year's Eve 2024)
    let targetDate: Date = Calendar.current.date(from: DateComponents(year: 2024, month: 12, day: 19))!

    // Provide placeholder data before actual data is available
    func placeholder(in context: Context) -> CountdownWidgetEntry {
        CountdownWidgetEntry(date: Date(), countdownDate: targetDate, remainingTime: "Loading...")
    }
    
    // Provide snapshot data (used for previews and widgets not yet rendered)
    func getSnapshot(in context: Context, completion: @escaping (CountdownWidgetEntry) -> ()) {
        let entry = CountdownWidgetEntry(date: Date(), countdownDate: targetDate, remainingTime: calculateRemainingTime(to: targetDate))
        completion(entry)
    }
    
    // Provide the timeline with updated entries (e.g., every second)
    func getTimeline(in context: Context, completion: @escaping (Timeline<CountdownWidgetEntry>) -> ()) {
        var entries: [CountdownWidgetEntry] = []
        
        let currentDate = Date()
        let remainingTime = calculateRemainingTime(to: targetDate)
        
        // Create an entry with the remaining time
        let entry = CountdownWidgetEntry(date: currentDate, countdownDate: targetDate, remainingTime: remainingTime)
        entries.append(entry)
        
        // Set the timeline to refresh every second
        let timeline = Timeline(entries: entries, policy: .after(currentDate.addingTimeInterval(600))) // refresh every second
        completion(timeline)
    }
    
    // Helper function to calculate the remaining time until the target date
    func calculateRemainingTime(to date: Date) -> String {
        let now = Date()
        let interval = date.timeIntervalSince(now)
        
        if interval <= 0 {
            return "Event Started!"
        }
        
        let days = Int(interval) / (60 * 60 * 24)
        
        return String(format: "%02d days", days)
    }
}
