package exam;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import homework_DB.DB;

public class bookDAO {
	private static book getbookFrom(ResultSet resultSet) throws SQLException {
        book book = new book();
        book.setId(resultSet.getInt("id"));
        book.setTitle(resultSet.getString("Title"));
        book.setAuthor(resultSet.getString("Author"));
        book.setcategoryName(resultSet.getString("categoryName"));
        book.setPrice(resultSet.getInt("Price"));
        book.setPublisher(resultSet.getString("Publisher"));
        return book;
    }


	public static List<book> findAll() throws Exception {
        String sql = "SELECT b.*, c.categoryName " +
                     "FROM book b LEFT JOIN category c ON b.categoryId= c.id";
        try (Connection connection = DB.getConnection("book");
             PreparedStatement statement = connection.prepareStatement(sql);
             ResultSet resultSet = statement.executeQuery()) {
            ArrayList<book> list = new ArrayList<book>();
            while (resultSet.next())
                list.add(getbookFrom(resultSet));
            return list;
        }
    }
	public static List<book> findByName(String Author) throws Exception {
        String sql = "SELECT b.*, c.categoryName " +
        			 "FROM book b LEFT JOIN category c ON b.categoryId= c.id" +
                     "WHERE b.Author LIKE ?";
        try (Connection connection = DB.getConnection("book");
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, Author + "%");
            try (ResultSet resultSet = statement.executeQuery()) {
                ArrayList<book> list = new ArrayList<book>();
                while (resultSet.next())
                    list.add(getbookFrom(resultSet));
                return list;
            }
        }
    }


}