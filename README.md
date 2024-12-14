# iOS Developer Test Task

## Technology Stack
- iOS 17+
- Navigation: SwiftUI
- UI Implementation: SwiftUI
- Architecture: [The Composable Architecture](https://github.com/pointfreeco/swift-composable-architecture)
- Modularity: Swift Package Manager

## Task Description
Create an application implementing a user list with the following requirements:

### Architecture
- Implement unidirectional data flow architecture pattern
- Demonstrate clean separation of concerns and proper architectural layers

### Main Features

#### Timer Component
- Start countdown from 6:00:00
- Count down to zero
- Display "Submission closed!" message when timer reaches zero

#### User List
Each list item should display:
- Avatar (mock image from assets)
- Full name
- Username
- Market cap
- Graph visualization
  - Use mock data
  - Display with 10 data points
  - Implement appropriate visualization

### Data Requirements
- Fetch user data from: `https://jsonplaceholder.typicode.com/users`
- Handle the limited dataset (10 users) appropriately
- Implement proper error handling and loading states

### Optional Features
- Implement pull-to-refresh functionality for the user list
