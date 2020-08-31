//
//  CourseCell.swift
//  Practive-MVC
//
//  Created by Gerson Janhuel on 27/08/20.
//

import UIKit

class CourseCell: UITableViewCell {
    
    // now our view is attach with View Model not directly to Model
    var courseModel: CourseViewModel! {
        didSet {
            // view only consumes prepared data, no additional logic here
            // so if we want to do testing, we can test the ViewModel instead, not the view 
            textLabel?.text = courseModel.name
            detailTextLabel?.text = courseModel.numberOfLessons
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
            
        // cell styling
        textLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        textLabel?.numberOfLines = 0
        detailTextLabel?.textColor = .black
        detailTextLabel?.font = UIFont.systemFont(ofSize: 20, weight: .light)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
}
