GO
CREATE ROLE [library_scanner_role]
GO

GO
GRANT EXECUTE ON [dbo].[create_loan_library] TO [library_scanner_role]
GO
GO
GRANT EXECUTE ON [dbo].[return_book] TO [library_scanner_role]
GO
GO
GRANT EXECUTE ON [dbo].[return_book_to_home_branch] TO [library_scanner_role]
GO