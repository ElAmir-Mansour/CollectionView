
import UIKit

struct HomeModel {
    let title: String
    let data: [HomeData]
}

struct HomeData {
    let image: UIImage
    let des: String
    let name: String
}

class MultiViewVC: UIViewController {
    // MARK: - Variables
    var constant = Constant()
    var model = [HomeModel]()

    // MARK: - IBOutlet
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        appendData()
    }
    
    // MARK: - Functions
    private func appendData() {
        let homeSection: [HomeData] = [
            .init(image: constant.treeImage, des: " ", name: "Model"),
            .init(image: constant.butterflys, des: " ", name: "Model"),
            .init(image: constant.sunset, des: " ", name: "Model"),
            .init(image: constant.treeImage, des: " ", name: "Model")
        ]
        model.append(.init(title: "Home", data: homeSection))
        
        let mainCategoriesSection: [HomeData] = [
            .init(image: constant.treeImage, des: " ", name: "Model"),
            .init(image: constant.treeImage, des: " ", name: "Model"),
            .init(image: constant.treeImage, des: " ", name: "Model")
        ]
        model.append(.init(title: "Main Categories", data: mainCategoriesSection))
        
        let topRatedSection: [HomeData] = [
            .init(image: constant.sunset, des: " ", name: "Model"),
            .init(image: constant.sunset, des: " ", name: "Model"),
            .init(image: constant.sunset, des: " ", name: "Model")
        ]
        model.append(.init(title: "Top Rated", data: topRatedSection))

        let mostVistedSection: [HomeData] = [
            .init(image: constant.butterflys, des: " ", name: "Model"),
            .init(image: constant.butterflys, des: " ", name: "Model"),
            .init(image: constant.butterflys, des: " ", name: "Model")
        ]
        model.append(.init(title: "Most Visted", data: mostVistedSection))

    }
}


enum Section {
    case header, mainCategories, topRate, mostVisted
}

extension MultiViewVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        let label = UILabel()
        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        label.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        label.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        label.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true

        label.text = model[section].title
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 48
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "mainCell", for: indexPath) as! MultiTableViewCell
            let place = model[indexPath.section].data
            cell.setupCell(place)

            if indexPath.row == 0 {
                cell.startAutoScrolling()
            } else {
                cell.stopAutoScrolling()
            }
            return cell

        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "mainCell", for: indexPath) as! MultiTableViewCell
            let place = model[indexPath.section].data
            cell.setupCell(place)
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


struct Constant {
    let treeImage = UIImage(named: "Tree")!
    let sunset = UIImage(named: "Sunset")!
    let butterflys = UIImage(named: "Butterflys")!
}
