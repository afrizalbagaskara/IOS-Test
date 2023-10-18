//
//  DetailTransactionViewController.swift
//  portofolio
//
//  Created by Renotech ID on 18/10/23.
//

import UIKit

class DetailTransactionViewController: UIViewController {

    
    @IBOutlet weak var detailTrxTableVIew: UITableView!
    
    var detailTrx : ChartData?
    override func viewDidLoad() {
        super.viewDidLoad()
        detailTrxTableVIew.delegate = self
        detailTrxTableVIew.dataSource = self
        detailTrxTableVIew.reloadData()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension DetailTransactionViewController:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return detailTrx?.data?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = detailTrxTableVIew.dequeueReusableCell(withIdentifier: "DetailTrxTableViewCell") as! DetailTrxTableViewCell
        
        let nominal : Int = detailTrx?.data?[indexPath.row].nominal ?? 0
        cell.dateLabel.text = detailTrx?.data?[indexPath.row].trx_date
        cell.nominalLabel.text = "Rp. \(nominal)"
        
        return cell
    }
    
    
}
