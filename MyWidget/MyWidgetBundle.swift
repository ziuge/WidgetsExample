//
//  MyWidgetBundle.swift
//  MyWidget
//
//  Created by CHOI on 2023/07/07.
//

import WidgetKit
import SwiftUI

@main
struct MyWidgetBundle: WidgetBundle {
    var body: some Widget {
        MyWidget()
        MyWidgetLiveActivity()
    }
}
