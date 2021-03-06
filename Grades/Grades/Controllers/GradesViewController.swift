//
//  GradesViewController.swift
//  Grades
//
//  Created by centro docente de computos on 26/02/16.
//  Copyright © 2016 UdeM. All rights reserved.
//

import UIKit

class GradesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    // MARK: - Properties
    var courses = [Course]()//array de datos
    let cellIdentifier = "gradeCell" //identificador de la celda para reutilizarlo

    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        courses = Course.courses() //obtenemos los datos
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        //as! para castear forsadamente un tipo. solo si se esta seguro cual tipo es
        //let detailVC = segue.destinationViewController as! DetailViewController
        //otra opcion
        if let detailVC = segue.destinationViewController as? DetailViewController{
            if let course = sender as? Course{
                detailVC.course = course
            }
            
        }
    }
    
    
    // MARK: - UITableViewDataSource
    //para retornar algun valor en una funcion se usa -> tipodato
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return courses.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier)
        let course = courses[indexPath.row]
        cell?.textLabel?.numberOfLines = 0
        cell?.textLabel?.text = course.name
        cell?.detailTextLabel?.text = String(course.grade!)
        
        return cell!
    }
    
    // MARK: - UITableViewDelegate
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
        let course = courses[indexPath.row]
        self.performSegueWithIdentifier("detail", sender: course)
    }
    
    

}
