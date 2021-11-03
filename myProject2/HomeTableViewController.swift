//
//  HomeTableViewController.swift
//  myProject2
//
//  Created by Haya on 25/03/1443 AH.
//flowerTitle: UILabel!


import UIKit


class HomeTableViewController: UITableViewController {
    var myStore = Store()
    var selectedFlowerIndex : Int!
    @IBOutlet var myTable: UITableView!
    @IBAction func DelletAll(_ sender: Any) {
        
        myStore.products.removeAll()
        tableView.reloadData()
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad ()
        myTable.register(UINib(nibName: "FlowerTableViewCell", bundle: nil), forCellReuseIdentifier: "flowerCell")
        myTable.rowHeight = 134
       
    
        myStore.products.append(Flower(title: "ورد الجبسوفيليا", info: "يستمد اسم ورد ( الجبسوفيليا ) من طبيعة التربة التي تنمو بها ، حيث انها بالفعل تنمو في التربة المخلوطة بالجبس الطبيعي ، وإذا اردت أن تقوم بزراعة هذا النوع من الزهور في منزلك ، فالوقت الذي يحتاجه نمو ورد  الجبسوفيليا ) هو 120 يوم من بعد وضع البذور في الأرض ، وهناك عدد نوعين من ورد ( الجبسوفيليا ) وهو النوع العطري الذي تصدر منه روائح مختلفة بحسب ألوان زهوره ، والنوع الثاني هو الزينة الذي ينمو باللون الأبيض والا تصدر منه رائحة ( وهذا النوع هو الذي يستخدم في صنع أطواق زهور الرأس ", photo: UIImage(named:"images")!))
    
    
    
        myStore.products.append(Flower(title: "ورد الجوري", info: "يعتبر الورد الجوري الوردة الوطنيّة في الجمهورية السوريّة، حيث يقدم مظهرها التعبيري مزيجاً من مشاعر الأمل والاعتزاز بالنفس والسكينة والتأمل، كما ترمز إلى المشاعر الصادقة والحب والنبل والخلود، وتنتشر الوردة الجوريّة بكثافة في مختلف البلاد العربيّة، وخاصةً بلاد الشام، حيث يتم تصديرها إلى البلاد الأوروبيّة لاستخدامها في تصنيع العطور باهظة الثمن، نظراً إلى الروائح العطريّة المميزة والمتنوعة المنبعثة منها بقوة، وتعتبر مدينة النيرب في الشمال من محافظة حلب السوريّة واحدة من أكثر المدن زراعةً للورد الجوريّ وتصديراً له خاصةً إلى شركات العطور الفرنسيّة، ويعتبر العطر المستخلص من الورد الجوري من أفضل العطور رائحة ومن أرقى الأنواع العالميّة", photo: UIImage(named: "images-1")!))
    
    
    
        myStore.products.append(Flower(title: "زهرة الجثة", info: " هي من أكثر الورود غموضاً في العالم، وتنتمي إلى الفصيلة القلقاسية. بالإضافة إلي ذلك، فإنها تُعد من أكبر الورود في العالم.كذلك ، فإن زهر الجثة تزهر مرة واحدة كل أربعين عاما ثم تموت بعد اسبوع. من ناحية أخري، فإنها تتميز بانبعاث رائحة غريبة تشبه رائحة اللحم الفاسد، بالإضافة إلي ذلك، فإنها تنمو في الغابات الإستوائية.", photo: UIImage(named: "1-1444491.JPG")!))
        
        myStore.products.append(Flower.init(title: "ورد كاريري ", info: "يعتبر هذا النوع من الورد الأبيض بمثابة مجموعة رائعة من الورود البيضاء ، وتتميز هذه الورود بأنها الأقل شوكة ، كما أنها تحمل شكلًا غير رسمي إلى حد ما تتفتح بالكامل خلال شهري يونيو ويوليو ، وهذه الورود متسلقة وتنمو إلى عشرين قدماً", photo: UIImage(named: "w1.jpg")!))
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myStore.products.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "flowerCell", for: indexPath) as! FlowerTableViewCell
        cell.flowerTitle.text = myStore.products[indexPath.row].title
        cell.flowerInfo.text = myStore.products[indexPath.row].info
        cell.flowerImage.image = myStore.products[indexPath.row].photo
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("User select flower: \(indexPath.row)")
        selectedFlowerIndex = indexPath.row
        performSegue(withIdentifier: "editSegue", sender: self)
        
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            myStore.products.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
            }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "addSegue"){
            let addViewController = segue.destination as! AddViewController
            
            addViewController.FlowerModel = myStore
            
        }
        if (segue.identifier == "editSegue"){
            let addViewController = segue.destination as! AddViewController
            
            addViewController.FlowerModel = myStore
            addViewController.selectedFlowerIndex = selectedFlowerIndex
            
        }
    }

}

