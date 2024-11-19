//
//  CountdownWidgetBundle.swift
//  CountdownWidget
//
//  Created by Deep on 2024-11-18.
//

import WidgetKit
import SwiftUI

@main
struct CountdownWidgetBundle: WidgetBundle {
    var body: some Widget {
        CountdownWidget()
        CountdownWidgetControl()
        CountdownWidgetLiveActivity()
    }
}
