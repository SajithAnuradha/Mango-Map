# MangoMap Backend REST API Documentation [v1.0] [RAW]

This document provides a detailed description of the MangoMap Backend REST API. The API is designed to be used by the MangoMap frontend application. The API is versioned and the current version is `v1`.

### Register Handling

| Endpoint Description   | Endpoint URL                 | Method |
| ---------------------- | ---------------------------- | ------ |
| Normal User Register   | **api/v1/register/normal**   | POST   |
| Business User Register | **api/v1/register/business** | POST   |

### Login

| Endpoint Description | Endpoint URL                | Method | Status |
| -------------------- | --------------------------- | ------ | ------ |
| Login                | **api/v1/auth/login**       | POST   | OK     |
| Password Change      | **api/v1/auth/change-pass** | PUT    | OK     |

### Normal User Profile

| Endpoint Description                              | Endpoint URL                       | Method | Status |
| ------------------------------------------------- | ---------------------------------- | ------ | ------ |
| Profile Image Change                              | **api/v1/profile/normal/me/image** | PUT    | OK     |
| Profile Update                                    | **api/v1/profile/norma/me**        | PUT    | OK     |
| Delete Profile                                    | **api/v1/profile/normal/me**       | DELETE | OK     |
| Get Normal User Profile of the Authenticated User | **api/v1/profile/normal/me**       | GET    | OK     |
| Get Normal User Profile with ID                   | **api/v1/profile/normal/{id}**     | GET    | OK     |
| Get Normal User Profiles                          | **api/v1/profile/normal**          | GET    | OK     |

### Location Basedc Images

| Endpoint Description | Endpoint URL                 | Method |
| -------------------- | ---------------------------- | ------ |
| Uploading Images     | **api/v1/location**          | POST   |
| Get Images           | **api/v1/location**          | GET    |
| Trending             | **api/v1/location/trending** | GET    |
| Get Image            | **api/v1/location/{id}**     | GET    |
| Delete Image         | **api/v1/location/{id}**     | DELETE |
| Like Image           | **api/v1/location/id/like**  | POST   |
| Remove Like          | **api/v1/location/id/like**  | DELETE |

### Business User Profile

| Endpoint Description | Endpoint URL                                       | Method | Status |
| -------------------- | -------------------------------------------------- | ------ | ------ |
| Profile Image Change | **api/v1/profile/business/{id}/image**             | PUT    | OK     |
| Profile Update       | **api/v1/profile/business/{id}**                   | PUT    | OK     |
| Delete Profile       | **api/v1/profile/business/{id}**                   | DELETE | OK     |
| Get Profiles         | **api/v1/profile/business**                        | GET    | OK     |
| Get Profile          | **api/v1/profile/business/{id}**                   | GET    | OK     |
| Get QR Code          | **api/v1/profile/business/{id}/qr**                | GET    | OK     |
| One Time Pin         | **api/v1/profile/business/{id}/pin**               | GET    | #####  |
| Get Announcements    | **api/v1/profile/business/{id}/announcements**     | GET    | OK     |
| Get Announcement     | **api/v1/profile/business/{id}/announcement/{id}** | GET    | OK     |
| Announcement         | **api/v1/profile/business/{id}/announcement**      | POST   | OK     |

### Business Photo Upload

| Endpoint Description | Endpoint URL                              | Method | Status |
| -------------------- | ----------------------------------------- | ------ | ------ |
| QR based Review      | **api/v1/business/{id}/review**           | POST   |        |
| Review Delete        | **api/v1/business/{id}/review/{id}**      | DELETE | OK     |
| Photo Delete         | **api/v1/business/{id}/image/{id}**       | DELETE | OK     |
| Get Reviews          | **api/v1/business/{id}/reviews**          | GET    | OK     |
| Get Review           | **api/v1/business/{id}/review/{id}**      | GET    | OK     |
| Get Likes            | **api/v1/business/{id}/photo/{id}/likes** | GET    | OK     |
| Like Image           | **api/v1/business/{id}/photo/{id}/like**  | POST   | OK     |
| Remove Like          | **api/v1/business/{id}/photo/{id}/like**  | DELETE | OK     |
| Update Review        | **api/v1/business/{id}/review/{id}**      | PUT    | ISSUE  |

### Search

| Endpoint Description | Endpoint URL               | Method |
| -------------------- | -------------------------- | ------ |
| Business Profile     | **api/v1/search/business** | GET    |
| Location Based       | **api/v1/search/location** | GET    |

### Chat

| Endpoint Description | Endpoint URL                            | Method |
| -------------------- | --------------------------------------- | ------ |
| Send Message         | **api/v1/chat/{id}**                    | POST   |
| Delete Message       | **api/v1/chat/{id}/message/{id}**       | DELETE |
| Reply                | **api/v1/chat/{id}/message/{id}/reply** | POST   |
| Get Messages         | **api/v1/chat/{id}**                    | GET    |

### Notification

| Endpoint Description | Endpoint URL                 | Method |
| -------------------- | ---------------------------- | ------ |
| Get Notification     | **api/v1/notification/{id}** | GET    |
| Delete Notification  | **api/v1/notification/{id}** | DELETE |

### Promotion

| Endpoint Description | Endpoint URL                            | Method |
| -------------------- | --------------------------------------- | ------ |
| Post Promotion       | **api/v1/promotion/{id}/business/{id}** | POST   |
