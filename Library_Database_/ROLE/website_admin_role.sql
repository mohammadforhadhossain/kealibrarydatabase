GO
CREATE ROLE [website_admin_role]
GO
GO
GRANT EXECUTE ON [dbo].[create_loan_library] TO [website_admin_role]
GO
GO
GRANT SELECT ON [dbo].[BookAuthor] TO [website_admin_role]
GO
GO
GRANT UPDATE ON [dbo].[BookAuthor] TO [website_admin_role]
GO
GO
GRANT EXECUTE ON [dbo].[return_book_to_home_branch] TO [website_admin_role]
GO
GO
GRANT SELECT ON [dbo].[loaned_books_to_put_on_shelf] TO [website_admin_role]
GO
GO
GRANT UPDATE ON [dbo].[loaned_books_to_put_on_shelf] TO [website_admin_role]
GO
GO
GRANT SELECT ON [dbo].[UserInfo] TO [website_admin_role]
GO
GO
GRANT UPDATE ON [dbo].[UserInfo] TO [website_admin_role]
GO
GO
GRANT SELECT ON [dbo].[get_user_fines] TO [website_admin_role]
GO
GO
GRANT SELECT ON [dbo].[Book] TO [website_admin_role]
GO
GO
GRANT UPDATE ON [dbo].[Book] TO [website_admin_role]
GO
GO
GRANT SELECT ON [dbo].[Comments] TO [website_admin_role]
GO
GO
GRANT UPDATE ON [dbo].[Comments] TO [website_admin_role]
GO
GO
GRANT SELECT ON [dbo].[Author] TO [website_admin_role]
GO
GO
GRANT UPDATE ON [dbo].[Author] TO [website_admin_role]
GO
GO
GRANT SELECT ON [dbo].[EmployeeInfo] TO [website_admin_role]
GO
GO
GRANT UPDATE ON [dbo].[EmployeeInfo] TO [website_admin_role]
GO
GO
GRANT SELECT ON [dbo].[ArchivedLoan] TO [website_admin_role]
GO
GO
GRANT UPDATE ON [dbo].[ArchivedLoan] TO [website_admin_role]
GO
GO
GRANT EXECUTE ON [dbo].[extend_loan] TO [website_admin_role]
GO
GO
GRANT EXECUTE ON [dbo].[archiveLoan] TO [website_admin_role]
GO
GO
GRANT EXECUTE ON [dbo].[create_loan_website] TO [website_admin_role]
GO
GO
GRANT EXECUTE ON [dbo].[reserve_book] TO [website_admin_role]
GO
GO
GRANT SELECT ON [dbo].[BookType] TO [website_admin_role]
GO
GO
GRANT UPDATE ON [dbo].[BookType] TO [website_admin_role]
GO
GO
GRANT EXECUTE ON [dbo].[create_loan] TO [website_admin_role]
GO
GO
GRANT EXECUTE ON [dbo].[return_book] TO [website_admin_role]
GO
GO
GRANT SELECT ON [dbo].[Fine] TO [website_admin_role]
GO
GO
GRANT UPDATE ON [dbo].[Fine] TO [website_admin_role]
GO
GO
GRANT SELECT ON [dbo].[Zip] TO [website_admin_role]
GO
GO
GRANT UPDATE ON [dbo].[Zip] TO [website_admin_role]
GO
GO
GRANT SELECT ON [dbo].[Loan] TO [website_admin_role]
GO
GO
GRANT UPDATE ON [dbo].[Loan] TO [website_admin_role]
GO
GO
GRANT EXECUTE ON [dbo].[pay_fine] TO [website_admin_role]
GO
GO
GRANT SELECT ON [dbo].[UserStatus] TO [website_admin_role]
GO
GO
GRANT UPDATE ON [dbo].[UserStatus] TO [website_admin_role]
GO
GO
GRANT SELECT ON [dbo].[ReservationQueue] TO [website_admin_role]
GO
GO
GRANT UPDATE ON [dbo].[ReservationQueue] TO [website_admin_role]
GO
GO
GRANT SELECT ON [dbo].[Branch] TO [website_admin_role]
GO
GO
GRANT UPDATE ON [dbo].[Branch] TO [website_admin_role]
GO
GO
GRANT EXECUTE ON [dbo].[cancel_reservation] TO [website_admin_role]
GO

GO
GRANT SELECT ON [dbo].[BookItem] TO [website_admin_role]
GO
GO
GRANT UPDATE ON [dbo].[BookItem] TO [website_admin_role]
GO
GO
GRANT SELECT ON [dbo].[Addresses] TO [website_admin_role]
GO
GO
GRANT UPDATE ON [dbo].[Addresses] TO [website_admin_role]
GO
GO
GRANT INSERT ON [dbo].[Addresses] TO [website_admin_role]
GO
GO
GRANT INSERT ON [dbo].[ArchivedLoan] TO [website_admin_role]
GO
GO
GRANT INSERT ON [dbo].[Author] TO [website_admin_role]
GO
GO
GRANT INSERT ON [dbo].[Book] TO [website_admin_role]
GO
GO
GRANT INSERT ON [dbo].[BookAuthor] TO [website_admin_role]
GO
GO
GRANT INSERT ON [dbo].[Bookitem] TO [website_admin_role]
GO
GO
GRANT INSERT ON [dbo].[BookType] TO [website_admin_role]
GO
GO
GRANT INSERT ON [dbo].[EmployeeInfo] TO [website_admin_role]
GO
GO
GRANT INSERT ON [dbo].[UserInfo] TO [website_admin_role]
GO
GO
GRANT INSERT ON [dbo].[UserStatus] TO [website_admin_role]
GO
GO
GRANT INSERT ON [dbo].[Zip] TO [website_admin_role]
GO
