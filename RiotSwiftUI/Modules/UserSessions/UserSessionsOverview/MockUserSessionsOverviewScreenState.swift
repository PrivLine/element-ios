//
// Copyright 2022 New Vector Ltd
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//

import Foundation
import SwiftUI

/// Using an enum for the screen allows you define the different state cases with
/// the relevant associated data for each case.
enum MockUserSessionsOverviewScreenState: MockScreenState, CaseIterable {
    case verifiedSession
    
    /// The associated screen
    var screenType: Any.Type {
        UserSessionsOverview.self
    }
    
    /// A list of screen state definitions
    static var allCases: [MockUserSessionsOverviewScreenState] {
        // Each of the presence statuses
        [.verifiedSession]
    }
    
    /// Generate the view struct for the screen state.
    var screenView: ([Any], AnyView) {
        let service = MockUserSessionsOverviewService()
        switch self {
        case .verifiedSession:
            break
        }
        
        let viewModel = UserSessionsOverviewViewModel(userSessionsOverviewService: service)
        
        // can simulate service and viewModel actions here if needs be.
        
        return (
            [service, viewModel],
            AnyView(UserSessionsOverview(viewModel: viewModel.context)
                .addDependency(MockAvatarService.example))
        )
    }
}