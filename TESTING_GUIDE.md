# Testing Guide

## 🧪 Testing Checklist

### Pre-Testing Setup
- [ ] Dependencies installed (`flutter pub get`)
- [ ] App builds successfully
- [ ] Simulator/device ready
- [ ] Internet connection available

## 📱 Manual Testing

### 1. Splash Screen
- [ ] App launches successfully
- [ ] Logo displays correctly
- [ ] Loading indicator shows
- [ ] Navigates after 2 seconds
- [ ] First launch → Login screen
- [ ] With auth token → Dashboard

### 2. Login Screen
- [ ] UI renders correctly
- [ ] Email field accepts input
- [ ] Password field masks input
- [ ] Password toggle works
- [ ] Empty email → Validation error
- [ ] Invalid email → Format error
- [ ] Empty password → Validation error
- [ ] Valid credentials → Loading state
- [ ] Successful login → Dashboard
- [ ] "Sign up" link → Signup screen

### 3. Signup Screen
- [ ] UI renders correctly
- [ ] All fields accept input
- [ ] Password toggle works
- [ ] Empty name → Validation error
- [ ] Empty email → Validation error
- [ ] Invalid email → Format error
- [ ] Short password → Length error
- [ ] Valid data → Loading state
- [ ] Successful signup → Dashboard
- [ ] "Login" link → Login screen

### 4. Dashboard Screen
- [ ] User profile displays
- [ ] Avatar loads correctly
- [ ] Statistics cards show
- [ ] Products load from API
- [ ] Loading indicator during fetch
- [ ] Product images load
- [ ] Product details correct
- [ ] Pull-to-refresh works
- [ ] Error handling with retry
- [ ] Logout button works
- [ ] Logout → Login screen

### 5. Data Persistence
- [ ] Login → Close app → Reopen
- [ ] Should go to Dashboard
- [ ] User data persists
- [ ] Logout → Close app → Reopen
- [ ] Should go to Login

### 6. Error Handling
- [ ] Invalid login → Error message
- [ ] Network error → Error display
- [ ] API failure → Retry option
- [ ] Image load failure → Fallback

## 🔧 Automated Testing

### Unit Tests
```bash
flutter test
```

Test coverage:
- [ ] formatCurrency utility
- [ ] formatDate utility
- [ ] truncateText utility
- [ ] User model fromJson/toJson
- [ ] Product model fromJson
- [ ] AuthService methods
- [ ] ApiService methods

### Widget Tests
Test individual widgets:
- [ ] CustomButton renders
- [ ] CustomButton loading state
- [ ] CustomCard renders
- [ ] CustomCard tap handler

### Integration Tests
Test complete flows:
- [ ] Login flow
- [ ] Signup flow
- [ ] Dashboard load
- [ ] Logout flow

## 📊 Test Scenarios

### Happy Path
1. Launch app
2. Login with valid credentials
3. View dashboard
4. Refresh products
5. Logout
6. Signup new account
7. View dashboard again

### Error Path
1. Launch app
2. Try login with invalid email
3. Try login with empty fields
4. Login successfully
5. Simulate network error
6. Test retry functionality

### Edge Cases
- [ ] Very long product titles
- [ ] Missing product images
- [ ] Slow network connection
- [ ] Rapid button tapping
- [ ] Form submission during loading
- [ ] Navigation during loading

## 🎯 Performance Testing

- [ ] App launch time < 3 seconds
- [ ] Login response < 2 seconds
- [ ] Dashboard load < 3 seconds
- [ ] Smooth scrolling (60 FPS)
- [ ] No memory leaks
- [ ] Efficient rebuilds

## 📱 Device Testing

### iOS
- [ ] iPhone SE (small screen)
- [ ] iPhone 14 (standard)
- [ ] iPhone 14 Pro Max (large)
- [ ] iPad (tablet)

### Android
- [ ] Small phone (5")
- [ ] Standard phone (6")
- [ ] Large phone (6.5"+)
- [ ] Tablet

## ✅ Acceptance Criteria

### Functionality
- ✅ All screens render correctly
- ✅ Navigation works smoothly
- ✅ Forms validate properly
- ✅ API calls succeed
- ✅ Data persists correctly
- ✅ Errors handled gracefully

### UI/UX
- ✅ Consistent design
- ✅ Responsive layout
- ✅ Loading indicators
- ✅ Error messages
- ✅ Smooth animations

### Code Quality
- ✅ No compiler errors
- ✅ No linter warnings
- ✅ Type safety
- ✅ Clean architecture
- ✅ Documented code

