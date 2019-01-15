////
////  MainTableViewController.swift
////  Meme
////
////  Created by Ruhsane Sawut on 1/14/19.
////  Copyright © 2019 ruhsane. All rights reserved.
////
//
//import UIKit
//import Firebase
//import ROGoogleTranslate
//
//class MainTableViewController: UITableViewController {
//    
//    var memes = [UIImage]()
//
//    
//    func countImage() {
//        for i in 1..<5 {
//            let name: String = "meme" + i.description
//            memes.append(UIImage(named: name)!)
//        }
//    }
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        self.tableView.register(MemesTableViewCell.self, forCellReuseIdentifier: "cell")
//        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "cell") as! MemesTableViewCell
//        textDetect()
//
//        // Uncomment the following line to preserve selection between presentations
//        // self.clearsSelectionOnViewWillAppear = false
//
//        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
//        // self.navigationItem.rightBarButtonItem = self.editButtonItem
//    }
//
//    
//    func textDetect(){
//
//        let vision = Vision.vision()
//        let textRecognizer = vision.onDeviceTextRecognizer()
//        let image = VisionImage(image: self.cell.memeImage.image!)
//
//        textRecognizer.process(image) { result, error in
//            guard error == nil, let result = result else {
//                // ...
//                print("not recognized")
//                return
//            }
//
//            let resultText = result.text
//            print("recognized text")
//            print(resultText)
//            self.cell.detectedText.text = resultText
//
//            self.translate(source: resultText)
//        }
//    }
//
//
//    func translate(source: String) {
//        let translator = ROGoogleTranslate()
//        translator.apiKey = "AIzaSyBrwV0kCyy5LcowEbdHePx2roWE1pPI1Wk" // Add your API Key here
//
//        var params = ROGoogleTranslateParams()
//        params.source = "en"
//        //        params.target = toLanguage.text ?? "de"  //let user choose target language
//        params.target = "zh"
//
//        params.text = source
//
//        translator.translate(params: params) { (result) in
//            DispatchQueue.main.async {
//                self.cell.translatedText.text = "\(result)"
//                print(result)
//            }
//        }
//    }
//
//
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 1
//    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return memes.count
//    }
//    
//    
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "cell") as! MemesTableViewCell
//        cell.memeImage.image = memes[indexPath.row]
//        return cell
//    }
//
//    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        let screenSize = UIScreen.main.bounds
//        let screenHeight = screenSize.height
//        
//        return screenHeight
//    }
//    
//    /*
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
//
//        // Configure the cell...
//
//        return cell
//    }
//    */
//
//    /*
//    // Override to support conditional editing of the table view.
//    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
//        // Return false if you do not want the specified item to be editable.
//        return true
//    }
//    */
//
//    /*
//    // Override to support editing the table view.
//    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete {
//            // Delete the row from the data source
//            tableView.deleteRows(at: [indexPath], with: .fade)
//        } else if editingStyle == .insert {
//            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
//        }    
//    }
//    */
//
//    /*
//    // Override to support rearranging the table view.
//    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
//
//    }
//    */
//
//    /*
//    // Override to support conditional rearranging of the table view.
//    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
//        // Return false if you do not want the item to be re-orderable.
//        return true
//    }
//    */
//
//    /*
//    // MARK: - Navigation
//
//    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destination.
//        // Pass the selected object to the new view controller.
//    }
//    */
//
//}
