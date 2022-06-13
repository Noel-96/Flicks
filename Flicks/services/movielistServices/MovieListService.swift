//
//  movieListService.swift
//  Flicks
//
//  Created by Noel Obaseki on 25/04/2022.let endpoint = Endpoints.Movies(category: category)
//

import Foundation
import CoreData
import Combine

final class MovieListService: MovieListProtocol {
  
    private let coreDataStack: PersistenceController
    private let networkManager: NetworkType

    let moviesResponseSubject = PassthroughSubject<MoviesStoreResult, Error>()
    
    private var cancellableSet: Set<AnyCancellable> = []

    init(coreDataStack: PersistenceController = PersistenceController.shared, networkManager: NetworkType = NetworkManager.sharedInstance) {
        self.coreDataStack = coreDataStack
        self.networkManager = networkManager
    }
    
     
     
     func apiFailureHandler(error: Error) {
         if self.getPersistedMoviesCount() != 0 {
              print("cached ")
             self.moviesResponseSubject.send(MoviesStoreResult(dataType: .cached, error: error))
         } else {
              print("aint no data ")
             self.moviesResponseSubject.send(MoviesStoreResult(dataType: .noData, error: error))
         }
     }
     
    
     func fetchMoviesList(page: Int , category: Endpoints.Movies.Category) {
         let endpoint = Endpoints.Movies(page: page , category: category)
         let backgroundContext = self.coreDataStack.backgroundContext

         let decoder = JSONDecoder()
         decoder.userInfo[CodingUserInfoKey.context] = backgroundContext
         
         let networkCallPublisher: AnyPublisher<Movies, Error> =  networkManager.get(type: Movies.self, endpoint: endpoint, headers: [:], decoder: decoder)

          networkCallPublisher.sink {  (completion) in
              switch completion {
              case .finished: break
              case .failure(let error):
                   print("ze error waz ere \(error)")
                   self.apiFailureHandler(error: error)
              }
          } receiveValue: { [weak self] (_) in
               do {
                   try self?.deleteAllMovies()
                   try self?.coreDataStack.saveContext()
                   
                   if self?.getPersistedMoviesCount() ?? 0 != 0 {
                       self?.moviesResponseSubject.send(MoviesStoreResult(dataType: .live, error: nil))
                   } else {
                       self?.moviesResponseSubject.send(MoviesStoreResult(dataType: .noData, error: nil))
                   }
               } catch (let coreDataError) {
                  // apiFailureHandler(error: coreDataError)
               }
           }.store(in: &cancellableSet)
          
     }
     
     
     func fetchMoreMoviesList(page: Int , category: Endpoints.Movies.Category) {
         let endpoint = Endpoints.Movies(page: page , category: category)
         let backgroundContext = self.coreDataStack.backgroundContext

         let decoder = JSONDecoder()
         decoder.userInfo[CodingUserInfoKey.context] = backgroundContext
         
         let networkCallPublisher: AnyPublisher<Movies, Error> =  networkManager.get(type: Movies.self, endpoint: endpoint, headers: [:], decoder: decoder)

          networkCallPublisher.sink {  (completion) in
              switch completion {
              case .finished: break
              case .failure(let error):
                   print("ze error waz ere \(error)")
                   self.apiFailureHandler(error: error)
              }
          } receiveValue: { [weak self] (_) in
               do {
               //    try self?.deleteAllMovies()
                //   try self?.coreDataStack.saveContext()
                   
//                   if self?.getPersistedMoviesCount() ?? 0 != 0 {
                       self?.moviesResponseSubject.send(MoviesStoreResult(dataType: .live, error: nil))
//                   } else {
//                       self?.moviesResponseSubject.send(MoviesStoreResult(dataType: .noData, error: nil))
//                   }
               } catch (let coreDataError) {
                  // apiFailureHandler(error: coreDataError)
               }
           }.store(in: &cancellableSet)
          
     }
     
     func deleteAllMovies() throws {
         let fetchRequest: NSFetchRequest<NSFetchRequestResult> = Movie.fetchRequest()
         let batchDeleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
         batchDeleteRequest.resultType = .resultTypeObjectIDs

         do {
             let result = try coreDataStack.backgroundContext.execute(batchDeleteRequest) as? NSBatchDeleteResult
             let changes: [AnyHashable: Any] = [NSDeletedObjectsKey: result?.result as? [NSManagedObjectID] ?? []]
             NSManagedObjectContext.mergeChanges(fromRemoteContextSave: changes, into: [coreDataStack.backgroundContext])
             NSManagedObjectContext.mergeChanges(fromRemoteContextSave: changes, into: [coreDataStack.viewContext])
         } catch {
             throw error
         }
     }
     
     func getPersistedMoviesCount() -> Int {
         let fetchRequest: NSFetchRequest<Movie> = Movie.fetchRequest()
         return (try? coreDataStack.viewContext.count(for: fetchRequest)) ?? 0
     }
     
//     func getMoviesList (){
//         let fetchRequest: NSFetchRequest<Movie> = Movie.fetchRequest()
//          coreDataStack.backgroundContext.perform {
//                 do {
//                     // Execute Fetch Request
//                     let result = try fetchRequest.execute()
//
//                     // Update Books Label
//                     print("result")
//                      print(result)
//
//                 } catch {
//                     print("Unable to Execute Fetch Request, \(error)")
//                 }
//             }
//     }
     
}
