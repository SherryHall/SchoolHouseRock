using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;

namespace SchoolHouseRock
{
	class Program
	{
		static void ListCourses()
		{
			var connectionStrings = @"Server=localhost\SQLEXPRESS;Database=DotNetU;Trusted_Connection=True;";
			using (var connection = new SqlConnection(connectionStrings))
			{
				using (var cmd = new SqlCommand())
				{
					cmd.Connection = connection;
					cmd.CommandType = System.Data.CommandType.Text;
					cmd.CommandText = @"SELECT Course.CourseNum, Course.CourseTitle, Instructor.Name " +
									  "FROM Course " +
									  "JOIN Instructor ON Instructor.Id = Course.Instructor_Id ";
					connection.Open();
					var reader = cmd.ExecuteReader();
					while (reader.Read())
					{
						var courseNum = (int) reader[0];
						var courseTitle = reader[1] as string;
						var instructor = reader[2] as string;
						Console.WriteLine($"Course: {courseNum} {courseTitle};  Taught by {instructor}");
					}
					connection.Close();
				}

			}
		}

		static void ShowCounts()
		{
			var connectionStrings = @"Server=localhost\SQLEXPRESS;Database=DotNetU;Trusted_Connection=True;";
			using (var connection = new SqlConnection(connectionStrings))
			{
				using (var cmd = new SqlCommand())
				{
					cmd.Connection = connection;
					cmd.CommandType = System.Data.CommandType.Text;

					// Display Number of Courses
					cmd.CommandText = @"SELECT COUNT(Course.Id) " +
									  "FROM Course";
					connection.Open();
					var count = (int)cmd.ExecuteScalar();
					Console.WriteLine($"There are {count} courses offered this year");

					// Display Number of Instructors
					cmd.CommandText = @"SELECT COUNT(Instructor.Id) " +
				  "FROM Instructor";
					count = (int)cmd.ExecuteScalar();
					Console.WriteLine($"DotNetU has {count} instructors");

					connection.Close();
				}
			}
		}
		static void Main(string[] args)
		{
			ListCourses();
			ShowCounts();
			Console.ReadLine();
		}
	}
}
