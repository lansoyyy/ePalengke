# ePalengke - Missing Must-Have Features

This document outlines all the must-have features that are not yet implemented in the ePalengke application, organized by user interface (Customer and Rider).

---

## Table of Contents

- [Customer Interface Features](#customer-interface-features)
  - [Core Shopping Features](#core-shopping-features)
  - [Order & Payment Features](#order--payment-features)
  - [Account Features](#account-features)
- [Rider Interface Features](#rider-interface-features)
  - [Job & Earnings Features](#job--earnings-features)
  - [Navigation & Communication Features](#navigation--communication-features)
  - [Account Features](#account-features-1)
- [Feature Priority Matrix](#feature-priority-matrix)

---

## Customer Interface Features

### Core Shopping Features

#### 1. Product Details Screen

**Purpose:** Allow customers to view comprehensive product information before adding to cart.

**Screen Name:** `product_details_screen.dart`

**Key Components:**

| Component | Description |
|-----------|-------------|
| Product Images | Carousel/swipeable product images with zoom capability |
| Product Name | Large, bold display of product name |
| Brand Name | Display brand/vendor name with link to seller |
| Price Display | Current price with original price (if discounted) |
| Unit Information | Price per unit (per kilo, per piece, etc.) |
| Description | Full product description with details |
| Specifications | Product specs (weight, dimensions, origin, etc.) |
| Freshness Indicator | Visual indicator if product is fresh/organic |
| Stock Status | In stock / Low stock / Out of stock |
| Reviews Section | Customer reviews with ratings |
| Add to Cart Button | Primary CTA to add product to cart |
| Quantity Selector | +/- buttons to select quantity |
| Wishlist Button | Add/remove from favorites |
| Similar Products | Horizontal list of related items |

**User Flow:**
1. User taps on a product from Home Screen
2. Product Details Screen opens with full product information
3. User can view images, read description, check reviews
4. User selects quantity and taps "Add to Cart"
5. Product is added to cart with success feedback
6. User can continue shopping or go to cart

**Data Requirements:**
- Product ID, name, brand, description
- Multiple product image URLs
- Price, original price, unit
- Stock quantity
- Reviews array (rating, comment, user, date)
- Related products array

---

#### 2. Search Functionality

**Purpose:** Enable customers to quickly find specific products.

**Screen Name:** `search_screen.dart`

**Key Components:**

| Component | Description |
|-----------|-------------|
| Search Bar | Input field with search icon and clear button |
| Recent Searches | List of recent search terms with clear all option |
| Popular Searches | Trending/popular search terms |
| Search Results | List of matching products |
| No Results State | Empty state when no products match |
| Filter Button | Opens filter options |
| Sort Dropdown | Sort by relevance, price, rating, newest |
| Result Count | Display number of results found |

**User Flow:**
1. User taps search icon on Home Screen
2. Search Screen opens with search bar focused
3. User types search query
4. Results update in real-time or on submit
4a. If no results, show "No products found" with suggestions
5. User taps on a product to view details
6. Recent searches are saved for future use

**Data Requirements:**
- Search query string
- Search results array (products matching query)
- Recent searches history
- Popular searches list

**Search Logic:**
- Match product name, brand, category
- Fuzzy search for typos
- Prioritize exact matches
- Sort by relevance

---

#### 3. Filter & Sort Products

**Purpose:** Help customers narrow down product options based on preferences.

**Screen Name:** `filter_screen.dart`

**Key Components:**

| Component | Description |
|-----------|-------------|
| Price Range Slider | Min/max price range selector |
| Category Filter | Multi-select category checkboxes |
| Brand Filter | Multi-select brand checkboxes |
| Rating Filter | Minimum rating selector (4+, 3+, etc.) |
| Fresh/Only | Toggle for fresh/organic products only |
| Availability Filter | In stock only toggle |
| Apply Button | Apply selected filters |
| Reset Button | Clear all filters |
| Active Filters | Display count of active filters |

**User Flow:**
1. User taps filter icon on Home Screen or Search Screen
2. Filter Screen opens with current filter state
3. User adjusts filters (price range, categories, etc.)
4. User taps "Apply" to see filtered results
5. Results update with applied filters
6. User can tap "Reset" to clear all filters

**Data Requirements:**
- Filter state object (price min/max, selected categories, etc.)
- Available categories list
- Available brands list
- Product data with filterable attributes

**Filter Logic:**
- Products must match ALL selected filters
- Price range: product price >= min AND <= max
- Category: product category in selected categories
- Rating: product rating >= minimum rating
- Availability: stock > 0

---

#### 4. Favorites/Wishlist

**Purpose:** Allow customers to save products for future purchase.

**Screen Name:** `favorites_screen.dart`

**Key Components:**

| Component | Description |
|-----------|-------------|
| Wishlist Items | Grid/list of saved products |
| Product Card | Product image, name, price, remove button |
| Add to Cart | Quick add to cart from wishlist |
| Move to Cart | Move item to cart directly |
| Empty State | "No favorites yet" message with CTA |
| Sort Options | Sort by date added, price, name |
| Share Wishlist | Share wishlist link with others |

**User Flow:**
1. User taps heart icon on product to add to favorites
2. Product is added to wishlist with animation
3. User can view all favorites from Profile or Home
4. On Favorites Screen, user sees all saved products
5. User can remove product from wishlist
6. User can add product to cart directly from wishlist

**Data Requirements:**
- Wishlist array (product IDs)
- Product details for each wishlist item
- Date added timestamp

**Persistence:**
- Wishlist saved to local storage
- Sync with backend when logged in

---

### Order & Payment Features

#### 5. Checkout/Payment Screen

**Purpose:** Complete the order process with payment selection and confirmation.

**Screen Name:** `checkout_screen.dart`

**Key Components:**

| Component | Description |
|-----------|-------------|
| Delivery Address | Selected delivery address with change option |
| Delivery Time | Standard / Express delivery options |
| Payment Methods | GCash, Cash on Delivery, Credit Card, etc. |
| Order Summary | List of items with quantities and prices |
| Subtotal | Items total before fees |
| Delivery Fee | Based on distance and delivery type |
| Service Fee | Platform service fee |
| Discount | Applied promo code discount |
| Total | Final amount to pay |
| Promo Code Input | Enter and apply promo codes |
| Notes to Rider | Special instructions for delivery |
| Place Order Button | Primary CTA to confirm order |
| Terms Checkbox | Agree to terms and conditions |

**User Flow:**
1. User proceeds from Cart Screen to Checkout
2. Checkout Screen loads with cart items and user's default address
3. User reviews and changes delivery address if needed
4. User selects delivery time option
5. User selects payment method
5a. If GCash/Card: redirect to payment gateway
5b. If COD: proceed to confirmation
6. User applies promo code (optional)
7. User adds delivery notes (optional)
8. User reviews total and taps "Place Order"
9. Order is created and user is redirected to Order Confirmation/Tracking

**Data Requirements:**
- Cart items (products, quantities)
- User's saved addresses
- Selected delivery address
- Delivery options with pricing
- Payment methods available
- Promo codes validation
- Order total calculation

**Payment Integration:**
- GCash: Deep link to GCash app or web checkout
- Credit/Debit Card: Stripe or Maya integration
- Cash on Delivery: No payment processing, collect on delivery

---

#### 6. Order History Screen

**Purpose:** Allow customers to view all past and current orders.

**Screen Name:** `order_history_screen.dart`

**Key Components:**

| Component | Description |
|-----------|-------------|
| Order List | List of all orders sorted by date |
| Order Card | Order ID, date, status, total amount |
| Order Status | Pending, Confirmed, Shopping, Delivering, Delivered, Cancelled |
| Filter Tabs | All, Active, Completed, Cancelled |
| Order Details | Tap to view full order details |
| Reorder Button | Quick reorder from past order |
| Track Button | Track active order |
| Empty State | "No orders yet" message |
| Pull to Refresh | Refresh order status |

**User Flow:**
1. User accesses Order History from Profile Screen
2. Order History Screen displays all orders
3. User can filter orders by status (All, Active, etc.)
4. User taps on an order to view details
5. Order Details Screen shows items, status, timeline
6. User can track active orders or reorder from completed orders

**Data Requirements:**
- Orders array with full order details
- Order status for each order
- Order items (products, quantities, prices)
- Order timeline (status updates with timestamps)
- Delivery information

**Order Status Flow:**
1. Pending - Order placed, awaiting confirmation
2. Confirmed - Order accepted by rider
3. Shopping - Rider buying items at market
4. Delivering - Rider en route to customer
5. Delivered - Order completed
6. Cancelled - Order cancelled by customer or system

---

#### 7. Order Cancellation

**Purpose:** Allow customers to cancel pending orders.

**Screen Name:** `order_cancel_screen.dart`

**Key Components:**

| Component | Description |
|-----------|-------------|
| Order Details | Display order being cancelled |
| Cancellation Reasons | Pre-defined reasons (wrong items, changed mind, etc.) |
| Other Reason | Custom reason text input |
| Refund Information | Refund policy and expected refund time |
| Confirm Button | Confirm cancellation |
| Cancel Button | Go back without cancelling |
| Warning Message | Warning that cancellation cannot be undone |

**User Flow:**
1. User views order details from Order History
2. User taps "Cancel Order" button
3. Cancellation Screen opens with order summary
4. User selects cancellation reason
4a. If "Other", user types custom reason
5. User reads refund information
6. User taps "Confirm Cancellation"
7. Order is cancelled and refund is processed
8. User receives confirmation message

**Data Requirements:**
- Order ID
- Cancellation reason
- Cancellation timestamp
- Refund status

**Cancellation Rules:**
- Can only cancel orders in "Pending" or "Confirmed" status
- Cannot cancel after rider starts shopping
- Refund processed within 3-5 business days
- Service fee may be non-refundable

---

#### 8. Reorder Function

**Purpose:** Allow customers to quickly reorder items from past orders.

**Implementation:** Integrated into Order Details Screen

**Key Components:**

| Component | Description |
|-----------|-------------|
| Reorder Button | "Reorder" button on completed orders |
| Product Availability | Check if products are still available |
| Price Updates | Show updated prices for items |
| Out of Stock Items | Mark unavailable items |
| Modified Cart | Add items to existing cart or create new order |

**User Flow:**
1. User views completed order from Order History
2. User taps "Reorder" button
3. System checks product availability
4. Items are added to cart with current prices
5. User is redirected to Cart Screen
6. User can modify quantities or proceed to checkout

**Data Requirements:**
- Original order items
- Current product data (price, availability)
- Cart state

---

### Account Features

#### 9. Customer Profile Screen

**Purpose:** Allow customers to manage their account information.

**Screen Name:** `customer_profile_screen.dart`

**Key Components:**

| Component | Description |
|-----------|-------------|
| Profile Photo | Display and edit profile picture |
| Name | Display and edit full name |
| Phone Number | Display registered phone number |
| Email | Display email (optional) |
| Addresses | Manage delivery addresses |
| Payment Methods | Manage saved payment methods |
| Order History | Link to order history |
| Settings | App settings (notifications, language, etc.) |
| Help & Support | Contact support, FAQs |
| Logout | Logout button |
| Delete Account | Option to delete account |

**User Flow:**
1. User accesses Profile from Home Screen navigation
2. Profile Screen displays user information
3. User can edit profile photo, name, email
4. User can manage addresses and payment methods
5. User can access order history
6. User can adjust app settings
7. User can logout or delete account

**Data Requirements:**
- User profile data (name, email, phone, photo)
- Saved addresses array
- Saved payment methods array
- App settings preferences

---

#### 10. Address Management

**Purpose:** Allow customers to add, edit, and delete delivery addresses.

**Screen Name:** `address_management_screen.dart`

**Key Components:**

| Component | Description |
|-----------|-------------|
| Address List | All saved addresses |
| Default Address | Mark one address as default |
| Add Address Button | Add new delivery address |
| Edit Address | Edit existing address |
| Delete Address | Remove address |
| Map Picker | Select location on map |
| Address Fields | Label, recipient name, phone, address line, notes |
| Set Default | Make address default for future orders |

**User Flow:**
1. User accesses Address Management from Profile
2. Address Management Screen displays all saved addresses
3. User taps "Add Address" to create new address
4. User fills in address details
5. User can pick location on map (optional)
6. User saves address
7. User can set address as default
8. User can edit or delete existing addresses

**Data Requirements:**
- Address ID
- Address label (Home, Work, etc.)
- Recipient name
- Recipient phone
- Address line 1, 2
- City/Municipality
- Province
- Postal code
- Latitude/Longitude (for map)
- Delivery notes
- Is default flag

---

#### 11. Rate Rider

**Purpose:** Allow customers to rate and provide feedback on rider performance.

**Screen Name:** `rate_rider_screen.dart`

**Key Components:**

| Component | Description |
|-----------|-------------|
| Rider Info | Rider name, photo, avatar |
| Rating Stars | 1-5 star rating selector |
| Rating Categories | Speed, Communication, Packaging, Overall |
| Comment Box | Text area for detailed feedback |
| Submit Button | Submit rating |
| Skip Button | Skip rating (optional) |
| Thank You Message | Confirmation after submission |

**User Flow:**
1. Order is marked as "Delivered"
2. Rate Rider Screen appears automatically or from Order Details
3. User sees rider information
4. User selects star rating (1-5)
5. User can rate specific categories (optional)
6. User can add written feedback (optional)
7. User taps "Submit Rating"
8. Rating is saved and rider is notified
9. User sees thank you message

**Data Requirements:**
- Order ID
- Rider ID
- Rating (1-5 stars)
- Category ratings (optional)
- Comment/feedback text
- Timestamp

---

## Rider Interface Features

### Job & Earnings Features

#### 12. Earnings Dashboard

**Purpose:** Allow riders to view their earnings and financial performance.

**Screen Name:** `rider_earnings_screen.dart`

**Key Components:**

| Component | Description |
|-----------|-------------|
| Total Earnings | Total earnings to date |
| Today's Earnings | Earnings for current day |
| This Week | Earnings for current week |
| This Month | Earnings for current month |
| Earnings Chart | Visual chart showing earnings over time |
| Earnings Breakdown | Delivery fee, tips, bonuses |
| Completed Deliveries | Number of completed deliveries |
| Average Per Delivery | Average earnings per delivery |
| Withdraw Button | Withdraw earnings to bank/GCash |
| Transaction History | List of all earnings transactions |
| Date Filter | Filter earnings by date range |

**User Flow:**
1. Rider accesses Earnings from Profile or Jobs Screen
2. Earnings Dashboard displays summary of earnings
3. Rider can view earnings by different time periods
4. Rider can see earnings breakdown chart
5. Rider can view transaction history
6. Rider can withdraw earnings to linked account

**Data Requirements:**
- Earnings data (amount, date, type)
- Delivery count
- Tips data
- Bonus data
- Withdrawal history
- Linked payment accounts

**Earnings Calculation:**
- Base delivery fee per order
- Distance-based additional fee
- Customer tips
- Performance bonuses
- Platform commission deduction

---

#### 13. Availability Toggle

**Purpose:** Allow riders to control when they receive job requests.

**Screen Name:** `rider_availability_screen.dart`

**Key Components:**

| Component | Description |
|-----------|-------------|
| Status Toggle | Online/Offline switch |
| Status Indicator | Visual indicator of current status |
| Online Since | Time since going online |
| Online Today | Total time online today |
| Jobs Received | Number of jobs received while online |
| Jobs Accepted | Number of jobs accepted |
| Acceptance Rate | Percentage of jobs accepted |
| Auto-Accept Toggle | Option to auto-accept jobs |
| Notification Settings | Configure job notifications |

**User Flow:**
1. Rider accesses Availability from Profile or Jobs Screen
2. Rider sees current status (Online/Offline)
3. Rider toggles switch to change status
3a. Going Online: Rider starts receiving job requests
3b. Going Offline: Rider stops receiving new job requests
4. Rider can view online statistics
5. Rider can configure auto-accept and notification settings

**Data Requirements:**
- Current status (online/offline)
- Online since timestamp
- Total online time today
- Jobs received count
- Jobs accepted count
- Auto-accept preference
- Notification preferences

**Availability Logic:**
- Online: Rider appears in job matching pool
- Offline: Rider hidden from job matching
- Auto-accept: Jobs automatically accepted within X seconds
- Manual: Rider must manually accept each job

---

#### 14. Rider Order History

**Purpose:** Allow riders to view their completed deliveries.

**Screen Name:** `rider_order_history_screen.dart`

**Key Components:**

| Component | Description |
|-----------|-------------|
| Order List | List of all completed orders |
| Order Card | Order ID, customer name, date, earnings |
| Order Status | Completed, Cancelled |
| Filter Tabs | All, Completed, Cancelled |
| Order Details | Tap to view full order details |
| Date Range Filter | Filter orders by date range |
| Total Earnings | Summary of earnings from displayed orders |
| Empty State | "No orders yet" message |

**User Flow:**
1. Rider accesses Order History from Profile or Jobs Screen
2. Order History Screen displays all completed orders
3. Rider can filter orders by status
4. Rider can filter by date range
5. Rider taps on an order to view details
6. Order Details shows customer info, items, earnings, timeline

**Data Requirements:**
- Orders array with full order details
- Order status
- Customer information
- Earnings per order
- Order timeline
- Delivery location

---

#### 15. Withdraw Earnings

**Purpose:** Allow riders to cash out their earnings to linked accounts.

**Screen Name:** `rider_withdraw_screen.dart`

**Key Components:**

| Component | Description |
|-----------|-------------|
| Available Balance | Current withdrawable balance |
| Withdraw Amount | Input field for withdrawal amount |
| Quick Amounts | Preset amounts (₱500, ₱1000, All) |
| Withdrawal Method | Select withdrawal destination (Bank, GCash) |
| Linked Accounts | List of linked withdrawal accounts |
- Add Account | Add new withdrawal account |
| Processing Time | Expected processing time |
| Fee Information | Withdrawal fee (if any) |
| Confirm Button | Submit withdrawal request |
| Withdrawal History | List of past withdrawals |

**User Flow:**
1. Rider accesses Withdraw from Earnings Dashboard
2. Rider sees available balance
3. Rider enters withdrawal amount or selects quick amount
4. Rider selects withdrawal method
5. Rider selects linked account or adds new one
6. Rider reviews withdrawal details (amount, fee, processing time)
7. Rider taps "Confirm Withdrawal"
8. Withdrawal request is submitted
9. Rider receives confirmation and estimated processing time

**Data Requirements:**
- Available balance
- Withdrawal amount
- Withdrawal method
- Linked accounts (bank, GCash)
- Withdrawal fee
- Processing time estimate
- Withdrawal history

**Withdrawal Rules:**
- Minimum withdrawal amount: ₱500
- Maximum withdrawal: Available balance
- Processing time: 1-3 business days
- Withdrawal fee: ₱0 (free) or ₱25 (standard)
- Daily withdrawal limit: ₱10,000

---

### Navigation & Communication Features

#### 16. Real GPS Navigation

**Purpose:** Provide turn-by-turn navigation to customer location.

**Screen Name:** `rider_navigation_screen.dart`

**Key Components:**

| Component | Description |
|-----------|-------------|
| Map View | Interactive map with route |
| Current Location | Rider's current GPS position |
| Destination Pin | Customer delivery location |
| Route Line | Visual path from current to destination |
| Turn-by-Turn Directions | Text and voice navigation instructions |
| ETA Display | Estimated time of arrival |
| Distance Display | Remaining distance to destination |
| Navigate Button | Open in Google Maps/Waze (fallback) |
| Arrived Button | Mark as arrived at destination |
| Call Customer | Quick call to customer |

**User Flow:**
1. Rider accepts job from Jobs Screen
2. Rider taps "Navigate" on Delivery Route Screen
3. Navigation Screen opens with route to customer
4. Rider follows turn-by-turn directions
5. Rider sees ETA and distance updates
6. Rider arrives at destination
7. Rider taps "Arrived" to notify customer
8. Rider can call customer if needed

**Data Requirements:**
- Rider's current GPS coordinates
- Customer delivery address coordinates
- Route calculation
- Turn-by-turn directions
- ETA calculation
- Distance calculation

**Navigation Integration:**
- Primary: Built-in map with route display
- Fallback: Deep link to Google Maps or Waze
- Voice: Text-to-speech for turn-by-turn directions

---

#### 17. Call Customer

**Purpose:** Allow riders to call customers directly from the app.

**Implementation:** Integrated into Delivery Route and Navigation Screens

**Key Components:**

| Component | Description |
|-----------|-------------|
| Call Button | Phone icon button |
| Customer Name | Display customer name |
| Customer Phone | Customer's phone number |
| Call Confirmation | Confirm before calling |
| Call History | Log of calls made |

**User Flow:**
1. Rider is on Delivery Route or Navigation Screen
2. Rider taps "Call Customer" button
3. Call confirmation dialog appears
4. Rider confirms to initiate call
5. Phone dialer opens with customer's number
6. Rider can communicate with customer
7. Call is logged in system

**Data Requirements:**
- Customer phone number
- Customer name
- Call timestamp
- Call duration

**Privacy Considerations:**
- Mask phone number for privacy (optional)
- Use anonymous calling feature
- Log all calls for safety and dispute resolution

---

#### 18. Customer Rating

**Purpose:** Allow riders to rate customers after completing delivery.

**Screen Name:** `rider_rate_customer_screen.dart`

**Key Components:**

| Component | Description |
|-----------|-------------|
| Customer Info | Customer name, avatar |
| Rating Stars | 1-5 star rating selector |
| Rating Categories | Communication, Location Accuracy, Payment |
| Comment Box | Text area for detailed feedback |
| Report Issue | Option to report customer issue |
| Submit Button | Submit rating |
| Skip Button | Skip rating (optional) |
| Thank You Message | Confirmation after submission |

**User Flow:**
1. Delivery is marked as completed
2. Rate Customer Screen appears automatically or from Order Details
3. Rider sees customer information
4. Rider selects star rating (1-5)
5. Rider can rate specific categories (optional)
6. Rider can add written feedback (optional)
7. Rider can report issue (optional)
8. Rider taps "Submit Rating"
9. Rating is saved and customer is not notified (for privacy)
10. Rider sees thank you message

**Data Requirements:**
- Order ID
- Customer ID
- Rating (1-5 stars)
- Category ratings (optional)
- Comment/feedback text
- Issue report (if any)
- Timestamp

**Privacy Considerations:**
- Customer ratings are not visible to customers
- Used internally for customer quality control
- High-risk customers may be flagged

---

### Account Features

#### 19. Vehicle Information

**Purpose:** Allow riders to manage their vehicle details.

**Screen Name:** `rider_vehicle_screen.dart`

**Key Components:**

| Component | Description |
|-----------|-------------|
| Vehicle Type | Motorcycle, Bicycle, Car, etc. |
| Vehicle Make | Brand/manufacturer |
| Vehicle Model | Specific model |
| Year | Vehicle year |
| Plate Number | License plate number |
| Vehicle Photos | Front, side, back photos |
| Color | Vehicle color |
- Upload Photos | Camera or gallery upload
| Save Button | Save vehicle information |
| Edit Mode | Modify existing vehicle info |

**User Flow:**
1. Rider accesses Vehicle Information from Profile
2. Rider sees current vehicle details
3. Rider can edit vehicle information
4. Rider can upload new vehicle photos
5. Rider saves changes
6. Vehicle information is updated

**Data Requirements:**
- Vehicle ID
- Vehicle type
- Vehicle make, model, year
- Plate number
- Vehicle color
- Vehicle photo URLs
- Verification status

**Verification:**
- Vehicle photos must be verified by admin
- Plate number must match registration
- Verified vehicles get priority in job matching

---

#### 20. Document Upload

**Purpose:** Allow riders to upload required documents for verification.

**Screen Name:** `rider_documents_screen.dart`

**Key Components:**

| Component | Description |
|-----------|-------------|
| Driver's License | Upload photo of valid license |
| Vehicle Registration | Upload OR/CR documents |
| NBI Clearance | Upload NBI clearance (optional) |
| Barangay Clearance | Upload barangay clearance (optional) |
| Proof of Address | Upload utility bill or ID |
| Document Status | Pending, Verified, Rejected |
| Upload Button | Camera or gallery upload |
| Preview | Preview uploaded documents |
| Resubmit Button | Resubmit rejected documents |
| Expiry Date | Document expiry date reminder |

**User Flow:**
1. Rider accesses Documents from Profile or Registration
2. Rider sees list of required documents
3. Rider uploads each document
4. Documents are submitted for verification
5. Rider can view document status
6. If rejected, rider can resubmit corrected documents
7. Rider receives notification when documents are verified

**Data Requirements:**
- Document type
- Document photo URL
- Document number
- Expiry date
- Verification status
- Rejection reason (if rejected)

**Document Requirements:**
- Driver's License: Valid, non-expired, clear photo
- Vehicle Registration: OR/CR, valid, matches vehicle
- NBI Clearance: Valid within 6 months (optional)
- Proof of Address: Utility bill or ID with address

---

#### 21. Notification Settings

**Purpose:** Allow riders to manage their push notification preferences.

**Screen Name:** `rider_notifications_screen.dart`

**Key Components:**

| Component | Description |
|-----------|-------------|
| Job Notifications | Toggle for new job alerts |
| Order Updates | Toggle for order status updates |
| Chat Notifications | Toggle for message alerts |
| Earnings Notifications | Toggle for earnings updates |
- Promotional Notifications | Toggle for promotional messages |
| Sound | Toggle for notification sound |
| Vibrate | Toggle for vibration |
| Quiet Hours | Set quiet hours (no notifications) |
| Save Button | Save notification preferences |

**User Flow:**
1. Rider accesses Notification Settings from Profile
2. Rider sees all notification categories
3. Rider toggles notifications on/off for each category
4. Rider can set quiet hours
5. Rider saves preferences
6. Notification settings are updated

**Data Requirements:**
- Notification preferences object
- Quiet hours start/end time
- Sound enabled flag
- Vibrate enabled flag

---

## Feature Priority Matrix

| Feature | Priority | Complexity | Dependencies |
|---------|----------|------------|--------------|
| **Customer Interface** |
| Product Details Screen | High | Medium | Home Screen |
| Checkout/Payment Screen | High | High | Cart, Address, Payment Integration |
| Order History Screen | High | Medium | Backend Order Management |
| Customer Profile Screen | High | Medium | Backend User Management |
| Address Management | High | Medium | Backend Address Storage |
| Search Functionality | Medium | Medium | Backend Search API |
| Filter & Sort Products | Medium | Medium | Product Data |
| Order Cancellation | Medium | Low | Order History |
| Reorder Function | Low | Low | Order History |
| Favorites/Wishlist | Low | Medium | Backend Wishlist Storage |
| Rate Rider | Medium | Low | Order Completion |
| **Rider Interface** |
| Earnings Dashboard | High | Medium | Backend Earnings Tracking |
| Availability Toggle | High | Low | Backend Status Management |
| Rider Order History | High | Medium | Backend Order Management |
| Withdraw Earnings | High | High | Payment Gateway Integration |
| Real GPS Navigation | High | High | Map API Integration |
| Vehicle Information | Medium | Medium | Backend Vehicle Storage |
| Document Upload | Medium | Medium | Backend Document Storage |
| Call Customer | Low | Low | Phone Dialer Integration |
| Customer Rating | Medium | Low | Order Completion |
| Notification Settings | Low | Low | Push Notification Service |

---

## Implementation Notes

### Backend Requirements

The following backend services are needed to support these features:

1. **User Management Service** - Customer and rider profiles, authentication
2. **Product Service** - Product catalog, search, filtering
3. **Order Service** - Order creation, tracking, history
4. **Payment Service** - Payment processing, refunds, withdrawals
5. **Address Service** - Address storage and validation
6. **Rating Service** - Customer and rider ratings
7. **Earnings Service** - Rider earnings tracking and withdrawals
8. **Document Service** - Document upload and verification
9. **Notification Service** - Push notifications
10. **Chat Service** - Real-time messaging

### Third-Party Integrations

1. **Payment Gateways** - GCash, Maya, Stripe
2. **Map Services** - Google Maps API or Mapbox
3. **Push Notifications** - Firebase Cloud Messaging
4. **File Storage** - AWS S3 or Firebase Storage
5. **SMS/OTP** - Twilio or similar

### Technical Considerations

1. **Offline Support** - Some features should work offline (favorites, profile)
2. **Real-time Updates** - Order status, rider location, chat messages
3. **Caching** - Product data, order history for offline viewing
4. **Security** - Secure payment processing, data encryption
5. **Performance** - Fast loading, smooth animations
6. **Accessibility** - Screen reader support, appropriate contrast

---

## Summary

| Interface | Total Features | High Priority | Medium Priority | Low Priority |
|-----------|---------------|---------------|-----------------|--------------|
| **Customer** | 10 | 5 | 3 | 2 |
| **Rider** | 9 | 5 | 3 | 1 |
| **Total** | 19 | 10 | 6 | 3 |

**Recommended Implementation Order:**
1. Phase 1 (High Priority Core): Product Details, Checkout, Order History, Profile, Address Management, Earnings Dashboard, Availability Toggle, Rider Order History, Withdraw Earnings, GPS Navigation
2. Phase 2 (Medium Priority): Search, Filter, Order Cancellation, Vehicle Info, Document Upload, Rate Rider, Customer Rating
3. Phase 3 (Low Priority): Reorder, Favorites, Call Customer, Notification Settings

---

*Last Updated: 2026-03-09*
*Version: 1.0*
