//
//  ViewController.swift
//  TestUnicoSDK
//
//  Created by Ronald de Souza Maciel on 06/04/22.
//

import UIKit
import ModuloX
import UnicoModule

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        buildViews()
    }
    
    
    private func buildViews () {
        let btOpenCamera = UIButton(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width - 50, height: 50));
        btOpenCamera.center = self.view.center
        btOpenCamera.setTitle("Abrir câmera", for: .normal)
        btOpenCamera.setTitleColor(.black, for: .normal)
        btOpenCamera.backgroundColor = .systemBlue
        btOpenCamera.addTarget(self, action: #selector(didTapOnStart), for: .touchUpInside)
        self.view.addSubview(btOpenCamera)
    }
    

    @objc
    func didTapOnStart(_ sender: Any) {
        let vc = BiometricModule.start()
        
        navigationController?.pushViewController(vc, animated: true)
    }
}

