//
//  HomeTableViewController.swift
//  myProject2
//
//  Created by Haya on 25/03/1443 AH.
//flowerTitle: UILabel!


import UIKit

struct arrFlower{
    var name :String
    var flowerInfo :String
    var photo : UIImage?
}
class HomeTableViewController: UITableViewController {
    var arrmyFlower = [arrFlower]()
    @IBOutlet var myTable: UITableView!
    @IBAction func DelletAll(_ sender: Any) {
        arrmyFlower.removeAll()
        tableView.reloadData()
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad ()
        myTable.register(UINib(nibName: "FlowerTableViewCell", bundle: nil), forCellReuseIdentifier: "flowerCell")
        myTable.rowHeight = 134
       
    
  arrmyFlower.append(arrFlower.init(name: "ورد الجبسوفيليا", flowerInfo: "يستمد اسم ورد ( الجبسوفيليا ) من طبيعة التربة التي تنمو بها ، حيث انها بالفعل تنمو في التربة المخلوطة بالجبس الطبيعي ، وإذا اردت أن تقوم بزراعة هذا النوع من الزهور في منزلك ، فالوقت الذي يحتاجه نمو ورد  الجبسوفيليا ) هو 120 يوم من بعد وضع البذور في الأرض ، وهناك عدد نوعين من ورد ( الجبسوفيليا ) وهو النوع العطري الذي تصدر منه روائح مختلفة بحسب ألوان زهوره ، والنوع الثاني هو الزينة الذي ينمو باللون الأبيض والا تصدر منه رائحة ( وهذا النوع هو الذي يستخدم في صنع أطواق زهور الرأس ", photo: UIImage(named:"images")!))
    
    
    
    arrmyFlower.append(arrFlower.init(name: "لورد الجوري", flowerInfo: "يعتبر الورد الجوري الوردة الوطنيّة في الجمهورية السوريّة، حيث يقدم مظهرها التعبيري مزيجاً من مشاعر الأمل والاعتزاز بالنفس والسكينة والتأمل، كما ترمز إلى المشاعر الصادقة والحب والنبل والخلود، وتنتشر الوردة الجوريّة بكثافة في مختلف البلاد العربيّة، وخاصةً بلاد الشام، حيث يتم تصديرها إلى البلاد الأوروبيّة لاستخدامها في تصنيع العطور باهظة الثمن، نظراً إلى الروائح العطريّة المميزة والمتنوعة المنبعثة منها بقوة، وتعتبر مدينة النيرب في الشمال من محافظة حلب السوريّة واحدة من أكثر المدن زراعةً للورد الجوريّ وتصديراً له خاصةً إلى شركات العطور الفرنسيّة، ويعتبر العطر المستخلص من الورد الجوري من أفضل العطور رائحة ومن أرقى الأنواع العالميّة", photo: UIImage(named: "images-1")!))
    
    
    
    arrmyFlower.append(arrFlower.init(name: "زهرة الجثة", flowerInfo: " هي من أكثر الورود غموضاً في العالم، وتنتمي إلى الفصيلة القلقاسية. بالإضافة إلي ذلك، فإنها تُعد من أكبر الورود في العالم.كذلك ، فإن زهر الجثة تزهر مرة واحدة كل أربعين عاما ثم تموت بعد اسبوع. من ناحية أخري، فإنها تتميز بانبعاث رائحة غريبة تشبه رائحة اللحم الفاسد، بالإضافة إلي ذلك، فإنها تنمو في الغابات الإستوائية.", photo: UIImage(named: "1-1444491.JPG")!))
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrmyFlower.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "flowerCell", for: indexPath) as! FlowerTableViewCell
        cell.flowerTitle.text = arrmyFlower[indexPath.row].name
        cell.flowerInfo.text = arrmyFlower[indexPath.row].flowerInfo
        cell.flowerImage.image = arrmyFlower[indexPath.row].photo
        
//        let Data = arrmyFlower [indexPath.row]

        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
                arrmyFlower.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
            }
    }

}
}
