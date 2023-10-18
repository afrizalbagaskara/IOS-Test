//
//  PortofolioViewController.swift
//  portofolio
//
//  Created by Renotech ID on 18/10/23.
//

import UIKit
import Charts

class PortofolioViewController: UIViewController {

    @IBOutlet weak var pieChart: PieChartView!
    
    @IBOutlet weak var typeTrxTableView: UITableView!
    
    var portofolioPresenter : PortofolioPresenter = PortofolioPresenter()
    
    var chartData: [ChartData] = []
    
    var selectedRowData: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        portofolioPresenter.delegate = self
        typeTrxTableView.delegate = self
        typeTrxTableView.dataSource = self
        
        portofolioPresenter.getUserPortofolio()
        
        
        
    }
    
    
    
    private func colorsOfCharts(numbersOfColor: Int) -> [UIColor] {
      var colors: [UIColor] = []
      for _ in 0..<numbersOfColor {
        let red = Double(arc4random_uniform(256))
        let green = Double(arc4random_uniform(256))
        let blue = Double(arc4random_uniform(256))
        let color = UIColor(red: CGFloat(red/255), green: CGFloat(green/255), blue: CGFloat(blue/255), alpha: 1)
        colors.append(color)
      }
      return colors
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "openDetailTransaction") {
            
            let destinationVC = segue.destination as! DetailTransactionViewController
            destinationVC.detailTrx = chartData[self.selectedRowData!]
            
            
            
        }
    }


}

extension PortofolioViewController:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chartData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = typeTrxTableView.dequeueReusableCell(withIdentifier: "TypeTrxTableViewCell") as! TypeTrxTableViewCell
        cell.selectionStyle = .blue
        cell.label.text = chartData[indexPath.row].label ?? ""
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedRowData = indexPath.row
        performSegue(withIdentifier: "openDetailTransaction" , sender: self)
    }
    
}

extension PortofolioViewController:PortofolioViewDelegate{
    
    func dismissLoading() {
        print("loading")
    }
    
    func showLoading() {
        print("loading")
    }
    
    func showErrorPopUp() {
        print("Error")
    }
    
    func showDonutChart(_ dataEntries: [Charts.ChartDataEntry], _ numberOfColor: Int) {
        let pieChartDataSet = PieChartDataSet(entries: dataEntries, label: "Transaksi")
        pieChartDataSet.colors = colorsOfCharts(numbersOfColor: numberOfColor)

        let pieChartData = PieChartData(dataSet: pieChartDataSet)
        let format = NumberFormatter()
        format.numberStyle = .none
        let formatter = DefaultValueFormatter(formatter: format)
        pieChartData.setValueFormatter(formatter)
      
        pieChart.data = pieChartData
    }
    
    func showTypeTrxPicker(chartData: [ChartData]) {
        self.chartData = chartData
        self.typeTrxTableView.reloadData()
    }
    
}
