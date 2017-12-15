GO
CREATE ROLE [website_visitor_role]
GO

GO
GRANT SELECT ON [dbo].[Book] TO [website_visitor_role]
GO

GO
GRANT SELECT ON [dbo].[BookType] TO [website_visitor_role]
GO

GO
GRANT SELECT ON [dbo].[BookAuthor] TO [website_visitor_role]
GO

GO
GRANT SELECT ON [dbo].[BookItem] TO [website_visitor_role]
GO

