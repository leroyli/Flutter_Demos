//
//  NativeController.swift
//  Runner
//
//  Created by Leroy on 2022/11/14.
//

import UIKit

class NativeController: UIViewController {
    
    let channel = (UIApplication.shared.delegate as? AppDelegate)?.channel
    
    lazy var btn: UIButton = {
        let b = UIButton(type: .custom)
        b.frame = CGRect(x: 100, y: 100, width: 200, height: 60)
        b.backgroundColor = .red
        b.setTitle("send data to flutter", for: .normal)
        b.layer.cornerRadius = 10
        b.addTarget(self, action: #selector(sendAction), for: .touchUpInside)
        return b
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(btn)
        // Do any additional setup after loading the view.
    }
    
    @objc func sendAction() {
        channel?.changeCount()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
