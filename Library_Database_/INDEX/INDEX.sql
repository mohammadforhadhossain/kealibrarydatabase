CREATE NONCLUSTERED INDEX book_search_index ON Book(PublishYear,IsbnNO,Language, BookTypeID);
CREATE CLUSTERED INDEX book_search_by_name_index ON Book(Name);