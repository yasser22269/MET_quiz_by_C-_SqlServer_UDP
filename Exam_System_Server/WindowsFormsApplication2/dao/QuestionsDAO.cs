using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using WindowsFormsApplication2.database;
using WindowsFormsApplication2.Models;

namespace WindowsFormsApplication2.dao
{
    class QuestionsDAO
    {
        DbManager db;

        public QuestionsDAO()
        {
            this.db = new DbManager();
        }

        public List<Questions> getListOfQuestions(string examNumber)
        {
            
            List <Questions> list = new List<Questions>();
            try
            {
                Questions questions = new Questions();
                String sqlCommand = "select q_body, ob_a, ob_b, ob_c, ob_d, answer from Questions where exam_id =" + examNumber.ToString();
                db.command.CommandText = sqlCommand;

                db.connection.Open();
                SqlDataReader reader = db.command.ExecuteReader();
                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        questions = new Questions(
                            reader.GetString(0),
                            reader.GetString(1),
                            reader.GetString(2),
                            reader.GetString(3),
                            reader.GetString(4),
                            reader.GetString(5)
                            );
                        list.Add(questions);
                    }
                }
                return list;
            }
            catch
            {

            }
            finally
            {
                db.connection.Close();
            }
            return list;
        }

    }
}
