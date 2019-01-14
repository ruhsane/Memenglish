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

class ViewController: UIViewController {

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var detectedText: UITextView!
    @IBOutlet weak var translatedText: UITextView!
    @IBAction func translateButton(_ sender: Any) {
        self.translate(source: self.detectedText.text)

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        textDetect()
    }

    func textDetect(){

        let vision = Vision.vision()
        let textRecognizer = vision.onDeviceTextRecognizer()
        let image = VisionImage(image: self.image.image!)

        textRecognizer.process(image) { result, error in
            guard error == nil, let result = result else {
                // ...
                print("not recognized")
                return
            }

            let resultText = result.text
            print("recognized text")
            print(resultText)
            self.detectedText.text = resultText

            self.translate(source: resultText)
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

