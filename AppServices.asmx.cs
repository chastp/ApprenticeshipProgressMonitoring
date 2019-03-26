using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Configuration;


namespace ApprenticeshipProgressMonitoring
{
    /// <summary>
    /// Summary description for AppServices
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class AppServices : System.Web.Services.WebService
    {

        [WebMethod]
        public string HelloWorld()
        {
            return "Hello World";
        }

        [System.Web.Script.Services.ScriptMethod()]
        [System.Web.Services.WebMethod]

        public static List<string> SearchApprenticeships(string prefixText, int count)
        {
            using (SqlConnection conn = new SqlConnection())
            {
                conn.ConnectionString = ConfigurationManager.ConnectionStrings["ApprenticeshipProgressMonitoringConnectionString"].ConnectionString;
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandText = "SELECT  [Framework Or Standard Name] FROM dbo.Framework WHERE[Framework Or Standard Name] LIKE @searchText + '%' ORDER BY 1";
                    cmd.Parameters.AddWithValue("@searchText", prefixText);
                    cmd.Connection = conn;
                    conn.Open();
                    List<string> apprenticeships = new List<string>();
                    using (SqlDataReader sdr = cmd.ExecuteReader())
                    {
                        while (sdr.Read())
                        {
                            apprenticeships.Add(sdr[""].ToString());
                        }
                    }
                    conn.Close();
                    return apprenticeships;

                }
            }
        }
    }
}
