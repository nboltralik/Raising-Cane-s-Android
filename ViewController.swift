//
//  ViewController.swift
//  Raising Cane's UA 2
//
//  Created by Nicholas Boltralik on 2/22/16.
//  Copyright © 2016 Nicholas Boltralik. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func isCanesOpen() {
        
        let date = NSDate()
        let calendar = NSCalendar.currentCalendar()
        let components = calendar.components([.Hour, .Minute, .Weekday], fromDate: date)
        let day = components.weekday
        let hour = components.hour
        let minutes = components.minute
        let time: Double = Double(hour + minutes/60)
        
        switch (day) {
        case 1:
            if (time<=2 || (time>=16 && time<24)){
                canesIsOpen() }
            else {
                canesIsClosed() }
        case 2,3,4:
            if (time>=10.5 && time<23) {
                canesIsOpen() }
            else {
                canesIsClosed() }
        case 5:
            if (time>=10.5 && time<=24) {
                canesIsOpen() }
            else {
                canesIsClosed() }
        case 6:
            if (time<=2 || (time>=10.5 && time<24)){
                canesIsOpen() }
            else {
                canesIsClosed() }
        case 7:
            if (time<=2 || (time>=10.5 && time<24)){
                canesIsOpen() }
            else {
                canesIsClosed() }
        default: break
        }
        setLabel2(day)
    }
    
    func canesIsOpen() {
        
        let label1 = self.view.viewWithTag(1) as? UILabel
        label1?.text = "Cane's is open, go get your fried chicken."
        
        let imageView = self.view.viewWithTag(3) as? UIImageView
        let image = UIImage(named: "open")
        imageView?.image=image
    }
    
    func canesIsClosed() {
        
        let label1 = self.view.viewWithTag(1) as? UILabel
        label1?.text="Cane's is closed, no chicken for you."
        
        let imageView = self.view.viewWithTag(3) as? UIImageView
        let image = UIImage(named: "closed")
        imageView?.image=image
    }
    
    func setLabel2(day: Int) {
        let label2 = self.view.viewWithTag(2) as? UILabel
        
        switch (day) {
        case 1:
            label2?.text="Today's Hours:\n12:00 AM - 2:00 AM\n4:00 PM - 12:00 AM"
        case 2,3,4:
            label2?.text="Today's Hours:\n10:30 AM - 11:00 PM"
        case 5:
            label2?.text="Today's Hours:\n10:30 AM - 2:00 AM"
        case 6:
            label2?.text="Today's Hours:\n12:00 AM - 2:00 AM\n10:30 AM - 2:00 AM"
        case 7:
            label2?.text="Today's Hours:\n12:00 AM - 2:00 AM\n10:30 AM - 2:00 AM"
        default:
            label2?.text="Invalid day"
        }
    }

}

