//
//  ViewController.swift
//  DemoTextField
//
//  Created by Jony Singla on 09/03/17.
//  Copyright © 2017 Jony Singla. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
//    @IBOutlet weak var bottomConstraint1: NSLayoutConstraint!
    @IBOutlet var keyboardHeightLayoutConstraint: NSLayoutConstraint?
    
    
    var tableData = ["Ankur", "Vikrant", "Deepak", "Deepanshi","Sahil","Sonu","Anikate","Pooja"];
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        
    }
    
    func keyboardWillShow(_ notification:Notification) {
        
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            tableView.contentInset = UIEdgeInsetsMake(0, 0, keyboardSize.height, 0)
        }
    }
    func keyboardWillHide(_ notification:Notification) {
        
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            tableView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0)
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillShow, object: self.view.window)
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillHide, object: self.view.window)
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    
    // text field delegate
    // Also working this code but one issue
//    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool
//    {
//        let pointInTable:CGPoint = textField.superview!.convert(textField.frame.origin, to:tableView)
//        var contentOffset:CGPoint = tableView.contentOffset
//        contentOffset.y  = (pointInTable.y - 360)
//        if let accessoryView = textField.inputAccessoryView {
//            contentOffset.y -= accessoryView.frame.size.height
//        }
//        tableView.contentOffset = contentOffset
//        return true;
//    }
    
    // MARK: - UITableViewDataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell",
                                                 for: indexPath as IndexPath) as! CustomCell
        
        cell.dataLabel.text = tableData[indexPath.row]
        return cell
    }

//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print("Hello");
//    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

