### API Documentation [v1.0] [RAW]

- Register Handling

  1. Normal User Register - **api/v1/register/normal** - POST
  2. Business User Register - **api/v1/register/business** - POST

- Login

  1. **api/v1/auth/login** - POST
  2. Password Change - **api/v1/auth/change-pass/{id}** - PUT

- Normal User Profile

  1. Profile Image Change - **api/v1/profile/normal/{id}/image** - PUT
  2. Profile Update - **api/v1/profile/normal/{id}** - PUT
  3. Delete Profile - **api/v1/profile/normal/{id}** - DELETE

- Location Basedc Images

  1. Uploding Images - **api/v1/location** - POST
  2. Get Images - **api/v1/location** - GET
  3. Trending - **api/v1/location/trending** - GET
  4. Get Image - **api/v1/location/{id}** - GET
  5. Delete Image - **api/v1/location/{id}** - DELETE
  6. Like Image - **api/v1/location/id/like** - POST
  7. Remove Like - **api/v1/location/id/like** - DELETE

- Business User Profile

  1. Profile Image Change - **api/v1/profile/business/{id}/image** - PUT
  2. Profile Update - **api/v1/profile/business/{id}** - PUT ------------------------------OK
  3. Delete Profile - **api/v1/profile/business/{id}** - DELETE ---------------------------OK
  4. Get Profiles - **api/v1/profile/business** - GET -------------------------------------OK
  5. Get Profile - **api/v1/profile/business/{id}** - GET ---------------------------------OK
  6. Get QR Code - **api/v1/profile/business/{id}/qr** - GET ------------------------------OK
  7. One Time Pin - **api/v1/profile/business/{id}/pin** - GET ----------------------------#####
  8. Get Announcements - **api/v1/profile/business/{id}/announcements** - GET --------------OK
  9. Get Announcement - **api/v1/profile/business/{id}/announcement/{id}** - GET -----------OK
  10. Announcement - **api/v1/profile/business/{id}/announcement** - POST ------------------- OK

- Business Photo Upload

  1. QR based Review - **api/v1/business/{id}/review** - POST (Include Rating, Images)
  2. Review Delete - **api/v1/business/{id}/review/{id}** - DELETE --------------------------OK
  3. Photo Delete - **api/v1/business/{id}/image/{id}** - DELETE ----------------------------OK
  4. Get Reviews - **api/v1/business/{id}/reviews** - GET -----------------------------------OK
  5. Get Review - **api/v1/business/{id}/review/{id}** - GET --------------------------------OK
  6. Get Likes - **api/v1/business/{id}/photo/{id}/likes** - GET ----------------------------OK
  7. Like Image - **api/v1/business/{id}/photo/{id}/like** - POST ---------------------------OK
  8. Remove Like - **api/v1/business/{id}/photo/{id}/like** - DELETE ------------------------OK
  9. Update Review - **api/v1/business/{id}/review/{id}** - PUT -----------------------------ISSUE

- Search

  1. Business Profile - **api/v1/search/business** - GET
  2. Location Based - **api/v1/search/location** - GET (Images & Profiles)

- Chat
  1. Send Message - **api/v1/chat/{id}** - POST
  2. Delete Message - **api/v1/chat/{id}/message/{id}** - DELETE
  3. Reply - **api/v1/chat/{id}/message/{id}/reply** - POST
  4. Get Messages - **api/v1/chat/{id}** - GET
- Notification

  1. Get Notification - **api/v1/notification/{id}** - GET
  2. Delete Notification - **api/v1/notification/{id}** - DELETE

- Promotion
  1. Post Promotion - **api/v1/promotion/{id}/business/{id}** - POST
