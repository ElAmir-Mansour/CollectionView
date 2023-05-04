
import UIKit;

class MultiViewVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var arrpPlaces = [Place]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        arrpPlaces.append(Place(title: "Home", photo: [UIImage(named: "Tree")!, UIImage(named: "Sunset")!, UIImage(named: "Tree")!, UIImage(named: "Butterflys")!]))
        
        arrpPlaces.append(Place(title: "Main Categories", photo: [UIImage(named: "Tree")!, UIImage(named: "Sunset")!, UIImage(named: "Tree")!, UIImage(named: "Butterflys")!],category: ["a","b","c","d"]))
        
        
        arrpPlaces.append(Place(title: "Top Rated", photo: [UIImage(named: "Tree")!, UIImage(named: "Sunset")!, UIImage(named: "Tree")!, UIImage(named: "Butterflys")!]))
       
        arrpPlaces.append(Place(title: "Most Visted", photo: [UIImage(named: "Tree")!, UIImage(named: "Sunset")!, UIImage(named: "Tree")!, UIImage(named: "Butterflys")!]))
    }
    
    struct Place {
        let title: String
        let photo: [UIImage]
        let category : [String]?
        init(title: String, photo: [UIImage], category: [String]? = nil) {
             self.title = title
             self.photo = photo
             self.category = category
         }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrpPlaces.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "mainCell", for: indexPath) as! CategoriesTableViewCell
            let place = arrpPlaces[indexPath.row]
            cell.setupCell(title: place.title, categories: place.category ?? [], photos: place.photo)
            return cell // Add this line
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "tvCell", for: indexPath) as! MultiTableViewCell
            let place = arrpPlaces[indexPath.row]
            cell.setupCell(title: place.title, arrPhotos: place.photo)

            if indexPath.row == 0 {
                cell.startAutoScrolling()
            } else {
                cell.stopAutoScrolling()
            }

            return cell
        }
    }

    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 1 { // main categories section
               return 100// set a different height for main categories cell
           } else { // other sections
               return 200 // set a default height for other cells
           }
    }
}
