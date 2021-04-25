//
//  ContentView.swift
//  BarChartBug
//
//  Created by Will Taylor on 4/25/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Buggy chart:")
            .padding()
        
        BuggyBarChart()
            .frame(width: 200, height: 200)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
