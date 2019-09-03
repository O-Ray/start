//
//  calendarTableViewCell.swift
//  start
//
//  Created by 大塚嶺 on 2019/09/03.
//  Copyright © 2019 大塚嶺. All rights reserved.
//

import UIKit
import EventKit

class CalendarTableViewCell: UITableViewCell {
    
    @IBOutlet var titileLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    var event: EKEvent! {
        didSet {
            
            titileLabel.text = event.title
            dateLabel.text = formatToString(date: event.startDate!) + "~" + formatToString(date: event.endDate!)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    @IBAction func tappedURLButton() {
        let interval = event.startDate!.timeIntervalSinceReferenceDate
        let url = URL(string: "calshow:\(interval)")!
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
    
    func formatToString(date: Date) -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy/MM/dd HH:mm"
        return dateFormatter.string(from: date)
    }
    
}
