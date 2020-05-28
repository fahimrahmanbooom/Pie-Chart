//
//  ViewController.swift
//  My Charts
//
//  Created by Fahim Rahman on 15/3/20.
//  Copyright © 2020 Fahim Rahman. All rights reserved.
//

import UIKit
import Charts

class ViewController: UIViewController {

    @IBOutlet weak var pieView: PieChartView!
    
    @IBOutlet weak var iosStepper: UIStepper!
    
    @IBOutlet weak var androidStepper: UIStepper!
    
    var iosDataEntry = PieChartDataEntry(value: 0)
    var androidDataEntry = PieChartDataEntry(value: 0)
    var numberOfUsersDataEntry = [PieChartDataEntry]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        iosDataEntry.value = iosStepper.value
        iosDataEntry.label = "iOS"
        
        androidDataEntry.value = androidStepper.value
        androidDataEntry.label = "Android"
        
        numberOfUsersDataEntry = [iosDataEntry, androidDataEntry]
        updateChartData()
    }
    
    
    @IBAction func changeiOS(_ sender: UIStepper) {
        
        iosDataEntry.value = sender.value
        updateChartData()
    }
    
    
    @IBAction func changeAndroid(_ sender: UIStepper) {
        
        androidDataEntry.value = sender.value
        updateChartData()
    }
    
    func updateChartData() {
        
        let chartDataSet = PieChartDataSet(entries: numberOfUsersDataEntry, label: nil)
        let chartData = PieChartData(dataSet: chartDataSet)
        let colors = [UIColor.systemTeal, UIColor.systemIndigo]
        chartDataSet.colors = colors
        pieView.data = chartData
    }
    
}
