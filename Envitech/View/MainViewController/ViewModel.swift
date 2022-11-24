//
//  ViewModel.swift
//  Envitech
//
//  Created by intellithings on 24/11/2022.
//

import Foundation

class DataHandler {
    var fetchDataCounter: Int = 0

    func fetchData(position: Int, onCompletion: @escaping (Result<Response, CustomError>)->()) {
        NetworkService.shared.fetchData(onCompletion: onCompletion)
    }
}

class ViewModel {
    private var dataHandler: DataHandler = DataHandler()

    var error: ObservableObject<CustomError?> = ObservableObject(nil)
    var response: ObservableObject<Response?> = ObservableObject(nil)

    @objc func fetchData() {
        self.dataHandler.fetchData(position: dataHandler.fetchDataCounter) { [weak self] result in
            switch result {
            case .success(let response):
                self?.response.value = response
            case .failure(let error):
                self?.error.value = error
            }
        }
    }
    
    func getDropDownMenuTitles(monitorTypeId: Int) -> [String] {
        var releventMonitor: [String] = []
        if let monitor: [Monitor] = response.value?.monitor {
            for m in monitor {
                if m.monitorTypeID == monitorTypeId {
                    releventMonitor.append(m.name)
                }
            }
        }
        return releventMonitor
    }
    
    func getColorTitles(legendId: Int) -> [Tag] {
        if let legends: [Legend] = response.value?.legends {
            for legend in legends {
                if legend.id == legendId {
                    return legend.tags
                }
            }
        }
        return []
    }
}
