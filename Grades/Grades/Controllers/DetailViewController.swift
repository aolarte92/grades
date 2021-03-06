//
//  DetailViewController.swift
//  Grades
//
//  Created by centro docente de computos on 26/02/16.
//  Copyright © 2016 UdeM. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    //MARK:- IBOutles
    @IBOutlet weak var nameCourseLabel: UILabel!
    @IBOutlet weak var gradeLabel: UILabel!
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var gradeTextField: UITextField!
    
    //MARK:- IBAction
    @IBAction func edit(sender: AnyObject) {
        if editButton.selected{
            editButton.selected = false
            
            if let gradeFloat = Float(gradeTextField.text!){
                if gradeFloat >= 0.0 && gradeFloat <= 5.0{
                    gradeLabel.text = gradeTextField.text
                    gradeLabel.hidden = false
                    gradeTextField.hidden = true
                }else{
                    let alert = UIAlertController(title: "Error", message: "Debe ingresar un número entre 0.0 y 5.0", preferredStyle: .Alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
                    self.presentViewController(alert, animated: true, completion: nil)
                }
            }
            
            gradeLabel.text = gradeTextField.text
        }else{
            editButton.selected = true
            gradeTextField.hidden = false
            gradeLabel.hidden = true
            gradeTextField.text = gradeLabel.text
        }
    }
    
    //MARK:- Properties
    var course = Course()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        nameCourseLabel.text = course.name
        gradeLabel.text = String(course.grade!)// ! para que n o muestre el valor opcional
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    //MARK: - Utils
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }

}
