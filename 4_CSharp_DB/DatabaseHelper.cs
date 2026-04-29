using System;
using System.Data;
using System.Data.Common;

namespace PruebaTecnica.DataAccess
{
    public class DatabaseHelper
    {
        private readonly string _connectionString;
        private readonly DbProviderFactory _providerFactory;

        public DatabaseHelper(string connectionString, string providerName = "System.Data.SqlClient")
        {
            if (string.IsNullOrWhiteSpace(connectionString))
                throw new ArgumentNullException(nameof(connectionString));

            _connectionString = connectionString;
            
            #if NETCOREAPP
            DbProviderFactories.RegisterFactory("System.Data.SqlClient", System.Data.SqlClient.SqlClientFactory.Instance);
            #endif

            _providerFactory = DbProviderFactories.GetFactory(providerName);
        }

        public DataSet ExecuteSelect(string query, DbParameter[] parameters = null)
        {
            using (DbConnection connection = _providerFactory.CreateConnection())
            {
                connection.ConnectionString = _connectionString;
                
                using (DbCommand command = connection.CreateCommand())
                {
                    command.CommandText = query;
                    command.CommandType = CommandType.Text;

                    if (parameters != null)
                        command.Parameters.AddRange(parameters);

                    using (DbDataAdapter adapter = _providerFactory.CreateDataAdapter())
                    {
                        adapter.SelectCommand = command;
                        DataSet dataSet = new DataSet();
                        adapter.Fill(dataSet);
                        return dataSet;
                    }
                }
            }
        }

        public int ExecuteNonQuery(string query, DbParameter[] parameters = null)
        {
            using (DbConnection connection = _providerFactory.CreateConnection())
            {
                connection.ConnectionString = _connectionString;
                
                using (DbCommand command = connection.CreateCommand())
                {
                    command.CommandText = query;
                    command.CommandType = CommandType.Text;

                    if (parameters != null)
                        command.Parameters.AddRange(parameters);

                    connection.Open();
                    return command.ExecuteNonQuery();
                }
            }
        }

        public int GetSelectRowCount(string selectQuery, DbParameter[] parameters = null)
        {
            string countQuery = $"SELECT COUNT(1) FROM ({selectQuery}) AS CountWrapperSubquery";

            using (DbConnection connection = _providerFactory.CreateConnection())
            {
                connection.ConnectionString = _connectionString;
                
                using (DbCommand command = connection.CreateCommand())
                {
                    command.CommandText = countQuery;
                    command.CommandType = CommandType.Text;

                    if (parameters != null)
                        command.Parameters.AddRange(parameters);

                    connection.Open();
                    object result = command.ExecuteScalar();
                    return Convert.ToInt32(result);
                }
            }
        }

        public DbParameter CreateParameter(string name, object value)
        {
            DbParameter parameter = _providerFactory.CreateParameter();
            parameter.ParameterName = name;
            parameter.Value = value ?? DBNull.Value;
            return parameter;
        }
    }
}
