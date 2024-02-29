package daos.impl;

import daos.GenericDaoInterface;
import mappers.RowMapperInterface;
import utils.DBContext;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class GenericDao<T> implements GenericDaoInterface<T> {

    @Override
    public List<T> executeQuery(String sql, RowMapperInterface<T> rowMapper, Object... parameters) {
        List<T> results = new ArrayList<>();

        try (Connection connection = DBContext.getConnection()) {
            PreparedStatement statement = connection.prepareStatement(sql);

            setParameter(statement, parameters);

            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                results.add(rowMapper.mapRow(resultSet));
            }
            return results;
        } catch (SQLException ex) {
            return new ArrayList<>();
        }

    }

    private void setParameter(PreparedStatement prepareStatement, Object... parameters) {
        try {
            for (int i = 0; i < parameters.length; i++) {
                Object parameter = parameters[i];
                int index = i + 1;
                if (parameter instanceof Long) {
                    prepareStatement.setLong(index, (Long) parameter);
                } else if (parameter instanceof Double) {
                    prepareStatement.setDouble(index, (Double) parameter);
                } else if (parameter instanceof String) {
                    prepareStatement.setString(index, (String) parameter);
                } else if (parameter instanceof Integer) {
                    prepareStatement.setInt(index, (Integer) parameter);
                } else if(parameter instanceof java.sql.Date) {
                    prepareStatement.setDate(index, (java.sql.Date) parameter);
                } else if (parameter instanceof Timestamp) {
                    prepareStatement.setTimestamp(index, (Timestamp) parameter);
                } else if (parameter instanceof Boolean) {
                    prepareStatement.setBoolean(index, (Boolean) parameter);
                }
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    @Override
    public Integer executeUpdate(String sql, Object... parameters) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        try {
            Integer id = null;
            connection = DBContext.getConnection();
            connection.setAutoCommit(false);

            preparedStatement = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            setParameter(preparedStatement, parameters);

            preparedStatement.executeUpdate();

            resultSet = preparedStatement.getGeneratedKeys();
            if (resultSet.next()) {
                id = resultSet.getInt(1);
            }

            connection.commit();
            return id;
        } catch (SQLException ex) {
            try {
                connection.rollback();
                System.out.println(ex.getMessage());
            } catch (SQLException ex1) {
                ex1.printStackTrace();
            }
        } finally {
            try {
                if (connection != null) {
                    connection.close();
                }
                if (preparedStatement != null) {
                    preparedStatement.close();
                }
            } catch (SQLException ex2) {
                ex2.printStackTrace();
            }
        }
        return null;
    }


    @Override
    public int count(String sql, Object... parameters) {
        try (Connection connection = DBContext.getConnection()) {
            int count = 0;

            PreparedStatement statement = connection.prepareStatement(sql);
            setParameter(statement, parameters);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                count = resultSet.getInt(1);
            }
            return count;
        } catch (SQLException ex) {
            return 0;
        }
    }
}
