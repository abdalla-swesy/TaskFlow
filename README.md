# 📌 TaskFlow - Task Management Flutter App

A comprehensive **task management application** built with **Flutter & Firebase**, designed to help users organize tasks, boost productivity, and manage personal workflows effectively.

---

## 🚀 Features

### 🔐 Authentication
- Email/Password authentication (Signup/Login)  
- Google Sign-In integration  
- Email verification for new users  
- Password reset via email  
- Auto-login (persistent authentication state)  

### 📋 Task Management
- Add new tasks with **title, description, due date, and priority**  
- Edit and delete tasks with confirmation dialogs  
- Priority system (High/Medium/Low) with **color coding**  
- Archive completed tasks  
- Filter tasks by user & archived status  
- Interactive **date picker** for deadlines  

### 🏠 Dashboard & Analytics
- Project summary with tasks overview  
- Static charts showing task distribution *(not real-time)*  
- Quick access to **profile & settings**  

### 👤 Profile Management
- Edit profile information (Name, Email, Phone, DOB)  
- Profile picture upload (Image Picker)  
- Settings access directly from dashboard  

### 🎨 UI & Experience
- Modern **purple-themed UI** with Material Design  
- Responsive layout for different devices  
- Custom reusable components  
- Smooth loading indicators & dialogs  

---

## 🛠 Technical Stack
- **Framework**: Flutter 3.7.0+  
- **Backend**: Firebase  
  - Authentication  
  - Firestore (real-time DB)  
  - Storage  
  - Messaging  
- **State Management**: `setState` (no advanced state management yet)  
- **Packages**:  
  - `firebase_auth` & `google_sign_in` → Authentication  
  - `cloud_firestore` → Database  
  - `image_picker` → Profile images  
  - `awesome_dialog` → Custom dialogs  
  - `intl` → Date formatting  
  - `geolocator`, `geocoding`, `google_maps_flutter` → Location services  

---

## 📱 App Structure

### Implemented Screens
1. **Start Screen** → Welcome  
2. **Features Screen** → Onboarding (PageView)  
3. **Authentication**  
   - AuthPage → Select Login/Signup  
   - Login → Email/Google Sign-In  
   - Signup → New user registration  
4. **Tasks Screen** → Main task management (CRUD)  
5. **Dashboard (Homepage)** → Analytics + settings  
6. **Profile Screen** → User info editing  
7. **Settings Screen** → App config  
8. **Add/Edit Task Screens** → Create & update tasks  
9. **Archive Screen** → Archived tasks  

### Navigation Flow
Start → Features → AuthPage → Login/Signup → Tasks (Main App)
↓
Dashboard → Profile / Settings / Archive

yaml
Copy code
⚠️ **Note**: No bottom navigation bar yet. Navigation is via buttons & routes.  

---

## 📦 Installation & Setup

1. Clone repository:
   ```bash
   git clone <repository-url>
   cd TaskFlow
Install dependencies:

bash
Copy code
flutter pub get
Setup Firebase:

Add google-services.json in android/app/

Enable Authentication, Firestore, Storage in Firebase console

Run app:

bash
Copy code
flutter run
📊 Data Structure
Firestore → tasks Collection
json
Copy code
{
  "title": "Task Title",
  "description": "Task details...",
  "date": "2024-01-01",
  "priority": "High|Medium|Low",
  "id": "user_uid",
  "archived": false
}
🚧 Current Issues & Future Enhancements
🔴 Critical Issues
Dashboard analytics = static, not real-time

Profile editing doesn’t save data to Firestore

Task checkboxes don’t persist completion state

No bottom navigation bar (hard to move between screens)

🟡 Planned Enhancements
Real-time dashboard analytics

Save profile data to Firestore

Task completion persistence

Bottom navigation bar for smoother UX

Calendar view for scheduling

Team collaboration (multi-user tasks)

AI-powered task suggestions

Push notifications for reminders

📄 License
This project is licensed under the MIT License.

⚠️ Disclaimer
As of now, the app has full authentication & CRUD task management working ✅.
However, analytics, profile saving, and some navigation features are still incomplete ❌.

Made with ❤️ using Flutter & Firebase
