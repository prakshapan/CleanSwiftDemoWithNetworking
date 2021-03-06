//
//  DogsListViewController.swift
//  CleanWithNetworking
//
//  Created by EightSquare on 1/31/18.
//  Copyright (c) 2018 EightSquare. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol DogsListDisplayLogic: class
{
    func presentFetchedData(viewModel: DogsList.FetchData.ViewModel)
}

class DogsListViewController: UIViewController, DogsListDisplayLogic
{
    var interactor: DogsListBusinessLogic?
    var router: (NSObjectProtocol & DogsListRoutingLogic & DogsListDataPassing)?
    
    @IBOutlet weak var tblview: UITableView!
    var displayedDogList: DogsList.FetchData.ViewModel? {
        didSet {
            self.tblview.reloadData()
        }
    }
    
    // MARK: Object lifecycle
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
    {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        setup()
    }
    
    // MARK: Setup
    
    private func setup()
    {
        let viewController = self
        let interactor = DogsListInteractor()
        let presenter = DogsListPresenter()
        let router = DogsListRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    // MARK: Routing
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if let scene = segue.identifier {
            let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
            if let router = router, router.responds(to: selector) {
                router.perform(selector, with: segue)
            }
        }
    }
    
    // MARK: View lifecycle
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        fetchData()
        setupTableView()
    }
    
    // MARK: Do something
    
    //@IBOutlet weak var nameTextField: UITextField!
    
    func fetchData()
    {
        let request = DogsList.FetchData.Request()
        interactor?.fetchData(request: request)
    }
    
    func presentFetchedData(viewModel: DogsList.FetchData.ViewModel)
    {
        self.displayedDogList = viewModel
        
    }
    
    fileprivate func setupTableView() {
        tblview.register(UINib(nibName: DogCell.identifier, bundle: Bundle.main),
                         forCellReuseIdentifier: DogCell.identifier)
        tblview.estimatedRowHeight = 44
        tblview.rowHeight = UITableViewAutomaticDimension
    }
    
}

extension DogsListViewController : UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let viewModel = displayedDogList?.breedName
        return viewModel != nil ? (displayedDogList?.breedName.count)! : 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DogCell.identifier, for: indexPath) as? DogCell else {
            fatalError("Wrong Cell")
        }
        
        if displayedDogList?.breedName != nil {
            let breedName = displayedDogList?.breedName[indexPath.row]
            let breedType =  displayedDogList?.breedTypes[indexPath.row]
            cell.loadData(title: breedName!, subtitle: breedType!)
        }
        return cell
    }
}
