//
//  ViewController.swift
//  Meme
//
//  Created by Ruhsane Sawut on 1/9/19.
//  Copyright © 2019 ruhsane. All rights reserved.
//

import UIKit
import Firebase
import ROGoogleTranslate

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var memeImage: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var tableViewCell: UITableViewCell!
    
    @IBOutlet weak var detectedText: UITextView!
    @IBOutlet weak var translatedText: UITextView!
    @IBAction func translateButton(_ sender: Any) {
        self.translate(source: self.detectedText.text)

    }
    
    var memes: [Meme] = []
    
    func createMemeArray() -> [Meme] {
        var tempMemes: [Meme] = []

        for i in 1..<4 {
            let name: String = "meme" + i.description
            let meme = Meme(memeImage: UIImage(named: name)!, detectedText: textDetect(image: UIImage(named: name)!), translatedText: "")
            tempMemes.append(meme)

        }
        return tempMemes

    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return memes.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "cell")
//        cell.memeImage = memes[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let screenSize = UIScreen.main.bounds
        let screenHeight = screenSize.height
        
        return screenHeight
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        createMemeArray()
//        textDetect()
        self.tableView.register(MemesTableViewCell.self, forCellReuseIdentifier: "cell")

    }

    func textDetect(image: UIImage) -> String {

        let vision = Vision.vision()
        let textRecognizer = vision.onDeviceTextRecognizer()
        let image = VisionImage(image: self.memeImage.image!)


        textRecognizer.process(image) { result, error in
            guard error == nil, let result = result else {
                // ...
                print("not recognized")
                return
            }

            let resultText = result.text
            print("recognized text")
            print(resultText)
        }
    }

    
    func translate(source: String) {
        let translator = ROGoogleTranslate()
        translator.apiKey = "AIzaSyBrwV0kCyy5LcowEbdHePx2roWE1pPI1Wk" // Add your API Key here

        var params = ROGoogleTranslateParams()
        params.source = "en"
//        params.target = toLanguage.text ?? "de"  //let user choose target language
        params.target = "zh"

        params.text = source

        translator.translate(params: params) { (result) in
            DispatchQueue.main.async {
                self.translatedText.text = "\(result)"
                print(result)
            }
        }
    }

}

