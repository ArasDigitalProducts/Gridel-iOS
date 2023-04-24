//
//  SettingsViewController.swift
//  
//
//  Created by Marko Benačić on 23.04.2023..
//

import UIKit
import SnapKit

class SettingsViewController: UIViewController {
//    func configureStyle(with style: ConfigStyle) {
//        Gridel.configStyle = style
//    }

    var marginSize: Int?
    var columnCount: Int?
    var gutterSize: Int?

    var opacity: Double?
    var colorPrimary: UIColor?
    var colorSecondary: UIColor?

    let containerView = UIView()
    let stackView = UIStackView()

    let simpleConfigContainerView = UIView()
    let verboseConfigContainerView = UIView()
    let pageControl = UIPageControl()
    let scrollView = UIScrollView()
    let applyButton = UIButton(type: .roundedRect)


    override func viewDidLoad() {
        view.backgroundColor = .gray

        scrollView.delegate = self
        setupUI()
        renderViews()
    }

    private func setupUI() {
        simpleConfigContainerView.backgroundColor = .systemOrange
        verboseConfigContainerView.backgroundColor = .systemGreen

        stackView.axis = .horizontal

        applyButton.setTitle("Apply", for: .normal)
        applyButton.layer.cornerRadius = 20
        applyButton.backgroundColor = .systemBlue
        applyButton.setTitleColor(.white, for: .normal)

        setupPageControl()
    }

    private func setupPageControl() {
        pageControl.numberOfPages = 2
        pageControl.currentPage = 0
    }

    private func renderViews() {
        view.addSubview(containerView)
        containerView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide.snp.edges)
        }

        containerView.addSubview(applyButton)
        applyButton.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(64)
            make.bottom.equalToSuperview().offset(16)
        }

        containerView.addSubview(scrollView)
        scrollView.snp.makeConstraints { make in
            make.leading.trailing.top.equalToSuperview()
            make.bottom.equalTo(applyButton.snp.top)
        }

        scrollView.addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.leading.top.bottom.equalToSuperview()
        }

        stackView.addArrangedSubview(simpleConfigContainerView)
        stackView.addArrangedSubview(verboseConfigContainerView)

        simpleConfigContainerView.snp.makeConstraints { make in
            make.width.equalTo(scrollView.snp.width)
            make.height.equalTo(scrollView.snp.width)
        }

        verboseConfigContainerView.snp.makeConstraints { make in
            make.width.equalTo(scrollView.snp.width)
            make.height.equalTo(scrollView.snp.width)
        }

    }


}

extension SettingsViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let width = scrollView.frame.size.width
        let page = Int((scrollView.contentOffset.x + width / 2) / width)
        pageControl.currentPage = page
    }
}
