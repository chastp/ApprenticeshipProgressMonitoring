using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace ApprenticeshipProgressMonitoring
{
	public partial class EnrolmentProgressMonitoring : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{

		}

		protected void Populate_ProgressMonitoring()
		{
			SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ApprenticeshipProgressMonitoringConnectionString"].ConnectionString);
			DataTable dt = new DataTable();
			try
			{
				SqlCommand cmd = new SqlCommand("spGetProgressMonitoringID", conn)
				{
					CommandType = CommandType.StoredProcedure
				};
				cmd.Parameters.AddWithValue("EnrolmentID", gvEnrols.SelectedValue.ToString());
				cmd.Parameters.AddWithValue("ProgressMonitoringSetID", ddlProgressMonitoringSet.SelectedValue.ToString());
				var returnParameter = cmd.Parameters.Add("@ProgressMonitoringID", SqlDbType.Int);
				returnParameter.Direction = ParameterDirection.ReturnValue;
				conn.Open();
				cmd.ExecuteNonQuery();
				String ProgressMonitoringID = returnParameter.Value.ToString();
				cmd.CommandText = "SELECT * FROM [ProgressMonitoring] WHERE ([Progress Monitoring ID] = @Progress_Monitoring_ID)";
				cmd.CommandType = CommandType.Text;
				cmd.Parameters.AddWithValue("@Progress_Monitoring_ID", ProgressMonitoringID);
				SqlDataAdapter sda = new SqlDataAdapter();
				sda.SelectCommand = cmd;
				sda.Fill(dt);
				dvDetails.DataSource = dt;
				dvDetails.DataBind();
				hlStudent.Enabled = true;
				hlStudent.NavigateUrl = "~/ProgressReport?ID=" +ProgressMonitoringID;
			}
			catch
			{
				dt = null;
			}
			finally
			{
				conn.Dispose();
			}
		}



		public DataTable GetStudentData(string storedProcedure, string ProgressMonitoringID)
		{
			DataTable dt = new DataTable();
			SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ApprenticeshipProgressMonitoringConnectionString"].ConnectionString);
			SqlCommand cmd = new SqlCommand(storedProcedure, conn)
			{
				CommandType = CommandType.StoredProcedure
			};
			conn.Open();
			cmd.Parameters.AddWithValue("@ProgressMonitoringID", ProgressMonitoringID);
			using (SqlDataReader sdr = cmd.ExecuteReader())
			{
				dt.Load(sdr);
				return dt;
			}
		}
		protected void gvEnrols_SelectedIndexChanged(object sender, EventArgs e)
		{
			Populate_ProgressMonitoring();

			foreach (GridViewRow row in gvEnrols.Rows)
			{
				if (row.RowIndex == gvEnrols.SelectedIndex)
				{
					row.BackColor = ColorTranslator.FromHtml("#C7E9F7");
				}
				else
				{
					row.BackColor = ColorTranslator.FromHtml("#FFFFFF");
				}
			}
		}

		protected void ddlProgressMonitoringSet_SelectedIndexChanged(object sender, EventArgs e)
		{
			Populate_ProgressMonitoring();
		}

	}
}