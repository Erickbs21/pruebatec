using System;
using System.Data;
using System.Data.Common;
using PruebaTecnica.DataAccess;

namespace CrudApp
{
    class Program
    {
        static void Main(string[] args)
        {
            string connectionString = "Server=localhost;Database=CrudDemo;Trusted_Connection=True;TrustServerCertificate=True;";
            DatabaseHelper db = new DatabaseHelper(connectionString);

            try
            {
                while (true)
                {
                    Console.WriteLine("\n--- SISTEMA CRUD DE USUARIOS ---");
                    Console.WriteLine("1. Listar Usuarios");
                    Console.WriteLine("2. Registrar Nuevo Usuario");
                    Console.WriteLine("3. Actualizar Nombre de Usuario");
                    Console.WriteLine("4. Eliminar Usuario");
                    Console.WriteLine("5. Salir");
                    Console.Write("\nSeleccione una opción: ");

                    string opcion = Console.ReadLine() ?? "";

                    switch (opcion)
                    {
                        case "1":
                            ListarUsuarios(db);
                            break;
                        case "2":
                            CrearUsuario(db);
                            break;
                        case "3":
                            ActualizarUsuario(db);
                            break;
                        case "4":
                            EliminarUsuario(db);
                            break;
                        case "5":
                            return;
                        default:
                            Console.WriteLine("Opción inválida, intente de nuevo.");
                            break;
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine($"\nOcurrió un error: {ex.Message}");
                Console.WriteLine("Presione cualquier tecla para continuar...");
                Console.ReadKey();
            }
        }

        static void ListarUsuarios(DatabaseHelper db)
        {
            Console.WriteLine("\n--- LISTADO DE USUARIOS ---");
            DataTable dt = db.ExecuteSelect("SELECT * FROM Usuarios").Tables[0];
            
            if (dt.Rows.Count == 0)
            {
                Console.WriteLine("No se encontraron registros.");
                return;
            }

            foreach (DataRow row in dt.Rows)
            {
                Console.WriteLine($"ID: {row["Id"], -4} | Nombre: {row["Nombre"], -20} | Correo: {row["Correo"]}");
            }
        }

        static void CrearUsuario(DatabaseHelper db)
        {
            Console.WriteLine("\n--- REGISTRO DE USUARIO ---");
            Console.Write("Nombre: ");
            string nombre = Console.ReadLine() ?? "";
            Console.Write("Correo: ");
            string correo = Console.ReadLine() ?? "";

            DbParameter[] parameters = {
                db.CreateParameter("@nombre", nombre),
                db.CreateParameter("@correo", correo)
            };

            db.ExecuteNonQuery("INSERT INTO Usuarios (Nombre, Correo) VALUES (@nombre, @correo)", parameters);
            Console.WriteLine("Usuario registrado con éxito.");
        }

        static void ActualizarUsuario(DatabaseHelper db)
        {
            Console.WriteLine("\n--- ACTUALIZACIÓN DE USUARIO ---");
            Console.Write("ID del usuario a modificar: ");
            if (!int.TryParse(Console.ReadLine(), out int id)) return;
            
            Console.Write("Nuevo Nombre: ");
            string nombre = Console.ReadLine() ?? "";

            DbParameter[] parameters = {
                db.CreateParameter("@nombre", nombre),
                db.CreateParameter("@id", id)
            };

            int rows = db.ExecuteNonQuery("UPDATE Usuarios SET Nombre = @nombre WHERE Id = @id", parameters);
            if (rows > 0)
                Console.WriteLine("Usuario actualizado correctamente.");
            else
                Console.WriteLine("No se encontró ningún usuario con ese ID.");
        }

        static void EliminarUsuario(DatabaseHelper db)
        {
            Console.WriteLine("\n--- ELIMINACIÓN DE USUARIO ---");
            Console.Write("ID del usuario a eliminar: ");
            if (!int.TryParse(Console.ReadLine(), out int id)) return;

            DbParameter[] parameters = {
                db.CreateParameter("@id", id)
            };

            int rows = db.ExecuteNonQuery("DELETE FROM Usuarios WHERE Id = @id", parameters);
            if (rows > 0)
                Console.WriteLine("Usuario eliminado satisfactoriamente.");
            else
                Console.WriteLine("No se pudo eliminar: ID no encontrado.");
        }
    }
}
