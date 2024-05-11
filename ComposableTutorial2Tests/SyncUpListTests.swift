//
//  SyncUpListTests.swift
//  ComposableTutorial2Tests
//
//  Created by Brian D Keane on 5/11/24.
//
import ComposableArchitecture
import XCTest

@testable import ComposableTutorial2


class SyncUpsListTests: XCTestCase {
  @MainActor
  func testDeletion() async {
    let store = TestStore(
      initialState: SyncUpsList.State(
        syncUps: [
          SyncUp(
            id: SyncUp.ID(),
            title: "Point-Free Morning Sync"
          )
        ]
      )
    ) {
      SyncUpsList()
    }


    await store.send(.onDelete([0])) {
      $0.syncUps = []
    }
  }
}
