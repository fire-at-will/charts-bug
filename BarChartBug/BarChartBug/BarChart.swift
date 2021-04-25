//
//  BarChart.swift
//  BarChartBug
//
//  Created by Will Taylor on 4/25/21.
//

import Foundation
import SwiftUI

import Charts

struct BuggyBarChart: UIViewRepresentable {

    func makeUIView(context: Context) -> BarChartView {

        let chart = BarChartView()
        return BPFrequencyValuesChartFactory.initializeChart(chart)
    }

    func updateUIView(_ chart: BarChartView, context: Context) {
        chart.data = BPFrequencyValuesChartFactory.buildChartData()
    }
}

class BPFrequencyValuesChartFactory {
    static func initializeChart(
        _ chart: BarChartView
        
    ) -> BarChartView {
        let axisColor = UIColor.label
        
        chart.data = buildChartData()
    
        chart.isMultipleTouchEnabled = false
        chart.highlightPerTapEnabled = false
        chart.highlightPerDragEnabled = false
        chart.dragEnabled = false
        chart.scaleXEnabled = false
        chart.scaleYEnabled = false
        chart.pinchZoomEnabled = false
        chart.doubleTapToZoomEnabled = false
        chart.legend.enabled = false

        // MARK: - X Axis
        let xAxis = chart.xAxis
        xAxis.granularity = 1
        xAxis.drawAxisLineEnabled = true
        xAxis.drawGridLinesEnabled = false
        xAxis.labelPosition = .bottom
        xAxis.valueFormatter = XAxisValueFormatter()
        xAxis.axisLineColor = axisColor
        xAxis.gridColor = axisColor
        xAxis.labelTextColor = axisColor

        // MARK: - Left Axis
        let leftAxis = chart.leftAxis
        leftAxis.axisLineColor = axisColor
        leftAxis.gridColor = axisColor
        leftAxis.labelTextColor = axisColor

        // MARK: - Right axis
        let rightAxis = chart.rightAxis
        rightAxis.drawLabelsEnabled = false
        rightAxis.drawAxisLineEnabled = false
        rightAxis.drawGridLinesEnabled = false

        return chart
    }

    static func buildChartData() -> ChartData {
        
        let dataSet1 = BarChartDataSet(entries: [BarChartDataEntry(x: 1, y: 2)], label: "Data Set 1")
        dataSet1.colors = [UIColor.green]
        dataSet1.drawValuesEnabled = false
        
        // Because data set 2 has more items than data set 1, Charts will crash.
        let dataSet2 = BarChartDataSet(entries: [
            BarChartDataEntry(x: 4, y: 2),
            BarChartDataEntry(x: 6, y: 2)
        ], label: "Data Set 2")
        dataSet1.colors = [UIColor.blue]
        dataSet1.drawValuesEnabled = false
        

        return BarChartData(dataSets: [dataSet1, dataSet2])
    }
}

private class XAxisValueFormatter: AxisValueFormatter {
    func stringForValue(_ value: Double, axis: AxisBase?) -> String {
       return "\(Int(value))"
    }
}
