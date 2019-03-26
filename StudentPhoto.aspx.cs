using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace ApprenticeshipProgressMonitoring
{
	public partial class StudentPhoto : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			if (Request.QueryString["ID"] != null)
			{
				SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ApprenticeshipProgressMonitoringConnectionString"].ConnectionString);
				SqlCommand cmd = new SqlCommand("spGetStudentPhoto", conn);
				cmd.CommandType = CommandType.StoredProcedure;
				cmd.Parameters.AddWithValue("@ProgressMonitoringID", Request.QueryString["ID"]);
				SqlDataAdapter sda = new SqlDataAdapter();
				DataTable dt = new DataTable();
				try
				{
					conn.Open();
					sda.SelectCommand = cmd;
					sda.Fill(dt);
				}
				catch
				{
					dt = null;
				}
				finally
				{
					conn.Close();
					sda.Dispose();
					conn.Dispose();
				}
				if (dt != null)
				{
					if (dt.Rows.Count > 0)
					{
						Byte[] bytes = (Byte[])dt.Rows[0]["StudentPhoto"];
						Response.Buffer = true;
						Response.Charset = "";
						Response.Cache.SetCacheability(HttpCacheability.NoCache);
						Response.ContentType = "image/jpg";
						Response.AddHeader("content-disposition", "attachment;filename=" + dt.Rows[0]["StudentID"].ToString() + ".jpg");
						Response.BinaryWrite(bytes);
						Response.Flush();
						Response.End();
					}
				}
					
			}
		}
	}
}