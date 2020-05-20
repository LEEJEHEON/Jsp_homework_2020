package homework_Professor;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import homework_DB.DB;



public class professorDAO {
	private static professor getUserFrom(ResultSet resultSet) throws SQLException {
        professor user = new professor();
        user.setId(resultSet.getInt("id"));
        user.setProfessorName(resultSet.getString("professorName"));
        user.setDepartmentId(resultSet.getInt("departmentId"));
        user.setDepartmentName(resultSet.getString("DepartmentName"));
        return user;
    }

	public static List<professor> findAll() throws Exception {
        String sql = "SELECT p.*, d.departmentName" +
                " FROM professor p LEFT JOIN department d ON p.departmentId = d.id";
        try (Connection connection = DB.getConnection("student1");
             PreparedStatement statement = connection.prepareStatement(sql);
             ResultSet resultSet = statement.executeQuery()) {
            ArrayList<professor> list = new ArrayList<>();
            while (resultSet.next())
                list.add(getUserFrom(resultSet));
            return list;
        }
    }

	public static List<professor> findByName(String name) throws Exception {
        String sql = "SELECT p.*, d.departmentName " +
                     "FROM professor p LEFT JOIN department d ON p.departmentId = d.id " +
                     "WHERE professorName LIKE ?";
        try (Connection connection = DB.getConnection("student1");
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, name + "%");
            try (ResultSet resultSet = statement.executeQuery()) {
                ArrayList<professor> list = new ArrayList<professor>();
                while (resultSet.next())
                    list.add(getUserFrom(resultSet));
                return list;
            }
        }
    }

	 public static professor findById(int id) throws Exception {
	        String sql = "SELECT p.*, d.departmentName " +
	                     "FROM professor p LEFT JOIN department d ON p.departmentId = d.id " +
	                     "WHERE p.id = ?";
	        try (Connection connection = DB.getConnection("student1");
	             PreparedStatement statement = connection.prepareStatement(sql)) {
	            statement.setInt(1, id);
	            try (ResultSet resultSet = statement.executeQuery()) {
	                if (resultSet.next())
	                    return getUserFrom(resultSet);
	                else
	                    return null;
	            }
	        }
	    }

	 public static void insert(professor user) throws Exception {
	        String sql = "INSERT professor (id, professorName, departmentId)" +
	                     " VALUES (?, ?, ?)";
	        try (Connection connection = DB.getConnection("student1");
	             PreparedStatement statement = connection.prepareStatement(sql)) {
	            statement.setInt(1, user.getId());
	            statement.setString(2, user.getProfessorName());
	            statement.setInt(3, user.getDepartmentId());
	            statement.executeUpdate();
	        }
	    }

	 public static void update(professor user) throws Exception {
	        String sql = "UPDATE professor SET id=?, professorName=?, departmentId=? " +
	                     " WHERE id = ?";
	        try (Connection connection = DB.getConnection("student1");
	             PreparedStatement statement = connection.prepareStatement(sql)) {
	            statement.setInt(1, user.getId());
	            statement.setString(2, user.getProfessorName());
	            statement.setInt(3, user.getDepartmentId());
	            statement.setInt(5, user.getId());
	            statement.executeUpdate();
	        }
	    }


}
