using System;
using System.Collections.Generic;
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
    public partial class EnrolmentList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
			String sting;
			sting = "Sting";
            if(!IsPostBack)
            {
				if (Request.QueryString["CourseID"] != null)
				{
					DataTable dtLink = GetStudentData("spGetEnrolmentsLink", ddlProgressMonitoringSet.SelectedValue.ToString());
					ddlCourse.SelectedValue = Request.QueryString["CourseID"];
				}                    
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

			protected void gvEnrolments_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "OpenProgressReport")
            {
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ApprenticeshipProgressMonitoringConnectionString"].ConnectionString);
                try
                {
                    SqlCommand cmd = new SqlCommand("spGetProgressMonitoringID", conn)
                    {
                        CommandType = CommandType.StoredProcedure
                    };
                    cmd.Parameters.AddWithValue("EnrolmentID", e.CommandArgument.ToString());
                    cmd.Parameters.AddWithValue("ProgressMonitoringSetID", ddlProgressMonitoringSet.SelectedValue.ToString());
                    var returnParameter = cmd.Parameters.Add("@ProgressMonitoringID", SqlDbType.Int);
                    returnParameter.Direction = ParameterDirection.ReturnValue;
                    //var returnParameterStudentID = cmd.Parameters.Add("@StudentID", SqlDbType.Int);
                    //returnParameterStudentID.Direction = ParameterDirection.ReturnValue;
                    conn.Open();
                    cmd.ExecuteNonQuery();
                    String ProgressMonitoringID = returnParameter.Value.ToString();
                    //String StudentID = returnParameterStudentID.Value.ToString();
                    Response.Redirect("ProgressReport.aspx?ID=" + ProgressMonitoringID); // +"&StudentID=" +StudentID);
                }
                catch (SqlException ex)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "Error", "alert('" + ex.Message + "');", true);
                }
                finally
                {
                    conn.Dispose();
                    conn.Close();
                }
            }
        }
		
		protected void btnEnrolmentProgressMonitoring_Click(object sender, EventArgs e)
		{
			if (ddlCourse.SelectedValue.ToString() != "0")
			{
				Response.Redirect("~/EnrolmentProgressMonitoring?ID=" + ddlCourse.SelectedValue.ToString());
			}
		}

		protected void ddlCourse_SelectedIndexChanged(object sender, EventArgs e)
		{
			if (ddlCourse.SelectedValue.ToString() != "0")
			{
				btnEnrolmentProgressMonitoring.Enabled = true;
				//gvEnrolments.DataBind();
			}
		}
	}
}