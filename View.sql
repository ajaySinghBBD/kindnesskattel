CREATE VIEW UserAnalyticsView AS
SELECT
    u.UserID,
    u.Username,
    u.Email,
    u.ActiveStatus,
    COUNT(DISTINCT fdp.PostID) AS TotalPostsCreated,
    COUNT(DISTINCT c.CommentID) AS TotalCommentsMade,
    COUNT(DISTINCT lt.LikeID) AS TotalLikesGiven,
    AVG(fr.Rating) AS AvgRatingReceived,
    COUNT(DISTINCT fr.FeedbackRatingID) AS TotalFeedbacksReceived,
    COUNT(DISTINCT fr2.FeedbackRatingID) AS TotalRatingsGiven
FROM
    User_Detail u
LEFT JOIN
    FoodDonationPost fdp ON u.UserID = fdp.UserID
LEFT JOIN
    Comment c ON u.UserID = c.UserID
LEFT JOIN
    LikeTable lt ON u.UserID = lt.UserID
LEFT JOIN
    FeedbackRating fr ON u.UserID = fr.RatedUserID
LEFT JOIN
    FeedbackRating fr2 ON u.UserID = fr2.RatingUserID
GROUP BY
    u.UserID, u.Username, u.Email, u.ActiveStatus;
