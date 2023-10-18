//
//  PortofolioPresenter.swift
//  portofolio
//
//  Created by Renotech ID on 17/10/23.
//

import Foundation
import Charts

protocol PortofolioViewDelegate: AnyObject{
    func dismissLoading()
    func showLoading()
    func showErrorPopUp()
    func showDonutChart(_ dataEntries:[ChartDataEntry], _ numberOfColor: Int)
    func showTypeTrxPicker(chartData:[ChartData])
}

class PortofolioPresenter{
    private let portofolioService: PortofolioService!
    
    private var charts : [Chart] = []
    var delegate : PortofolioViewDelegate?
    
    init() {
        self.portofolioService = PortofolioService()
    }
    
    func getUserPortofolio(){
        self.delegate?.showLoading()
        portofolioService.getPortofolioUser{(response) in
            self.delegate?.dismissLoading()
            switch response{
            case.done(value: let result):
                self.charts = result
                for chart in self.charts {
                    
                    if chart.type == "donutChart"{
                        let chartData: [ChartData] = chart.data ?? []
                        var dataEntries: [ChartDataEntry] = []
                        for data in chartData{
                            let dataEntry = PieChartDataEntry(value: Double(data.percentage!)!, label: data.label, data: data.label as AnyObject)
                            dataEntries.append(dataEntry)
                        }
                        self.delegate?.showDonutChart(dataEntries, dataEntries.count)
                        self.delegate?.showTypeTrxPicker(chartData: chartData)
                    }else if chart.type == "lineChart"{
                        
                    }
                }
                
            case .failed(message: let message):
                self.delegate?.showErrorPopUp()
            }
            
        }
    }
    
    
    
    
}
