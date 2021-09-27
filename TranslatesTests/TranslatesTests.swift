//
//  TranslatesTests.swift
//  TranslatesTests
//
//  Created by Sergey Nazarov on 27.09.2021.
//

import XCTest
@testable import Translates

class TranslatesTests: XCTestCase {
    
    var sut: SearchViewController!
    
    var mockTableView: SearchViewController.MockTableViewSearch?
    
    let sectionModelTwoRow = [
        SearchResponseModel(
            id: 0,
            text: "foo",
            meanings: [
                MeaningsModel(id: 0, partOfSpeechCode: "", translation: nil, previewUrl: nil, imageUrl: nil, transcription: nil, soundUrl: ""),
                MeaningsModel(id: 1, partOfSpeechCode: "", translation: nil, previewUrl: nil, imageUrl: nil, transcription: nil, soundUrl: "")
            ]
        )
    ]
    
    override func setUp() {
        super.setUp()
        
        sut = SearchViewController()
        SearchAssembly.assembly(with: sut)
        
        sut.loadViewIfNeeded()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    

    func testInitSearchViewController() {
        let view = SearchViewController()
        SearchAssembly.assembly(with: view)

        XCTAssertNotNil(view.presenter)
    }
    
    func testNotNilWhenViewIsLoaded() {
        XCTAssertNotNil(sut.dataSource)
        XCTAssertNotNil(sut.searchBar)
        XCTAssertNotNil(sut.tableView)
    }
    
    func testDelegateIsSetWhenDidLoadedVC() {
        XCTAssertTrue(sut.tableView.delegate is SearchViewController)
    }
    
    func testDataSourceIsSetWhenDidLoadedVC() {
        XCTAssertTrue(sut.tableView.dataSource is SearchDataSource)
    }
    
    func testNumberOfSectionsIsOne() {
        let numberOfSection = sut.tableView.numberOfSections
        XCTAssertEqual(numberOfSection, 0)
    }
    
    func testNumberOfRowsInViewModel() {
        sut.dataSource?.prepareData(
            with: sectionModelTwoRow,
            my: []
        )
        sut.dataSource?.didCollapsed(by: 0)
  
        let numberOfRows = sut.tableView.numberOfRows(inSection: 0)
        XCTAssertEqual(numberOfRows, 2)
    }
    
    func testDidCollapsed() {
        sut.dataSource?.prepareData(
            with: sectionModelTwoRow,
            my: []
        )
        sut.dataSource?.didCollapsed(by: 0)
        var numberOfRows = sut.tableView.numberOfRows(inSection: 0)
        XCTAssertEqual(numberOfRows, 2)
        
        sut.dataSource?.didCollapsed(by: 0)
        sut.tableView.reloadData()
        numberOfRows = sut.tableView.numberOfRows(inSection: 0)
        XCTAssertEqual(numberOfRows, 0)
    }
    
    func testCellForRowAtIndexPathReturnsWordCell() {
        sut.dataSource?.prepareData(
            with: sectionModelTwoRow,
            my: []
        )
        sut.dataSource?.didCollapsed(by: 0)
        
        let cellWord = sut.dataSource?.sections[0].items[0]
        XCTAssertTrue(cellWord is WordCellModel)
        
    }
    
    func testHeadertIndexPathReturns() {
        sut.dataSource?.prepareData(
            with: sectionModelTwoRow,
            my: []
        )
        sut.dataSource?.didCollapsed(by: 0)
        
        let header = sut.dataSource?.sections[0].headerItem
        XCTAssertTrue(header is WordsHeaderViewModel)
        
    }
}
