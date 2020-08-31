//
//  ViewController.swift
//  Practice-MVVM
//
//  Created by Gerson Janhuel on 27/08/20.
//

import UIKit

class ListViewController: UITableViewController {

    var coursesViewModel = [CourseViewModel]()
    let cellId = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        fetchData()
    }
    
    private func setupTableView() {
        tableView.register(CourseCell.self, forCellReuseIdentifier: cellId)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 50
        tableView.tableFooterView = UIView()
    }
    
    private func fetchData() {
        self.coursesViewModel = []
        
        Service.shared.fetchCourses { (courses, err) in
            if let err = err {
                print("Failed to fetch courses:", err)
                return
            }
            
            if let courses = courses {
                self.coursesViewModel = courses.map({ .init(course: $0) })
            }
            self.tableView.reloadData()
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return coursesViewModel.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! CourseCell
        cell.courseModel = coursesViewModel[indexPath.row]
        return cell
    }

}

