//
//  StatsViewController.swift
//  Name Meaning
//
//  Created by Alenka Hohunska on 5/3/16.
//  Copyright © 2016 Hohunskyi. All rights reserved.
//

import UIKit
import Charts

class StatsViewController: BaseViewController, ChartViewDelegate {

    @IBOutlet weak var chartView: LineChartView!

    var stats : Stats?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        title = NSLocalizedString("Popularity", comment: "")

        chartView.delegate = self
        chartView.descriptionText = ""
        chartView.noDataTextDescription = ""
        chartView.drawGridBackgroundEnabled = true
        
        let leftAxis : ChartYAxis = chartView.leftAxis
        leftAxis.removeAllLimitLines()
        leftAxis.axisMaxValue = 1000.0;
        leftAxis.axisMinValue = 0;
        leftAxis.gridLineDashLengths = [5.0, 5.0]
        leftAxis.drawZeroLineEnabled = true
        leftAxis.drawLimitLinesBehindDataEnabled = true
        
        chartView.rightAxis.enabled = false;
        chartView.legend.form = .Line
        
        update()
    }
    
    
    func update() {
        
        let keys = stats!.keys()
        let values = stats!.values()
        let maxValue = values.map{Double($0)}.reduce(0) { $0 > $1 ? $0 : $1 }
        
        let leftAxis : ChartYAxis = chartView.leftAxis
        leftAxis.axisMaxValue = max(50, maxValue!)
        
        var yVals : [ChartDataEntry] = []
        
        for i in 0..<values.count {
            let val = Double(values[i])!
            let entry = ChartDataEntry(value:val, xIndex:i)
            yVals.append(entry)
        }
        
        let dataSet : LineChartDataSet = LineChartDataSet(yVals: yVals, label: "Name's usage per year")
        dataSet.setColor(UIColor(red: 199/255, green: 68/255, blue: 52/255, alpha: 1.0))
        dataSet.lineWidth = 2.0
        dataSet.drawCirclesEnabled = false
        dataSet.drawValuesEnabled = false
        
        let lineData  = LineChartData(xVals: keys, dataSets: [dataSet] )
        chartView.data = lineData
    }
}
