//
//  ViewController.swift
//  ElementTableView
//
//  Created by Ani Adhikary on 18/11/17.
//  Copyright © 2017 Ani Adhikary. All rights reserved.
//

import UIKit

class ElementViewController: UIViewController {

    @IBOutlet weak var elementTableView: UITableView!
    
    var pt = [PeriodicTable]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPeriodicTableView()
    }
    
    func setupPeriodicTableView() {
        elementTableView.estimatedRowHeight = 100.0
        elementTableView.rowHeight = UITableViewAutomaticDimension        
        
        elementTableView.delegate = self
        elementTableView.register(UINib(nibName: "ElementTableViewCell", bundle: nil), forCellReuseIdentifier: "ElementCell")        
        elementTableView.register(UINib(nibName: "PeriodicTableHeaderTableViewCell", bundle: nil), forCellReuseIdentifier: "PeriodicTableHeaderTableViewCell")
        elementTableView.register(UINib(nibName: "PeriodicTableFooterTableViewCell", bundle: nil), forCellReuseIdentifier: "PeriodicTableFooterTableViewCell")
        
        pt = getElements()
    }
    
    func getElements() -> [PeriodicTable] {
        
        var periodicTable = [PeriodicTable]()
        
        let lith­iumGroup = [
            Element(elementName: "Hydrogen", elementSymbol: "H"),
            Element(elementName: "Lithium", elementSymbol: "Li"),
            Element(elementName: "Sodium", elementSymbol: "Na"),
            Element(elementName: "Potassium", elementSymbol: "K")
        ]
        
        let beryl­liumGroup = [
            Element(elementName: "Beryllium", elementSymbol: "Be"),
            Element(elementName: "Magnesium", elementSymbol: "Mg"),
            Element(elementName: "Calcium", elementSymbol: "Ca"),
            Element(elementName: "Strontium", elementSymbol: "Sr")
        ]
        
        let scan­diumGroup = [
            Element(elementName: "Scan­dium", elementSymbol: "Sc"),
            Element(elementName: "Yttrium", elementSymbol: "Y"),
            Element(elementName: "Lanthanum", elementSymbol: "La"),
            Element(elementName: "Actinium", elementSymbol: "Ac")
        ]
        
        let titan­iumGroup = [
            Element(elementName: "Titan­ium", elementSymbol: "Ti"),
            Element(elementName: "Zirconium", elementSymbol: "Zr"),
            Element(elementName: "Hafnium", elementSymbol: "Hf"),
            Element(elementName: "Rutherfordium", elementSymbol: "Rf")
        ]
        
        periodicTable = [
            PeriodicTable(groupName: "Lith­ium group", elements: lith­iumGroup),
            PeriodicTable(groupName: "Beryl­lium group", elements: beryl­liumGroup),
            PeriodicTable(groupName: "Scan­dium Group", elements: scan­diumGroup),
            PeriodicTable(groupName: "Titan­ium Group", elements: titan­iumGroup)
        ]
        
        return periodicTable
    }

    @objc func goToTopButtonClicked(_ button: UIButton) {
        elementTableView.scrollToRow(at: IndexPath(row: 0, section: 0), at: .top, animated: true)
    }

}

extension ElementViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return pt.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pt[section].elements.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let elementCell = tableView.dequeueReusableCell(withIdentifier: "ElementCell", for: indexPath) as! ElementTableViewCell
        
        let element = pt[indexPath.section].elements[indexPath.row]
        elementCell.elementLabel?.text = element.elementName
        elementCell.elementSymbolLabel?.text = element.elementSymbol
        elementCell.selectionStyle = .none
        return elementCell
    }
}

extension ElementViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        let cell = tableView.dequeueReusableCell(withIdentifier: "PeriodicTableHeaderTableViewCell") as! PeriodicTableHeaderTableViewCell
        cell.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 44)
        cell.groupNameLabel.text = pt[section].groupName
        headerView.addSubview(cell)
        return headerView
    }
    
    //Add a footer view only at the end of the last section
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
        if pt.count - 1 == section {
            let footerView = UIView()
            let cell = tableView.dequeueReusableCell(withIdentifier: "PeriodicTableFooterTableViewCell") as! PeriodicTableFooterTableViewCell
            cell.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 44)
            cell.goToTopButton.addTarget(self, action: #selector(goToTopButtonClicked(_:)), for: .touchUpInside)
            footerView.addSubview(cell)
            return footerView
        } else {
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if pt.count - 1 == section {
            return 50
        } else {
            return 0.0
        }
    }
}

