//
//  Extentions.swift
//  CleverSecond
//
//  Created by Евгений Волчецкий on 16.12.22.
//

import Foundation
import UIKit

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayWithAllItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomCell.identifier, for: indexPath) as? CustomCell else { return UITableViewCell() }
        
        cell.configure(text: "\(arrayWithAllItems[indexPath.row].itemName) \(indexPath.row + 1)", descriptionText: "\(arrayWithAllItems[indexPath.row].itemDescription) \(indexPath.row + 1)", imageName: arrayWithAllItems[indexPath.row].imageName)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            arrayWithAllItems.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .left)
        }
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let item = arrayWithAllItems[sourceIndexPath.row]
        arrayWithAllItems.remove(at: sourceIndexPath.row)
        arrayWithAllItems.insert(item, at: destinationIndexPath.row)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let destination = DescriptionController()
        destination.model = arrayWithAllItems[indexPath.row]
        
        navigationController?.pushViewController(destination, animated: true)
        
    }
    
}

