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
    public partial class ProgressReport : System.Web.UI.Page
    {
  
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                if (Request.QueryString["ID"] != null)
                {
                    DataTable dt = GetStudentData("spGetStudentHeader", Request.QueryString["ID"]);
                    lblHeader.Text = dt.Rows[0]["StudentName"].ToString();
                    DataTable dtDetails = GetStudentData("spGetStudentDetails", Request.QueryString["ID"]);
                    dvDetails.DataSource = dtDetails;
                    dvDetails.DataBind();
                    DataTable dtEnrols = GetStudentData("spGetStudentEnrolments", Request.QueryString["ID"]);
                    gvEnrols.DataSource = dtEnrols;
                    gvEnrols.DataBind();
                    DataTable dtFunding = GetStudentData("spGetStudentFunding", Request.QueryString["ID"]);
                    gvFunding.DataSource = dtFunding;
                    gvFunding.DataBind();

                    DataTable dtLink = GetStudentData("spGetEnrolmentsLink", Request.QueryString["ID"]);
					hlEnrolments.NavigateUrl = "~/EnrolmentProgressMonitoring.aspx?ID=" + dtLink.Rows[0]["CourseID"].ToString();
					imgStudent.ImageUrl = "~/StudentPhoto.aspx?ID=" + Request.QueryString["ID"];

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
                conn.Close();
                return dt;
            }
        }

       
    }

    
}