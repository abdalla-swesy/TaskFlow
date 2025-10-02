# TaskFlow - Task Management Flutter App

A comprehensive task management application built with Flutter and Firebase, designed to help users organize their tasks, collaborate with teams, and boost productivity.

## 🚀 Features

### ✅ Working Features

#### 🔐 Authentication System

- **Email/Password Authentication** - Complete login and signup functionality
- **Google Sign-In Integration** - Quick authentication with Google accounts
- **Password Reset** - Forgot password functionality via email
- **Email Verification** - Secure account verification process
- **Auto-login** - Persistent authentication state management

#### 📋 Task Management

- **Create Tasks** - Add new tasks with title, description, date, and priority levels
- **Task Display** - View all tasks in an organized list format
- **Edit Tasks** - Modify existing task details
- **Delete Tasks** - Remove tasks with confirmation dialog
- **Priority System** - Three-level priority system (High, Medium, Low) with color coding
- **Date Selection** - Interactive date picker for task deadlines
- **Task Status** - Visual status indicators (In Progress, Completed, Pending)

#### 🏠 Dashboard & Analytics

- **Project Summary** - Overview of completed, in-progress, and pending tasks
- **Visual Analytics** - Charts and graphs showing task distribution
- **Progress Tracking** - Real-time progress monitoring
- **Statistics Display** - Comprehensive task statistics

#### 📅 Calendar View

- **Calendar Interface** - Clean calendar layout with date navigation
- **Event Display** - Shows scheduled tasks and events
- **Timeline View** - Time-based task organization
- **Interactive Date Selection** - Easy date navigation

#### 👥 Team Collaboration (UI Only)

- **Static Team Display** - Shows mock team projects with hardcoded data
- **Visual Interface** - Team project cards with basic information display
- **Search Interface** - Non-functional search field (UI only)
- **Create Project Button** - Button present but not connected to functionality
- **Note**: Team functionality is currently UI-only with no backend integration or real team management

#### 🤖 AI Assistant (UI Only)

- **Chat Interface** - Basic chat UI layout with message bubbles
- **Static Messages** - Displays hardcoded conversation examples
- **Input Field** - Text input field present but not functional
- **Send Button** - Button present but not connected to AI service
- **Note**: AI functionality is currently UI-only with no actual AI integration or message processing

#### 👤 User Profile

- **Profile Management** - Edit user information
- **Profile Picture** - Image picker for profile photos
- **Personal Information** - Name, email, phone, date of birth fields
- **Settings Access** - Quick access to app settings

#### 🎨 User Interface

- **Modern Design** - Clean, intuitive interface with purple theme
- **Bottom Navigation** - Easy navigation between main sections
- **Responsive Layout** - Optimized for different screen sizes
- **Custom Components** - Reusable UI components throughout the app
- **Loading States** - Proper loading indicators for async operations

#### 🔧 Technical Features

- **Firebase Integration** - Complete backend integration
- **Cloud Firestore** - Real-time database for tasks and user data
- **Firebase Authentication** - Secure user management
- **State Management** - Proper state handling throughout the app
- **Form Validation** - Input validation for all forms
- **Error Handling** - Comprehensive error management with user-friendly dialogs

## 📱 App Structure

### Main Screens

1. **Start Screen** - Welcome screen with app introduction
2. **Features Screen** - App feature showcase with onboarding
3. **Authentication** - Login/Signup screens
4. **Tasks** - Main task management interface
5. **Home/Dashboard** - Analytics and overview
6. **Calendar** - Calendar view of tasks and events
7. **Teams** - Team collaboration interface
8. **AI Tool** - AI assistant chat
9. **Profile** - User profile management
10. **Settings** - App configuration

### Navigation Flow

```
Start → Features → Auth → Tasks (Main App)
                     ↓
    Home ← → Calendar ← → Teams ← → AI Tool
                     ↑
                  Profile/Settings
```

## 🛠 Technical Stack

- **Framework**: Flutter 3.7.0+
- **Backend**: Firebase
  - Authentication
  - Cloud Firestore
  - Firebase Storage
  - Firebase Messaging
- **State Management**: StatefulWidget with setState
- **UI Components**: Material Design
- **Additional Packages**:
  - `google_sign_in` - Google authentication
  - `awesome_dialog` - Enhanced dialogs
  - `image_picker` - Profile image selection
  - `intl` - Date formatting
  - `geolocator` & `geocoding` - Location services
  - `google_maps_flutter` - Maps integration

## 📦 Installation & Setup

1. **Clone the repository**

   ```bash
   git clone <repository-url>
   cd TaskFlow
   ```

2. **Install dependencies**

   ```bash
   flutter pub get
   ```

3. **Firebase Setup**

   - Create a new Firebase project
   - Add Android/iOS apps to your Firebase project
   - Download and place `google-services.json` in `android/app/`
   - Enable Authentication, Firestore, and Storage in Firebase Console

4. **Run the app**
   ```bash
   flutter run
   ```

## 🎯 Usage

### Getting Started

1. Launch the app and go through the welcome screens
2. Create an account or sign in with Google
3. Start adding your tasks with priorities and due dates
4. Use the dashboard to track your progress
5. Browse the Teams and AI sections (UI preview only)

### Task Management

- Tap "Add Task" to create new tasks
- Set priority levels (High/Medium/Low) with color coding
- Use the date picker to set deadlines
- Edit tasks by tapping the edit icon
- Delete tasks using the menu options

### Teams & AI Sections

- **Teams**: Browse mock team projects (static data only)
- **AI Tool**: View chat interface design (no actual AI functionality)
- These sections serve as UI previews for future development

## 🔐 Security Features

- Secure Firebase Authentication
- Email verification for new accounts
- Password reset functionality
- Protected routes based on authentication state
- Input validation and sanitization

## 📊 Data Structure

### Tasks Collection

```json
{
  "title": "Task Title",
  "date": "2024-01-01",
  "priority": "High|Medium|Low",
  "id": "user_uid",
  "archived": false
}
```

## 🎨 Design System

- **Primary Color**: Deep Purple
- **Font Family**: Ubuntu
- **UI Pattern**: Material Design
- **Navigation**: Bottom Navigation Bar
- **Theme**: Light theme with purple accents

## 🚧 Future Enhancements

While the current version includes all the core working features listed above, potential future improvements could include:

- **Complete Team Functionality** - Real team creation, joining, and collaboration
- **AI Integration** - Actual AI-powered task suggestions and chat functionality
- Push notifications for task reminders
- Offline functionality
- Advanced filtering and sorting
- File attachments for tasks
- Advanced analytics and reporting

## 📄 License

This project is a Flutter application for task management and productivity enhancement.

---

**Note**: This README accurately reflects the currently working features in the TaskFlow application. The app provides a complete task management solution with authentication, CRUD operations, dashboard analytics, and calendar views. Teams and AI sections are UI-only previews without backend functionality.
