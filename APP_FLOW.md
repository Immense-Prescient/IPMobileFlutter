# Application Flow

## 📱 Screen Flow Diagram

```
┌─────────────────┐
│  Splash Screen  │
│   (2 seconds)   │
└────────┬────────┘
         │
         ├─── Check Auth Token
         │
    ┌────┴────┐
    │         │
    ▼         ▼
[No Token] [Has Token]
    │         │
    │         │
    ▼         │
┌─────────────────┐    │
│  Login Screen   │    │
└────────┬────────┘    │
         │             │
         ├─ Login      │
         │             │
         ├─ Signup ────┤
         │             │
         ▼             ▼
    ┌─────────────────────┐
    │  Dashboard Screen   │
    │  - User Profile     │
    │  - Statistics       │
    │  - Product List     │
    └──────────┬──────────┘
               │
               ├─ Logout
               │
               ▼
         [Clear Token]
               │
               ▼
    ┌─────────────────┐
    │  Login Screen   │
    └─────────────────┘
```

## 🔄 Detailed Flow

### 1. App Launch
```
User Opens App
    ↓
Splash Screen Displays
    ↓
Check SharedPreferences for auth_token
    ↓
    ├─ Token exists → Navigate to Dashboard
    └─ No token → Navigate to Login
```

### 2. Login Flow
```
Login Screen
    ↓
User enters email & password
    ↓
Validate form
    ↓
    ├─ Invalid → Show error message
    └─ Valid → Continue
        ↓
    Call AuthService.login()
        ↓
    Mock API delay (1.5s)
        ↓
    Save token & user to SharedPreferences
        ↓
    Navigate to Dashboard
```

### 3. Signup Flow
```
Login Screen
    ↓
User clicks "Sign up"
    ↓
Signup Screen
    ↓
User enters name, email & password
    ↓
Validate form
    ↓
    ├─ Invalid → Show error message
    └─ Valid → Continue
        ↓
    Call AuthService.signup()
        ↓
    Mock API delay (1.5s)
        ↓
    Save token & user to SharedPreferences
        ↓
    Navigate to Dashboard
```

### 4. Dashboard Flow
```
Dashboard Screen
    ↓
Load user from SharedPreferences
    ↓
Display user profile
    ↓
Fetch products from API
    ↓
    ├─ Loading → Show spinner
    ├─ Error → Show error with retry
    └─ Success → Display products
        ↓
    Calculate statistics
        ↓
    Display product cards
        ↓
    User can:
        ├─ Pull to refresh
        ├─ Scroll through products
        └─ Logout
```

### 5. Logout Flow
```
Dashboard Screen
    ↓
User clicks logout button
    ↓
Call AuthService.logout()
    ↓
Clear SharedPreferences
    ↓
Navigate to Login Screen
```

## 🎬 State Transitions

### Authentication States
```
┌──────────────┐
│ Unauthenticated │
└───────┬────────┘
        │
        ├─ Login/Signup Success
        │
        ▼
┌──────────────┐
│ Authenticated │
└───────┬────────┘
        │
        ├─ Logout
        │
        ▼
┌──────────────┐
│ Unauthenticated │
└──────────────┘
```

### Product Loading States
```
┌─────────┐
│  Idle   │
└────┬────┘
     │
     ├─ fetchProducts()
     │
     ▼
┌─────────┐
│ Loading │
└────┬────┘
     │
     ├─ Success / Error
     │
     ▼
┌─────────┐
│ Loaded  │
└────┬────┘
     │
     ├─ Refresh
     │
     └─ Back to Loading
```

## 📊 Data Flow

### Login Data Flow
```
LoginScreen
    ↓
[email, password]
    ↓
AuthService.login()
    ↓
Mock API Response
    ↓
{token, user}
    ↓
SharedPreferences.setString()
    ↓
DashboardScreen
```

### Product Data Flow
```
DashboardScreen
    ↓
ProductsHook.fetchProducts()
    ↓
ApiService.fetchProducts()
    ↓
HTTP GET fakestoreapi.com/products
    ↓
Parse JSON → List<Product>
    ↓
notifyListeners()
    ↓
UI Rebuild with products
```

## 🔐 Security Flow

### Token Management
```
Login/Signup
    ↓
Generate mock token
    ↓
Store in SharedPreferences
    ↓
    ├─ App restart → Check token
    ├─ API calls → Include token (future)
    └─ Logout → Clear token
```

## 🎨 UI Component Hierarchy

```
MaterialApp
    └─ SplashScreen / LoginScreen / SignupScreen / DashboardScreen
        └─ Scaffold
            ├─ AppBar (optional)
            └─ Body
                ├─ SafeArea
                └─ SingleChildScrollView / ListView
                    ├─ CustomCard
                    │   └─ Content widgets
                    └─ CustomButton
                        └─ Text / CircularProgressIndicator
```

## 📱 Navigation Stack

### Initial Navigation
```
[SplashScreen] → [LoginScreen] or [DashboardScreen]
```

### Login to Dashboard
```
[LoginScreen] → [DashboardScreen]
(replaces entire stack)
```

### Login to Signup
```
[LoginScreen] → [SignupScreen]
(push, can go back)
```

### Signup to Dashboard
```
[LoginScreen, SignupScreen] → [DashboardScreen]
(replaces entire stack)
```

### Logout
```
[DashboardScreen] → [LoginScreen]
(replaces entire stack)
```

## 🔄 Lifecycle Events

### App Lifecycle
```
main() → runApp(MyApp)
    ↓
MyApp builds MaterialApp
    ↓
SplashScreen initState()
    ↓
Check authentication
    ↓
Navigate to appropriate screen
```

### Screen Lifecycle
```
Screen created
    ↓
initState() called
    ↓
Load data / Check auth
    ↓
build() called
    ↓
User interaction
    ↓
setState() / notifyListeners()
    ↓
Rebuild
    ↓
dispose() on navigation away
```

## 🎯 User Journey Map

### New User Journey
1. **Launch** → Splash (2s)
2. **Login** → Click "Sign up"
3. **Signup** → Fill form (name, email, password)
4. **Submit** → Loading (1.5s)
5. **Dashboard** → See profile + products
6. **Explore** → Scroll products, view stats
7. **Logout** → Return to login

### Returning User Journey
1. **Launch** → Splash (2s)
2. **Auto-login** → Dashboard
3. **View** → Profile + products
4. **Refresh** → Pull down to reload
5. **Logout** → Return to login

## 📈 Performance Considerations

### Optimizations
- const constructors for static widgets
- ListenableBuilder for efficient rebuilds
- Image caching for network images
- Form validation on submit (not on every keystroke)
- Lazy loading ready for large lists

### Loading Strategies
- Splash: Immediate auth check
- Login/Signup: Show loading during API call
- Dashboard: Show loading during product fetch
- Products: Pull-to-refresh for manual reload

