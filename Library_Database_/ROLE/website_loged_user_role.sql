GO
CREATE ROLE [website_loged_user_role]
GO

GO
GRANT EXECUTE ON [dbo].[cancel_reservation] TO [website_loged_user_role]
GO

GO
GRANT EXECUTE ON [dbo].[extend_loan] TO [website_loged_user_role]
GO

GO
GRANT SELECT ON [dbo].[Branch] TO [website_loged_user_role]
GO

GO
GRANT SELECT ON [dbo].[Author] TO [website_loged_user_role]
GO

GO
GRANT SELECT ON [dbo].[ArchivedLoan] TO [website_loged_user_role]
GO

GO
GRANT SELECT ON [dbo].[BookAuthor] TO [website_loged_user_role]
GO

GO
GRANT SELECT ON [dbo].[Fine] TO [website_loged_user_role]
GO

GO
GRANT SELECT ON [dbo].[BookItem] TO [website_loged_user_role]
GO

GO
GRANT SELECT ON [dbo].[UserStatus] TO [website_loged_user_role]
GO

GO
GRANT SELECT ON [dbo].[Book] TO [website_loged_user_role]
GO

GO
GRANT SELECT ON [dbo].[Zip] TO [website_loged_user_role]
GO

GO
GRANT SELECT ON [dbo].[ReservationQueue] TO [website_loged_user_role]
GO

GO
GRANT EXECUTE ON [dbo].[create_loan_website] TO [website_loged_user_role]
GO

GO
GRANT EXECUTE ON [dbo].[archiveLoan] TO [website_loged_user_role]
GO

GO
GRANT EXECUTE ON [dbo].[reserve_book] TO [website_loged_user_role]
GO

GO
GRANT SELECT ON [dbo].[Addresses] TO [website_loged_user_role]
GO

GO
GRANT SELECT ON [dbo].[Comments] TO [website_loged_user_role]
GO

GO
GRANT SELECT ON [dbo].[UserInfo] TO [website_loged_user_role]
GO

GO
GRANT SELECT ON [dbo].[Loan] TO [website_loged_user_role]
GO

GO
GRANT SELECT ON [dbo].[BookType] TO [website_loged_user_role]
GO

GO
--GRANT SELECT ON [dbo].[get_user_fines] TO [website_loged_user_role]
GO

