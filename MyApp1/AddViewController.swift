//
//  AddViewController.swift
//  MyApp1
//
//  Created by Marcin on 01.06.2017.
//  Copyright © 2017 Marcin. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {

    @IBOutlet weak var titleTextField: UITextField! = UITextField()
    @IBOutlet weak var notesTextView: UITextView! = UITextView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addButtonTapped(_ sender: Any) {
        
        let userDefault:UserDefaults = UserDefaults.standard
        
        var itemList:NSMutableArray? = userDefault.object(forKey: "itemList") as? NSMutableArray
        
        
        let dataSet:NSMutableDictionary = NSMutableDictionary()
        dataSet.setObject(titleTextField.text, forKey: "itemTitle" as NSCopying)
        dataSet.setObject(notesTextView.text, forKey: "itemNote" as NSCopying)
        
        if (itemList != nil) {
            let  newMutableList:NSMutableArray = NSMutableArray()
            
            for dict:Any in itemList!{
                newMutableList.addObjects(from: [dict as! NSDictionary])
            }
            userDefault.removeObject(forKey: "itemList")
            newMutableList.addObjects(from: [dataSet as AnyObject])
            userDefault.set(newMutableList, forKey: "itemList")
        
        }else{
            itemList = NSMutableArray()
            itemList?.addObjects(from: [dataSet as Any])
            userDefault.set(itemList, forKey: "itemList")
        
        }
        
        userDefault.synchronize()
        self.navigationController?.popToRootViewController(animated: true)
        
    }

    

}
