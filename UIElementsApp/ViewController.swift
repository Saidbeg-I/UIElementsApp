//
//  ViewController.swift
//  UIElementsApp
//
//  Created by 1 on 28.01.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var segmentControl: UISegmentedControl!
    @IBOutlet var segmentLabel: UILabel!
    @IBOutlet var slider: UISlider!
    @IBOutlet var textFild: UITextField!
    @IBOutlet var hideIsLabel: UILabel!
    @IBOutlet var dataPicker: UIDatePicker!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpSlider()
        setUpSegmentElement()
        setUpMainLabel()
        hideIsLabel.text = ""
        
    
    }
    @IBAction func segmentActionControl() {
        switch segmentControl.selectedSegmentIndex {
        case 0:
            segmentLabel.text = "First Segment element"
            segmentLabel.textColor = .black
        case 1:
            segmentLabel.text = "Second Segment element "
            segmentLabel.textColor = .green
        default:
            segmentLabel.text = "Third Segment element "
            segmentLabel.textColor = .yellow
        }
    }
    @IBAction func sliderAction() {
        segmentLabel.text = String(slider.value)
        view.backgroundColor = view.backgroundColor?.withAlphaComponent(CGFloat(slider.value))
        
    }
    
    @IBAction func buttonTextPressed() {
        guard  let inputText = textFild.text, !inputText.isEmpty else {
            showAlert(with: "Enter your name", and: "Wrong Formate")
            return
        }
        if let _ = Double(inputText) {
            showAlert(with: "Enter your name", and: "Wrong Formate")
            return
        }
        segmentLabel.text = textFild.text
    }
    
    @IBAction func dataPickerPressed(_ sender: UIDatePicker) {
        sender.preferredDatePickerStyle = .compact
        let dataFormater = DateFormatter()
        dataFormater.dateStyle = .long
        
        segmentLabel.text = dataFormater.string(from: sender.date)
    }
    @IBAction func hideLabelSwitch(_ sender: UISwitch) {
        dataPicker.isHidden = !sender.isOn
        hideIsLabel.text = sender.isOn ? "Hide data picker" : "Show datapicker"
    }
    
    
    // MARK: - Private Methods
    private func setUpMainLabel() {
        segmentLabel.text = String(slider.value)
        segmentLabel.font = segmentLabel.font.withSize(35)
        segmentLabel.textAlignment = .center
        segmentLabel.numberOfLines = 2
        segmentLabel.textColor = .black
    }
    
    private func setUpSegmentElement() {
        segmentControl.insertSegment(withTitle: "Third", at: 2, animated: false)
        segmentControl.selectedSegmentTintColor = .red
        
    }
    private func setUpSlider(){
        slider.minimumValue = 0
        slider.maximumValue = 1
        slider.maximumTrackTintColor = .blue
        slider.minimumTrackTintColor = .red
        slider.thumbTintColor = #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)
        
    }

}
// MARK: - Alert action

extension ViewController {
    private func showAlert(with title: String, and messege: String){
        let alert = UIAlertController.init(title: title, message: messege, preferredStyle: .alert)
        
        let okAction = UIAlertAction.init(title: "Ok", style: .default) { _ in
            self.textFild.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
