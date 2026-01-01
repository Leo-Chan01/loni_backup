# LONI API Documentation

**Version:** 1.0  
**Base URL:** `/v1`  
**Authentication:** JWT Bearer Token (unless marked as Public)

---

## Table of Contents

1. [Authentication](#1-authentication)
2. [Books & Catalog](#2-books--catalog)
3. [Orders](#3-orders)
4. [Publisher](#4-publisher)
5. [Partner (Logistics)](#5-partner-logistics)
6. [Content & DRM](#6-content--drm)
7. [Analytics](#7-analytics)
8. [Notifications](#8-notifications)
9. [Admin](#9-admin)
10. [Payouts](#10-payouts)
11. [Hardcopy & Backorders](#11-hardcopy--backorders)

---

## 1. Authentication

### POST `/v1/login`
**Summary:** Authenticate and obtain access tokens (simplified)

**Request Body:**
```json
{
  "identifier": "string",     // Email or phone (min 3 chars)
  "password": "string",       // Min 6 chars
  "deviceId": "string",       // Min 6 chars
  "otp": "string"             // Optional, 6 digits
}
```

**Response (200):**
```json
{
  "accessToken": "string",
  "refreshToken": "string",
  "expiresIn": 3600,
  "user": {
    "id": "string",
    "email": "user@example.com",
    "phone": "+1234567890",
    "roles": ["customer"],
    "deviceId": "string",
    "region": "ng",
    "segments": [],
    "refreshTokenExpiresIn": 604800
  }
}
```

---

### POST `/v1/auth/signup`
**Summary:** Create a new user account

**Request Body:**
```json
{
  "email": "user@example.com",       // Optional (email or phone required)
  "phone": "+1234567890",            // Optional
  "password": "string",              // Min 8 chars, required
  "firstName": "string",
  "lastName": "string",
  "accountType": "reader | author | publisher",
  "sellerId": "string",
  "device": {
    "deviceId": "string",            // Required, min 6 chars
    "name": "string",
    "platform": "ios | android | web",
    "appVersion": "1.0.0",
    "pushToken": "string",
    "pushProvider": "fcm | apns"
  }
}
```

**Response (200):**
```json
{
  "accessToken": "string",
  "refreshToken": "string",
  "expiresIn": 3600,
  "user": { ... }
}
```

---

### POST `/v1/auth/login`
**Summary:** Authenticate via password or OTP

**Request Body:**
```json
{
  "identifier": "string",     // Email or phone
  "password": "string",       // Optional (password or otpCode required)
  "otpCode": "string",        // Optional, 6 digits
  "device": {
    "deviceId": "string",
    ...
  }
}
```

---

### POST `/v1/auth/partner/login`
**Summary:** Authenticate a logistics partner via API token

**Request Body:**
```json
{
  "partnerToken": "string"    // Min 10 chars
}
```

---

### GET `/v1/auth/jwks`
**Summary:** Get JWT public keys (JWKS)  
**Auth:** None

---

### POST `/v1/auth/token/refresh`
**Summary:** Refresh access tokens

**Request Body:**
```json
{
  "refreshToken": "string"    // Optional if sent via httpOnly cookie
}
```

---

### POST `/v1/auth/otp/send`
**Summary:** Send OTP to identifier

**Request Body:**
```json
{
  "identifier": "string"      // Email or phone
}
```

---

### POST `/v1/auth/password/reset/request`
**Summary:** Request password reset token

**Request Body:**
```json
{
  "identifier": "string"
}
```

---

### POST `/v1/auth/password/reset/confirm`
**Summary:** Confirm password reset

**Request Body:**
```json
{
  "token": "string",
  "password": "string"        // Min 8 chars
}
```

**Response:** 204 No Content

---

### POST `/v1/auth/password/change`
**Summary:** Change password for authenticated user  
**Auth:** Required

**Request Body:**
```json
{
  "currentPassword": "string",
  "newPassword": "string"
}
```

---

### GET `/v1/auth/profile`
**Summary:** Get authenticated user profile  
**Auth:** Required

**Response:**
```json
{
  "id": "string",
  "email": "user@example.com",
  "phone": "+1234567890",
  "firstName": "string",
  "lastName": "string",
  "roles": ["customer"],
  "region": "ng",
  "locale": "en",
  "subscriptionTier": "free | premium",
  "photoUrl": "https://...",
  "publishReady": true,
  "payoutMethod": "mobile_money | bank_transfer",
  "payoutMobile": "+1234567890"
}
```

---

### PATCH `/v1/auth/profile`
**Summary:** Update profile  
**Auth:** Required

**Request Body:**
```json
{
  "firstName": "string",
  "lastName": "string",
  "locale": "en",
  "region": "ng",
  "subscriptionTier": "string",
  "photoUrl": "https://...",
  "publishReady": true,
  "payoutMethod": "mobile_money | bank_transfer",
  "payoutMobile": "+1234567890"
}
```

---

### GET `/v1/auth/preferences`
**Summary:** Fetch user preferences  
**Auth:** Required

**Response:**
```json
{
  "preferredGenres": ["fiction", "romance"],
  "preferredLanguages": ["en", "fr"],
  "allowEmailUpdates": true,
  "allowSmsUpdates": false,
  "allowPushNotifications": true,
  "readingTheme": "light | dark | system",
  "textScale": "small | normal | large",
  "accessibility": {
    "dyslexicFont": false,
    "highContrast": false
  }
}
```

---

### PUT `/v1/auth/preferences`
**Summary:** Update preferences  
**Auth:** Required

---

### GET `/v1/auth/consents`
**Summary:** Fetch consent state  
**Auth:** Required

**Response:**
```json
{
  "marketingEmail": true,
  "marketingSms": false,
  "personalization": true,
  "updatedAt": "2024-01-01T00:00:00Z",
  "version": 1
}
```

---

### PATCH `/v1/auth/consents`
**Summary:** Update consent state  
**Auth:** Required

---

### GET `/v1/auth/parental-controls`
**Summary:** Fetch parental controls  
**Auth:** Required

**Response:**
```json
{
  "enabled": true,
  "contentRating": "kids | teen | mature",
  "pinConfigured": true,
  "pinSetAt": "2024-01-01T00:00:00Z",
  "updatedAt": "2024-01-01T00:00:00Z"
}
```

---

### PATCH `/v1/auth/parental-controls`
**Summary:** Update parental controls  
**Auth:** Required

**Request Body:**
```json
{
  "enabled": true,
  "contentRating": "teen",
  "pin": "1234",
  "clearPin": false
}
```

---

### GET `/v1/auth/sessions`
**Summary:** List active sessions  
**Auth:** Required

---

### DELETE `/v1/auth/sessions/:id`
**Summary:** Revoke a session  
**Auth:** Required

---

### GET `/v1/auth/devices`
**Summary:** List registered devices  
**Auth:** Required

---

### POST `/v1/auth/devices`
**Summary:** Register a device  
**Auth:** Required

---

### DELETE `/v1/auth/devices/:id`
**Summary:** Delete a device  
**Auth:** Required

---

### GET `/v1/auth/purchases`
**Summary:** List purchase history  
**Auth:** Required

---

### POST `/v1/auth/privacy/export`
**Summary:** Export profile + metadata (GDPR)  
**Auth:** Required

---

### POST `/v1/auth/privacy/delete`
**Summary:** Request account deletion  
**Auth:** Required

---

## 2. Books & Catalog

### GET `/v1/books`
**Summary:** List catalog titles with filters  
**Auth:** Optional (provides personalization)

**Query Parameters:**
| Parameter | Type | Description |
|-----------|------|-------------|
| region | string | ISO 2-letter region code |
| language | string | ISO 2-letter language code |
| category | string | Category filter |
| tag | string | Tag filter |
| type | enum | BOOK, PERIODICAL, ARTICLE, AUDIO, VIDEO, BUNDLE |
| audience | string | Audience filter |
| q | string | Search query |
| sort | enum | popular, new, price_asc, price_desc |
| page | number | Page number (default: 1) |
| pageSize | number | Items per page (max: 100) |
| ageYears | number | Age filter (0-120) |

**Response:**
```json
{
  "items": [
    {
      "id": "string",
      "title": "Book Title",
      "subtitle": "string",
      "authors": [{ "fullName": "Author Name", "role": "author" }],
      "coverImageUrl": "https://...",
      "priceCents": 1500,
      "currency": "XOF",
      "rating": 4.5,
      "reviewCount": 120,
      "categories": ["fiction"],
      "tags": ["bestseller"],
      "hardcopyAvailable": true
    }
  ],
  "total": 100,
  "page": 1,
  "pageSize": 20
}
```

---

### GET `/v1/search`
**Summary:** Search catalog inventory  
**Auth:** Optional

**Query Parameters:** Same as `/v1/books` but `q` is required (min 2 chars)

---

### GET `/v1/books/:id`
**Summary:** Fetch a book detail with DRM info  
**Auth:** Optional (DRM info only with auth)

**Response:**
```json
{
  "id": "string",
  "title": "Book Title",
  "subtitle": "string",
  "description": "Full description...",
  "authors": [...],
  "coverImageUrl": "https://...",
  "heroImageUrl": "https://...",
  "priceCents": 1500,
  "currency": "XOF",
  "pageCount": 250,
  "languageCode": "en",
  "releaseDate": "2024-01-01",
  "categories": [],
  "tags": [],
  "availability": [
    {
      "regionCode": "ng",
      "channel": "DIGITAL",
      "currency": "NGN",
      "priceCents": 5000
    }
  ],
  "hardcopyAvailable": true,
  "sampleUrl": "https://...",
  "drm": {
    "licenseId": "string",
    "deviceLimit": 5,
    "licenseStatus": "active | revoked | expired | pending",
    "activatedDevices": 2,
    "expiresAt": "2024-12-31T00:00:00Z"
  }
}
```

---

### GET `/v1/recommendations`
**Summary:** Fetch personalized recommendations  
**Auth:** Required

**Query Parameters:**
| Parameter | Type | Description |
|-----------|------|-------------|
| limit | number | Max results |
| region | string | Region code |

---

### GET `/v1/app/home`
**Summary:** Compose the home feed  
**Auth:** Required

**Query Parameters:**
| Parameter | Type | Description |
|-----------|------|-------------|
| region | string | Region code |
| language | string | Language code |
| includeRecommendations | boolean | Include recommendations (default: true) |
| refresh | boolean | Bypass cache (default: false) |

**Response:**
```json
{
  "user": { "id": "...", "region": "ng", "roles": [], "segments": [] },
  "cacheHit": false,
  "generatedAt": "2024-01-01T00:00:00Z",
  "hero": [{ ... book cards ... }],
  "shelves": [
    {
      "title": "Trending Now",
      "slug": "trending",
      "items": [{ ... book cards ... }]
    }
  ],
  "featuredCollections": [...],
  "recommendations": [...]
}
```

---

### POST `/v1/articles`
**Summary:** Publish or update an article/periodical  
**Auth:** Required (publisher/admin)

---

### GET `/v1/canonical/books`
**Summary:** List canonical book aggregates (work + editions)  
**Auth:** Required (admin/publisher/author)

---

### GET `/v1/canonical/books/:id`
**Summary:** Fetch a canonical book aggregate  
**Auth:** Required (admin/publisher/author)

---

### GET `/v1/canonical/books/by-catalog-item/:catalogItemId`
**Summary:** Fetch canonical book by catalog item ID  
**Auth:** Required (admin/publisher/author)

---

### GET `/v1/markets/region-presets`
**Summary:** List market region presets  
**Auth:** None (public)

---

## 3. Orders

### GET `/v1/orders`
**Summary:** List orders for current user  
**Auth:** Required

**Query Parameters:**
| Parameter | Type | Description |
|-----------|------|-------------|
| status | string | Order status filter |
| fulfillmentType | enum | DIGITAL, PRINT |
| limit | number | Max results (max: 200) |

**Response:**
```json
{
  "items": [
    {
      "orderId": "string",
      "status": "PENDING | PAID | FULFILLED | ...",
      "fulfillmentType": "DIGITAL | PRINT",
      "totalCents": 5000,
      "currency": "XOF",
      "createdAt": "2024-01-01T00:00:00Z",
      "items": [
        {
          "id": "string",
          "catalogItemId": "string",
          "title": "Book Title",
          "quantity": 1,
          "unitPriceCents": 5000,
          "fulfillmentStatus": "PENDING",
          "fulfillmentMetadata": {}
        }
      ]
    }
  ]
}
```

---

### POST `/v1/orders`
**Summary:** Create an order and reserve inventory  
**Auth:** Required

**Request Body:**
```json
{
  "items": [
    {
      "catalogItemId": "string",
      "quantity": 1,
      "unitPriceCents": 5000,         // Optional, can be inferred
      "title": "string"
    }
  ],
  "paymentMethod": "mobile_money | card | cash",
  "currency": "XOF",
  "taxResidence": {
    "countryCode": "NG",
    "regionCode": "LA"
  },
  "fulfillmentType": "DIGITAL | PRINT",
  "shippingAddress": {
    "name": "John Doe",
    "phone": "+1234567890",
    "line1": "123 Main St",
    "city": "Lagos",
    "regionCode": "LA",
    "countryCode": "NG",
    "postalCode": "100001"
  },
  "notes": "string",
  "metadata": {}
}
```

**Response (201):**
```json
{
  "orderId": "string",
  "status": "pending | confirmed | failed",
  "amountCents": 5000,
  "currency": "XOF",
  "paymentReference": "string"
}
```

---

### GET `/v1/orders/:orderId`
**Summary:** Fetch order detail with tracking  
**Auth:** Required

**Response:**
```json
{
  "orderId": "string",
  "status": "PAID",
  "fulfillmentType": "PRINT",
  "totalCents": 5000,
  "currency": "XOF",
  "shippingAddress": { ... },
  "items": [...],
  "tracking": {
    "trackingCode": "LONI-ABC123",
    "status": "SHIPPED",
    "customerName": "John Doe",
    "destination": "Lagos, Nigeria",
    "quantity": 1,
    "etaDate": "2024-01-15",
    "timeline": [
      {
        "id": "string",
        "orderId": "string",
        "status": "SHIPPED",
        "note": "Package dispatched",
        "location": "Lagos",
        "createdAt": "2024-01-10T00:00:00Z"
      }
    ],
    "proofs": []
  }
}
```

---

### POST `/v1/orders/:orderId/pay`
**Summary:** Initiate payment for an order  
**Auth:** Required

**Request Body:**
```json
{
  "provider": "momo | wave | airtel | orange | momopay | cinetpay",
  "channel": "mtn_mobile_money",
  "countryCode": "NG",
  "msisdn": "+1234567890",
  "email": "user@example.com",
  "name": "John Doe",
  "returnUrl": "https://app.loni.com/callback",
  "confirmPhoneNumber": true,        // Required if paying to non-verified phone
  "metadata": {}
}
```

**Response:**
```json
{
  "status": "initiated | requires_action | confirmed",
  "paymentUrl": "https://payment.provider.com/checkout",
  "expiresAt": "2024-01-01T01:00:00Z"
}
```

---

### POST `/v1/orders/:orderId/refund`
**Summary:** Request a refund for an order  
**Auth:** Required

**Request Body:**
```json
{
  "reason": "string"          // Min 6 chars
}
```

---

### POST `/v1/orders/:orderId/cancel-backorder`
**Summary:** Cancel a backorder and get a full refund  
**Auth:** Required

**Request Body:**
```json
{
  "reason": "string"          // Optional
}
```

---

### PUT `/v1/orders/:orderId/shipping-address`
**Summary:** Update shipping address for delivery-failed order  
**Auth:** Required

**Request Body:**
```json
{
  "shippingAddress": {
    "name": "string",
    "phone": "string",
    "line1": "string",
    "city": "string",
    "regionCode": "string",
    "countryCode": "string",
    "postalCode": "string"
  }
}
```

---

### GET `/v1/tracking/:trackingCode`
**Summary:** Fetch customer-facing tracking details  
**Auth:** None (public)

---

### POST `/v1/payments/webhook/:provider`
**Summary:** Forward provider payment webhooks  
**Auth:** Webhook signature

---

## 4. Publisher

### GET `/v1/publisher/profile`
**Summary:** Get current publisher profile  
**Auth:** Required (publisher/admin)

---

### PATCH `/v1/publisher/profile`
**Summary:** Update publisher profile  
**Auth:** Required (publisher/admin)

**Request Body:**
```json
{
  "name": "string",
  "email": "publisher@example.com",
  "phone": "+1234567890",
  "country": "NG",
  "currency": "NGN",
  "taxId": "string",
  "imprint": "string",
  "website": "https://...",
  "payoutAccount": {
    "method": "bank | mobile_money",
    "bankName": "string",
    "accountNumber": "string",
    "accountName": "string",
    "currency": "NGN",
    "country": "NG"
  }
}
```

---

### POST `/v1/publisher/upload`
**Summary:** Create an upload intent for book upload  
**Auth:** Required (publisher/admin)

**Request Body:**
```json
{
  "publisherId": "string",
  "filename": "my-book.epub",
  "mimeType": "application/epub+zip",
  "sizeBytes": 1234567,
  "assetType": "MANUSCRIPT | COVER | AUDIO | SUPPLEMENT",
  "resumable": false,
  "partSizeBytes": 5242880
}
```

**Response:**
```json
{
  "id": "string",
  "publisherId": "string",
  "uploadUrl": "https://storage.example.com/presigned-url",
  "expiresAt": "2024-01-01T01:00:00Z",
  "status": "PENDING",
  "resumable": {
    "key": "string",
    "multipartUploadId": "string",
    "partSizeBytes": 5242880,
    "partCount": 10
  }
}
```

---

### GET `/v1/publisher/uploads/:uploadId`
**Summary:** Get upload metadata by ID  
**Auth:** Required (publisher/admin)

---

### GET `/v1/publisher/uploads/:uploadId/epub`
**Summary:** Get signed URL for processed EPUB  
**Auth:** Required (publisher/author)

---

### GET `/v1/publisher/uploads/:uploadId/resumable/status`
**Summary:** Get resumable upload status  
**Auth:** Required (publisher/admin)

---

### POST `/v1/publisher/uploads/:uploadId/resumable/parts`
**Summary:** Get signed URLs for resumable upload parts  
**Auth:** Required (publisher/admin)

---

### POST `/v1/publisher/uploads/:uploadId/resumable/complete`
**Summary:** Complete a resumable multipart upload  
**Auth:** Required (publisher/admin)

---

### GET `/v1/publisher/submissions`
**Summary:** List submissions for a publisher  
**Auth:** Required (publisher/admin)

---

### POST `/v1/publisher/submissions`
**Summary:** Create a submission  
**Auth:** Required (publisher/admin)

**Request Body:**
```json
{
  "publisherId": "string",
  "title": "Book Title",
  "description": "string",
  "uploadId": "string",
  "coverUploadId": "string",
  "catalogItemId": "string",
  "currency": "XOF",
  "priceDigitalCents": 5000,
  "pricePrintCents": 7500,
  "hardcopyAvailable": true,
  "printPartnerId": "string",
  "printOptions": {
    "coverType": "PAPERBACK | HARDCOVER",
    "trimSize": "A5 | A4",
    "interiorColor": "BW | COLOR"
  },
  "languageCode": "en",
  "ageRating": "all | 13+ | 18+",
  "tags": ["fiction", "romance"],
  "categories": ["novels"],
  "regionCodes": ["ng", "gh"],
  "availability": [...],
  "notes": "string"
}
```

---

### GET `/v1/publisher/submissions/:submissionId`
**Summary:** Get a submission by ID  
**Auth:** Required (publisher/admin)

---

### PATCH `/v1/publisher/submissions/:submissionId`
**Summary:** Update a submission  
**Auth:** Required (publisher/admin)

---

### DELETE `/v1/publisher/submissions/:submissionId`
**Summary:** Delete (archive) a submission  
**Auth:** Required (publisher/admin)

---

### POST `/v1/publisher/submissions/:submissionId/promote`
**Summary:** Request to promote a book  
**Auth:** Required (publisher/admin)

---

### GET `/v1/publisher/dashboard`
**Summary:** Publisher dashboard (self-scoped)  
**Auth:** Required (publisher/admin)

---

### GET `/v1/publisher/print-partners`
**Summary:** List available print partners  
**Auth:** Required (publisher/admin)

---

### GET `/v1/publisher/royalties`
**Summary:** Publisher royalty summary  
**Auth:** Required (publisher/admin)

---

### GET `/v1/publisher/royalties/statements`
**Summary:** Publisher royalty statements  
**Auth:** Required (publisher/admin)

---

### GET `/v1/publisher/royalties/schedule`
**Summary:** Publisher royalty schedule  
**Auth:** Required (publisher/admin)

---

### POST `/v1/publisher/earnings/estimate`
**Summary:** Estimate publisher earnings for a price  
**Auth:** Required (publisher/admin)

---

### GET `/v1/publisher/analytics`
**Summary:** Publisher analytics  
**Auth:** Required (publisher/admin)

---

### GET `/v1/publisher/notifications`
**Summary:** List in-app notifications for publisher  
**Auth:** Required (publisher/admin)

---

### POST `/v1/publisher/notifications/:notificationId/read`
**Summary:** Mark a notification as read  
**Auth:** Required (publisher/admin)

---

### POST `/v1/publisher/notifications/read-all`
**Summary:** Mark all notifications as read  
**Auth:** Required (publisher/admin)

---

## 5. Partner (Logistics)

**Note:** Partner routes use `x-partner-token` header for authentication.

### GET `/v1/partners/orders`
**Summary:** List print jobs assigned to the partner  
**Auth:** Partner token

**Query Parameters:**
| Parameter | Type | Description |
|-----------|------|-------------|
| status | enum | RECEIVED, PRINTING, PACKED, SHIPPED, DELIVERED, ON_HOLD |

---

### GET `/v1/partners/orders/:id`
**Summary:** Get a print job assigned to the partner  
**Auth:** Partner token

---

### POST `/v1/partners/orders/:id/status`
**Summary:** Update print job status  
**Auth:** Partner token

**Request Body:**
```json
{
  "status": "RECEIVED | PRINTING | PACKED | SHIPPED | DELIVERED | ON_HOLD",
  "note": "string",
  "location": "string",
  "etaDate": "2024-01-15"
}
```

---

### POST `/v1/partners/orders/:id/proof`
**Summary:** Attach proof of delivery  
**Auth:** Partner token

**Request Body:**
```json
{
  "type": "PHOTO | SIGNATURE | OTP",
  "reference": "string",
  "mimeType": "image/jpeg",
  "sizeBytes": 123456,
  "url": "https://...",
  "collectedBy": "Driver Name",
  "note": "string"
}
```

---

## 6. Content & DRM

### GET `/v1/content/:fileId/chunks/:chunkId`
**Summary:** Fetch a signed chunk URL (DRM-aware)  
**Auth:** Required

**Query Parameters:**
| Parameter | Type | Description |
|-----------|------|-------------|
| licenseId | string | DRM license ID (required) |

---

### GET `/v1/content/:fileId/sample`
**Summary:** Fetch sample preview metadata  
**Auth:** Required

**Query Parameters:**
| Parameter | Type | Description |
|-----------|------|-------------|
| licenseId | string | DRM license ID |
| previewToken | string | Preview token |

---

### POST `/v1/content/:fileId/preview-token`
**Summary:** Issue a preview token for a sample  
**Auth:** Required

---

### GET `/v1/content/policy`
**Summary:** Fetch DRM/content policy  
**Auth:** Required

---

### GET `/v1/content/offline/policy`
**Summary:** Fetch offline download policy  
**Auth:** Required

---

### GET `/v1/content/offline-telemetry/:deviceId`
**Summary:** Report offline storage quota telemetry  
**Auth:** Required

---

### POST `/v1/content/offline-requests`
**Summary:** Request an offline bundle for this device  
**Auth:** Required

**Request Body:**
```json
{
  "fileId": "string",
  "bundleType": "FULL | SCHOOL_PACKET | SAMPLE",
  "licenseId": "string",
  "licenseExpiresAt": "2024-12-31T00:00:00Z"
}
```

---

### GET `/v1/content/offline-requests`
**Summary:** List offline bundle requests for this device  
**Auth:** Required

---

### POST `/v1/content/offline-requests/:id/acknowledge`
**Summary:** Mark an offline bundle as consumed  
**Auth:** Required

---

### GET `/v1/content/offline/telemetry`
**Summary:** Fetch offline storage telemetry  
**Auth:** Required

---

### GET `/v1/drm/licenses/:bookId`
**Summary:** Get DRM license status and licenseId  
**Auth:** Required

**Response:**
```json
{
  "licenseId": "string",
  "deviceLimit": 5,
  "licenseStatus": "active | revoked | expired | pending",
  "expiresAt": "2024-12-31T00:00:00Z",
  "activatedDevices": 2
}
```

---

## 7. Analytics

### GET `/v1/analytics/reading-states`
**Summary:** List reading states for authenticated user  
**Auth:** Required

**Query Parameters:**
| Parameter | Type | Description |
|-----------|------|-------------|
| catalogItemId | string | Filter by book |
| licenseId | string | Filter by license |
| deviceId | string | Filter by device |

---

### POST `/v1/analytics/reading-states`
**Summary:** Sync a reading state snapshot  
**Auth:** Required

**Request Body:**
```json
{
  "catalogItemId": "string",
  "licenseId": "string",
  "lastLocation": { "cfi": "/6/4[chap01]!/4/2/1:0" },
  "percentComplete": 45.5,
  "finished": false,
  "capturedAt": "2024-01-01T00:00:00Z",
  "deviceId": "string",
  "deviceContext": {},
  "offline": false
}
```

---

### GET `/v1/analytics/highlights`
**Summary:** List highlights for authenticated user  
**Auth:** Required

---

### POST `/v1/analytics/highlights`
**Summary:** Create a highlight entry  
**Auth:** Required

**Request Body:**
```json
{
  "catalogItemId": "string",
  "highlight": {
    "cfi": "string",
    "text": "Highlighted text",
    "note": "My note",
    "color": "#ffff00"
  }
}
```

---

### POST `/v1/analytics/reading-sessions`
**Summary:** Record a reading session  
**Auth:** Required

**Request Body:**
```json
{
  "catalogItemId": "string",
  "startedAt": "2024-01-01T00:00:00Z",
  "endedAt": "2024-01-01T01:00:00Z",
  "durationSeconds": 3600,
  "deviceId": "string",
  "metadata": {}
}
```

---

### GET `/v1/analytics/reading-sessions`
**Summary:** List recorded reading sessions  
**Auth:** Required

---

### GET `/v1/admin/analytics/reading-report`
**Summary:** Aggregated reading analytics  
**Auth:** Required (admin/support)

---

## 8. Notifications

### GET `/v1/notifications`
**Summary:** List in-app notifications for current user  
**Auth:** Required

**Query Parameters:**
| Parameter | Type | Description |
|-----------|------|-------------|
| limit | number | Max results (max: 200) |

**Response:**
```json
[
  {
    "id": "string",
    "type": "order.shipped | payment.confirmed | ...",
    "title": "Your order has shipped",
    "body": "Your book is on its way!",
    "data": {},
    "readAt": null,
    "createdAt": "2024-01-01T00:00:00Z"
  }
]
```

---

### POST `/v1/notifications/:notificationId/read`
**Summary:** Mark a notification as read  
**Auth:** Required

---

### POST `/v1/notifications/read-all`
**Summary:** Mark all notifications as read  
**Auth:** Required

---

## 9. Admin

### GET `/v1/admin/health`
**Summary:** Admin-scoped health probe  
**Auth:** Required (admin)

---

### GET `/v1/admin/overview`
**Summary:** Aggregate cross-service admin metrics  
**Auth:** Required (admin)

**Query Parameters:**
| Parameter | Type | Description |
|-----------|------|-------------|
| include | array | catalog, publishers, users |

---

### GET `/v1/admin/summary`
**Summary:** Publisher admin summary  
**Auth:** Required (admin)

---

### GET `/v1/admin/audit`
**Summary:** List recent admin actions  
**Auth:** Required (admin)

---

### GET `/v1/admin/system/features`
**Summary:** List gateway feature flags  
**Auth:** Required (admin)

---

### GET `/v1/admin/system/roles`
**Summary:** List known roles and portal access matrix  
**Auth:** Required (admin)

---

### GET `/v1/admin/system/settings`
**Summary:** Expose safe gateway settings  
**Auth:** Required (admin)

---

### GET `/v1/admin/system/status`
**Summary:** Expose gateway/system status  
**Auth:** Required (admin)

---

### GET `/v1/admin/users`
**Summary:** Search users for admin console  
**Auth:** Required (admin)

**Query Parameters:**
| Parameter | Type | Description |
|-----------|------|-------------|
| q | string | Search query |
| role | string | Role filter |
| limit | number | Max results (max: 100) |

---

### GET `/v1/admin/users/:userId`
**Summary:** Fetch detailed user profile  
**Auth:** Required (admin)

---

### PATCH `/v1/admin/users/:userId`
**Summary:** Update a user profile/role  
**Auth:** Required (admin)

---

### POST `/v1/admin/users/:userId/suspend`
**Summary:** Suspend a user account  
**Auth:** Required (admin)

---

### POST `/v1/admin/users/:userId/activate`
**Summary:** Activate (unsuspend) a user account  
**Auth:** Required (admin)

---

### POST `/v1/admin/users/:userId/soft-delete`
**Summary:** Soft delete (anonymize) a user account  
**Auth:** Required (admin)

---

### GET `/v1/admin/moderation/tasks`
**Summary:** List publisher moderation tasks  
**Auth:** Required (admin)

---

### GET `/v1/admin/moderation/tasks/:taskId`
**Summary:** Fetch moderation task detail  
**Auth:** Required (admin)

---

### GET `/v1/admin/moderation/tasks/:taskId/events`
**Summary:** List moderation task events  
**Auth:** Required (admin)

---

### GET `/v1/admin/moderation/tasks/:taskId/epub`
**Summary:** Get processed EPUB for moderation review  
**Auth:** Required (admin/content_ops/support)

---

### PATCH `/v1/admin/moderation/tasks/:taskId`
**Summary:** Update a moderation task status  
**Auth:** Required (admin/content_ops)

**Request Body:**
```json
{
  "publisherId": "string",
  "status": "PENDING | IN_REVIEW | APPROVED | REJECTED | ESCALATED",
  "assignedTo": "string",
  "reviewerNotes": "string",
  "note": "string"
}
```

---

### GET `/v1/admin/refunds`
**Summary:** List order refunds  
**Auth:** Required (admin/finance/support)

---

### PATCH `/v1/admin/refunds/:refundId`
**Summary:** Review a refund request  
**Auth:** Required (admin/finance/support)

**Request Body:**
```json
{
  "status": "APPROVED | REJECTED | COMPLETED",
  "note": "string"
}
```

---

### GET `/v1/admin/orders`
**Summary:** List orders for admin tools  
**Auth:** Required (admin/finance/support)

---

### GET `/v1/admin/orders/kpis`
**Summary:** Orders KPI snapshot  
**Auth:** Required (admin/finance/support)

---

### GET `/v1/admin/orders/:orderId`
**Summary:** Fetch an order detail  
**Auth:** Required (admin/finance/support)

---

### POST `/v1/admin/orders/:orderId/cancel`
**Summary:** Cancel an order  
**Auth:** Required (admin/finance/support)

---

### POST `/v1/admin/orders/:orderId/escalate`
**Summary:** Escalate an order  
**Auth:** Required (admin/finance/support)

---

### POST `/v1/admin/orders/:orderId/reassign-printer`
**Summary:** Reassign printer for a print order  
**Auth:** Required (admin/support)

---

### GET `/v1/admin/catalog/flags`
**Summary:** List compliance flags  
**Auth:** Required (admin)

---

### POST `/v1/admin/catalog/flags/:flagId/status`
**Summary:** Update compliance flag status  
**Auth:** Required (admin)

---

### GET `/v1/admin/catalog/items/:itemId/compliance`
**Summary:** Fetch catalog item's compliance profile  
**Auth:** Required (admin)

---

### POST `/v1/admin/catalog/items/:itemId/compliance`
**Summary:** Update catalog item's compliance rules  
**Auth:** Required (admin)

---

### GET `/v1/admin/catalog/compliance`
**Summary:** List compliance rules (flattened)  
**Auth:** Required (admin)

---

### POST `/v1/admin/catalog/compliance`
**Summary:** Create a compliance rule  
**Auth:** Required (admin)

---

### PATCH `/v1/admin/catalog/compliance/:ruleId`
**Summary:** Update a compliance rule  
**Auth:** Required (admin)

---

### DELETE `/v1/admin/catalog/compliance/:ruleId`
**Summary:** Delete a compliance rule  
**Auth:** Required (admin)

---

### POST `/v1/admin/catalog/compliance/simulate`
**Summary:** Simulate catalog compliance evaluation  
**Auth:** Required (admin)

---

### GET `/v1/admin/catalog/featured`
**Summary:** List featured catalog items  
**Auth:** Required (admin/content_ops)

---

### POST `/v1/admin/catalog/featured/:itemId`
**Summary:** Set or remove a featured placement  
**Auth:** Required (admin/content_ops)

---

### GET `/v1/admin/content/search`
**Summary:** Search catalog content for admin tools  
**Auth:** Required (admin/content_ops/support)

---

### GET `/v1/admin/catalog/items/:itemId`
**Summary:** Fetch catalog item detail  
**Auth:** Required (admin/content_ops/support)

---

### PUT `/v1/admin/catalog/items/:itemId/lifecycle/schedule`
**Summary:** Schedule publish/unpublish  
**Auth:** Required (admin/content_ops)

---

### POST `/v1/admin/catalog/items/:itemId/lifecycle/publish`
**Summary:** Publish a catalog item now  
**Auth:** Required (admin/content_ops)

---

### POST `/v1/admin/catalog/items/:itemId/lifecycle/unpublish`
**Summary:** Unpublish a catalog item now  
**Auth:** Required (admin/content_ops)

---

### POST `/v1/admin/catalog/items/:itemId/lifecycle/cancel`
**Summary:** Cancel publish/unpublish scheduling  
**Auth:** Required (admin/content_ops)

---

### GET `/v1/admin/economics`
**Summary:** Get platform economics settings  
**Auth:** Required (admin/finance)

---

### PUT `/v1/admin/economics`
**Summary:** Update platform economics settings  
**Auth:** Required (admin/finance)

---

### GET `/v1/admin/markets/region-presets`
**Summary:** Get market region presets  
**Auth:** Required (admin)

---

### PUT `/v1/admin/markets/region-presets`
**Summary:** Replace market region presets  
**Auth:** Required (admin)

---

### GET `/v1/admin/reporting`
**Summary:** Aggregate admin reporting (orders)  
**Auth:** Required (admin/finance/support)

---

### GET `/v1/admin/reporting/export`
**Summary:** Export admin reporting (CSV)  
**Auth:** Required (admin/finance/support)

---

### GET `/v1/admin/backorders/summary`
**Summary:** Get backorder queue summary by region  
**Auth:** Required (admin/support/finance)

---

### GET `/v1/admin/backorders`
**Summary:** List backorders for admin tools  
**Auth:** Required (admin/support/finance)

---

### GET `/v1/admin/revenue-splits`
**Summary:** List all revenue splits  
**Auth:** Required (admin/finance)

---

### GET `/v1/admin/revenue-splits/:splitId`
**Summary:** Get a single revenue split  
**Auth:** Required (admin/finance)

---

### POST `/v1/admin/revenue-splits`
**Summary:** Create a new revenue split  
**Auth:** Required (admin)

---

### PUT `/v1/admin/revenue-splits/:splitId`
**Summary:** Update a revenue split  
**Auth:** Required (admin)

---

### DELETE `/v1/admin/revenue-splits/:splitId`
**Summary:** Deactivate a revenue split  
**Auth:** Required (admin)

---

### POST `/v1/admin/revenue-splits/preview`
**Summary:** Preview how revenue would be split  
**Auth:** Required (admin/finance)

---

### POST `/v1/admin/ledger/adjustment`
**Summary:** Create a manual ledger adjustment  
**Auth:** Required (admin)

**Request Body:**
```json
{
  "orderId": "string",
  "entityType": "PLATFORM | PUBLISHER | AUTHOR | PRINT_PARTNER",
  "entityId": "string",
  "direction": "CREDIT | DEBIT",
  "amountCents": 1000,
  "currency": "XOF",
  "reason": "Correction for missed royalty payment"
}
```

---

## 10. Payouts

### GET `/v1/admin/payouts/balances`
**Summary:** Aggregate pending balances for an entity  
**Auth:** Required (admin/finance/support)

---

### GET `/v1/admin/payouts/pending`
**Summary:** List pending ledger entries  
**Auth:** Required (admin/finance/support)

---

### GET `/v1/admin/payouts/statements`
**Summary:** Statement view for an entity  
**Auth:** Required (admin/finance/support)

---

### GET `/v1/admin/payouts/batches`
**Summary:** List payout batches  
**Auth:** Required (admin/finance)

---

### POST `/v1/admin/payouts/batch`
**Summary:** Create a payout batch  
**Auth:** Required (admin/finance)

---

### POST `/v1/admin/payouts/scheduler/run`
**Summary:** Run payout scheduler for entities  
**Auth:** Required (admin/finance)

---

### GET `/v1/admin/payouts/batches/:batchId/export`
**Summary:** Export a payout batch as CSV  
**Auth:** Required (admin/finance)

---

## 11. Hardcopy & Backorders

### GET `/v1/hardcopy/availability/:bookId`
**Summary:** Check hardcopy availability for a book  
**Auth:** None (public)

**Query Parameters:**
| Parameter | Type | Description |
|-----------|------|-------------|
| region | string | Region code (optional) |

**Response:**
```json
{
  "bookId": "string",
  "hardcopyEnabled": true,
  "fulfillmentAvailable": true,
  "status": "available | coming_soon | unavailable",
  "message": "Hardcopy is available for delivery",
  "regions": {
    "ng": {
      "regionCode": "ng",
      "available": true,
      "partnerCount": 3,
      "status": "available"
    }
  }
}
```

---

### GET `/v1/hardcopy/partners/availability`
**Summary:** Get print partner availability by region  
**Auth:** None (public)

**Response:**
```json
{
  "regions": [
    {
      "regionCode": "ng",
      "available": true,
      "partnerCount": 3,
      "status": "available"
    }
  ],
  "allRegions": ["ng", "gh", "ke"],
  "updatedAt": "2024-01-01T00:00:00Z"
}
```

---

### GET `/v1/hardcopy/backorder-offers`
**Summary:** Get digital discount offers for active backorders  
**Auth:** Required

**Response:**
```json
{
  "offers": [
    {
      "orderId": "string",
      "bookId": "string",
      "bookTitle": "Book Title",
      "backorderCreatedAt": "2024-01-01T00:00:00Z",
      "autoRefundAt": "2024-01-31T00:00:00Z",
      "digitalDiscountPercent": 50,
      "digitalOriginalPriceCents": 5000,
      "digitalDiscountedPriceCents": 2500,
      "currency": "XOF"
    }
  ],
  "hasOffers": true
}
```

---

## Error Responses

All endpoints return errors in the following format:

```json
{
  "statusCode": 400,
  "error": "Bad Request",
  "message": "Descriptive error message"
}
```

### Common HTTP Status Codes

| Code | Description |
|------|-------------|
| 200 | Success |
| 201 | Created |
| 204 | No Content |
| 400 | Bad Request - Invalid input |
| 401 | Unauthorized - Missing/invalid auth |
| 403 | Forbidden - Insufficient permissions |
| 404 | Not Found |
| 409 | Conflict - Resource state conflict |
| 422 | Unprocessable Entity - Validation failed |
| 429 | Too Many Requests - Rate limited |
| 500 | Internal Server Error |
| 502 | Bad Gateway - Downstream service error |

---

## Rate Limiting

Most endpoints are rate-limited. Limits vary by endpoint:

| Category | Default Limit |
|----------|---------------|
| Public endpoints | 60 req/min |
| Authenticated endpoints | 120 req/min |
| Partner endpoints | 120-240 req/min |
| Admin endpoints | 30-60 req/min |
| Webhook endpoints | No limit |

Rate limit headers are included in responses:
- `X-RateLimit-Limit`
- `X-RateLimit-Remaining`
- `X-RateLimit-Reset`

---

## Authentication Headers

### JWT Bearer Token
```
Authorization: Bearer <access_token>
```

### Partner Token
```
x-partner-token: <partner_api_token>
```

### Cookies (Web Clients)
- `accessToken`: JWT access token
- `refreshToken`: Refresh token
- `partnerToken`: Partner API token

---

## Webhooks

### Payment Webhooks

**Endpoint:** `POST /v1/payments/webhook/:provider`

**Supported Providers:**
- momo
- wave
- airtel
- orange
- momopay
- cinetpay

**Headers:**
- `x-payment-signature`
- `x-webhook-signature`
- `x-signature`
- `stripe-signature`

---

*Last Updated: December 2024*

