//
//  ConnectionViewController.swift
//  SwiftDemo
//
//  Created by Anthony on 2017/12/29.
//  Copyright © 2017年 Anthony. All rights reserved.
//

import UIKit
import FSCalendar

class ConnectionViewController: UIViewController, FSCalendarDataSource, FSCalendarDelegate {
    
    private weak var calendar: FSCalendar!
    
    override func loadView() {
        
        let view = UIView(frame: UIScreen.main.bounds)
        view.backgroundColor = UIColor.groupTableViewBackground
        self.view = view
        
        let height: CGFloat = UIDevice.current.model.hasPrefix("iPad") ? 400 : 300
        let calendar = FSCalendar(frame: CGRect(x: 0, y: self.navigationController!.navigationBar.frame.maxY, width: self.view.bounds.width, height: height))
        calendar.dataSource = self
        calendar.delegate = self
        calendar.scope = .month
        calendar.backgroundColor = UIColor.white
        self.view.addSubview(calendar)
        self.calendar = calendar
        
    }
    override func willAnimateRotation(to: UIInterfaceOrientation, duration: TimeInterval) {
        
    }
    
    override func didRotate(from: UIInterfaceOrientation) {
        let height: CGFloat = UIDevice.current.model.hasPrefix("iPad") ? 400 : 300
        var width = self.view.bounds.width
        if from.isPortrait {
           width /= 2
        }
        calendar.frame = CGRect(x:0, y:self.navigationController!.navigationBar.frame.maxY, width:width, height:height)
        calendar.reloadData()
        calendar.setCurrentPage(Date(), animated: false )
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "日程"
    }
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        if monthPosition == .previous || monthPosition == .next {
            calendar.setCurrentPage(date, animated: true)
        }
    }
    
}
