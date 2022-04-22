//
//  ViewController.swift
//  WKWebViewDemo
//
//  Created by Jayabharathi S on 22/04/22.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKUIDelegate, WKScriptMessageHandler, WKNavigationDelegate {

    var webView: WKWebView!
    @IBOutlet weak var viewButton: UIButton!
    let events = ["postascript", "sizeNotification"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if let path = Bundle.main.path(forResource: "start", ofType: "html"){
            do {
                let contents = try String(contentsOfFile: path, encoding: .utf8)
                let baseURL = URL(fileURLWithPath: path)
                webView.loadHTMLString(contents, baseURL: baseURL)
            } catch {
                print(error)
            }
        }
//        let myURL = URL(string:"https://www.apple.com")
//        let myRequest = URLRequest(url: myURL!)
//        webView.load(myRequest)
        self.webView.uiDelegate = self
        self.webView.navigationDelegate = self
    }
    
    func registerScriptsAndEvents() {
        let controller = self.webView.configuration.userContentController
        for event in events {
            controller.add(self, name: event)
        }
    }

    override func loadView() {
            let webConfiguration = WKWebViewConfiguration()
            webView = WKWebView(frame: .zero, configuration: webConfiguration)
            webView.uiDelegate = self
            view = webView
    }

    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        if let msgInfo = message.body as? Dictionary<String,Any>{
            print(msgInfo["height"])
        }
        print("callback reveived")
    }

//    func webView(_ webView: WKWebView, runJavaScriptTextInputPanelWithPrompt prompt: String, defaultText: String?, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping (String?) -> Void) {
//        print("its called")
//        if let dataFromString = prompt.data(using: .utf8, allowLossyConversion: false) {
//            print("hellohai \(dataFromString)")
////            let payload = JSON(data: dataFromString)
////            let type = payload["type"].string!
////
////            if (type == "SJbridge") {
////
////                let result  = callSwiftMethod(prompt: payload)
////                completionHandler(result)
////
////            } else {
//////                AppConstants.log("jsi_", "unhandled prompt")
////                completionHandler(defaultText)
////            }
////        }else {
//////            AppConstants.log("jsi_", "unhandled prompt")
////            completionHandler(defaultText)
//        }
//    }

//    func callSwiftMethod(prompt : JSON) -> String{
//
//        let functionName = prompt["functionName"].string!
//        let param = prompt["data"]
//
//        var returnValue = "returnvalue"
//
////        AppConstants.log("jsi_", "functionName: \(functionName) param: \(param)")
//
//        switch functionName {
//        case "functionOne":
//            returnValue = handleFunctionOne()
//        case "functionTwo":
//            returnValue = handleFunctionTwo()
//        default:
//            returnValue = "returnvalue";
//        }
//        return returnValue
//    }
    
//    func handleFunctionOne() -> String {
//        return "function1"
//    }
//
//    func handleFunctionTwo() -> String {
//        return "function2"
//    }

    @IBAction func onClickView(_ sender: Any) {
//        let webConfiguration = WKWebViewConfiguration()
//        webView = WKWebView(frame: .zero, configuration: webConfiguration)
//        webView.uiDelegate = self
//        view = webView
//        let myURL = URL(string:"https://www.apple.com")
//        let myRequest = URLRequest(url: myURL!)
//        webView.load(myRequest)
    }
}

