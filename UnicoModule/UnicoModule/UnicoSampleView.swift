//
//  UnicoSampleView.swift
//  UnicoModule
//
//  Created by Ronald de Souza Maciel on 08/04/22.
//

import Foundation
import UIKit
import AcessoBio

public class BiometricModule {
    public static func start() -> UIViewController {
        UnicoSampleView(nibName: nil, bundle: nil)
    }
}


class UnicoSampleView: UIViewController, AcessoBioManagerDelegate, SelfieCameraDelegate, AcessoBioSelfieDelegate {
  
    var unicoCheck: AcessoBioManager!

    override func viewDidLoad() {
        super.viewDidLoad()

        buildViews()
        buildAcessoBio()
    }
    
    // MARK: Create views
    
    private func buildViews () {
        let btOpenCamera = UIButton(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width - 50, height: 50));
        btOpenCamera.center = self.view.center
        btOpenCamera.setTitle("Abrir câmera", for: .normal)
        btOpenCamera.setTitleColor(.black, for: .normal)
        btOpenCamera.backgroundColor = .systemBlue
        btOpenCamera.addTarget(self, action: #selector(openCamera), for: .touchUpInside)
        self.view.addSubview(btOpenCamera)
    }
    
    // MARK: SDK Initialization
    
    private func buildAcessoBio () {
        unicoCheck = AcessoBioManager(viewController: self)
        unicoCheck.setTheme(UnicoTheme())
    }
    
    // MARK: IBActions
  
    @objc private func openCamera () {
        /*
         Para utilizar a Câmera Normal:
         
         unicoCheck.setSmartFrame(false)
         unicoCheck.setAutoCapture(false)
         unicoCheck.build().prepareSelfieCamera(self, jsonConfigName: "")
         
         Para utilizar a Câmera Inteligente:
         
         unicoCheck.setSmartFrame(true)
         unicoCheck.setAutoCapture(true)
         unicoCheck.build().prepareSelfieCamera(self, jsonConfigName: "")
         
         Para utlizar o Prova de Vidas com Interação:
         */
        unicoCheck.build().prepareSelfieCamera(self, jsonConfigName: "acesso-config")
    }
    /*
     Para gerar o arquivo JSON é necessário criar uma API key. Siga os passos abaixo:
     - Acesse o portal do cliente da unico com suas credenciais;
     - Navegue em Configurações > Integração > API Key;
     - Crie ou edite uma nova API Key;
     - Marque o campo "Utiliza liveness ativo" como SIM caso queira habilitar a câmera Prova de Vidas ou NÃO caso queira utilizar a Câmera Normal ou Inteligente;
     - Marque o campo "Utiliza autenticação segura na SDK" como SIM;
     - Expanda a seção SDK iOS, adicione o nome de sua aplicação iOS e o Bundle ID;
     - Salve as alterações.
     - Neste momento, retornará para a página de API Key e ao lado da API Key desejada, pressione o botão de download do Bundle;
     - Selecione a opção iOS;
     - Clique em "Gerar";
     Atenção: Uma nova aba será aberta contendo informações do projeto em formato JSON.
     Caso a nova aba não abra, por favor, verifique se o seu navegador está bloqueando os popups.
     - Salve o conteúdo desta nova aba em um novo arquivo JSON;
     - Adicione o arquivo salvo no seu projeto e adicione abaixo o nome do arquivo json no "jsonConfigName"
     */
    
    // MARK: SelfieCameraDelegate
    
    func onCameraReady(_ cameraOpener: AcessoBioCameraOpenerDelegate!) {
        cameraOpener.open(self)
    }
    
    /*
     Com a nova versão, o método onCameraFailed também foi alterado, segue o exemplo abaixo:
     */
    func onCameraFailed(_ message: ErrorPrepare!) {
        print("error message: \(String(describing: message.desc))")
    }
    
    // MARK: AcessoBioSelfieDelegate
    
    func onSuccessSelfie(_ result: SelfieResult!) {
        print("base64 result: \(String(describing: result.encrypted))")
    }
    
    func onErrorSelfie(_ error: ErrorBio!) {
        print("code:\(error.code) | description:\(error.desc)")
    }
    
    // MARK: AcessoBioManagerDelegate Callbacks
    
    func onErrorAcessoBioManager(_ error: ErrorBio!) {
        print("code:\(error.code) | description:\(error.desc)")
    }
    
    func onUserClosedCameraManually() {
        print("user closed camera manually")
    }
    
    func onSystemClosedCameraTimeoutSession() {
        print("session expired. system closed camera")
    }
    
    func onSystemChangedTypeCameraTimeoutFaceInference() {
        print("face not found. type of camera changed to default (no smart)")
    }
    
}


class UnicoTheme: NSObject, AcessoBioThemeDelegate  {
   
    func getColorSilhouetteSuccess() -> Any! {
        return UIColor.green
    }
    
    func getColorSilhouetteError() -> Any! {
        return UIColor.red
    }
    
    func getColorSilhouetteNeutral() -> Any! {
        return UIColor.yellow
    }
    
    func getColorBackground() -> Any! {
        return nil
    }
    
    func getColorBoxMessage() -> Any! {
        return nil
    }
    
    func getColorTextMessage() -> Any! {
        return nil
    }
    
    func getColorBackgroundPopupError() -> Any! {
        return nil
    }
    
    func getColorTextPopupError() -> Any! {
        return nil
    }
    
    func getColorBackgroundButtonPopupError() -> Any! {
        return nil
    }
    
    func getColorTextButtonPopupError() -> Any! {
        return nil
    }
    
    func getColorBackgroundTakePictureButton() -> Any! {
        return nil
    }
    
    func getColorIconTakePictureButton() -> Any! {
        return nil
    }
    
    func getColorBackgroundBottomDocument() -> Any! {
        return nil
    }
    
    func getColorTextBottomDocument() -> Any! {
        return nil
    }

}
