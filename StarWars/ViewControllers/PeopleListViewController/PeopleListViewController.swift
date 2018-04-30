//
//  PeopleListViewController.swift
//  StarWars
//
//  Created by Никита on 30.04.2018.
//  Copyright © 2018 Никита. All rights reserved.
//

import Foundation
import UIKit
import PinLayout

class PeopleListViewController: BaseViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var detailView : DetailView?
    var maskView = UIView()
    var dataSource = [People]()
    var tempResults = [People]()
    var selectedPeople : People?
    var pageNumber = defaultPage
    var tableViewOffset = CGPoint()
    var isLoadingNow = false

    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }
    
    //MARK: - Public
    
    func getPeopleList(with page: Int) {
        showLoading()
        PeopleService.shared.getPeopleList(page) { [weak self] (response, error) in
            let weakSelf = self
            weakSelf?.hideLoading()
            if let error = error {
                weakSelf?.showAlertMessage(with: error)
                return
            }
            guard let peopleList = response as? [People] else {return}
            weakSelf?.pageNumber += 1
            weakSelf?.tempResults = peopleList
            weakSelf?.dataSource += (weakSelf?.tempResults)!
            weakSelf?.tableView.reloadData()
            weakSelf?.isLoadingNow = false
        }
    }
    
    func openBrowser(with urlString: String) {
        guard let url = URL(string: urlString) else {return}
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
    //MARK: - Private
    
    private func initialSetup() {
        prepareContent()
        tableViewSetup()
    }
    
    private func prepareContent() {
        getPeopleList(with: pageNumber)
    }
    
    private func tableViewSetup() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.estimatedRowHeight = cellHeight
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.separatorStyle = .none
        registerCell()
    }
    
    private func registerCell() {
        let cell = UINib(nibName: String(describing: PeopleListTableViewCell.self), bundle: nil)
        tableView.register(cell, forCellReuseIdentifier: String(describing: PeopleListTableViewCell.self))
    }
    
    private func maskViewSetup() {
        maskView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.6)
        maskView.frame = view.bounds
        view.addSubview(maskView)
    }
    
    private func loadDetailView() {
        guard let detailView = UINib(nibName: String(describing: DetailView.self), bundle: nil).instantiate(withOwner: nil, options: [:]).first as? DetailView else {return}
        self.detailView = detailView
        self.detailView?.delegate = self
        self.detailView?.load(with: selectedPeople!)
        maskViewSetup()
        maskView.addSubview(self.detailView!)
        self.detailView?.pin.bottom(0)
        transitionAnimate(for: self.detailView!)
    }
    
    private func transitionAnimate(for view: UIView) {
        UIView.animate(withDuration: animateDuration) {
            let transition:CATransition = CATransition()
            transition.duration = animateDuration
            transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
            transition.type = kCATransitionPush
            transition.subtype = kCATransitionFromTop
            view.layer.add(transition, forKey: kCATransition)
        }
    }
    
    private func hideDetailView() {
        UIView.animate(withDuration: animateDuration, animations: {
            self.detailView?.transform = CGAffineTransform(translationX: 0, y: UIScreen.main.bounds.height)
        }) { (true) in
            self.maskView.removeFromSuperview()
            self.detailView?.removeFromSuperview()
        }
    }
    
}

extension PeopleListViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: PeopleListTableViewCell.self), for: indexPath) as! PeopleListTableViewCell
        let people = dataSource[indexPath.row]
        cell.load(with: people)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeight
    }
    
}

extension PeopleListViewController : UITableViewDelegate, DetailViewDelegate {
    func detailViewDidTapOpenBrowserButton(_ detailView: DetailView) {
        openBrowser(with: (selectedPeople?.url)!)
    }
    
    func detailViewDidTapCloseButton(_ detailView: DetailView) {
        hideDetailView()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedPeople = dataSource[indexPath.row]
        loadDetailView()
    }
        
    //MARK: - UIScrollViewDelegate
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        //Reloading data when page end became
        tableViewOffset = tableView.contentOffset
        let heightDifference = tableView.contentSize.height - tableView.frame.size.height
        if tableViewOffset.y > (heightDifference) {
            if !isLoadingNow {
                if tempResults.count >= onePageElementsCount {
                    getPeopleList(with: pageNumber)
                    isLoadingNow = true
                    return
                }
            }
        }
    }
    
}

