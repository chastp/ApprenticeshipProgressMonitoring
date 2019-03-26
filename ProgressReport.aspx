<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProgressReport.aspx.cs" Inherits="ApprenticeshipProgressMonitoring.ProgressReport" %>

<script runat="server">
    int btnprev = 0;
    int btnnext = 0;
    protected void dvProgressMonitoring_PageIndexChanging(object sender, DetailsViewPageEventArgs e)
    {

    }
    protected void btnSaveProgMon_Click(object sender, EventArgs e)
    {

        System.Data.SqlClient.SqlConnection conn = new  System.Data.SqlClient.SqlConnection(ConfigurationManager.ConnectionStrings["ApprenticeshipProgressMonitoringConnectionString"].ConnectionString);
        System.Data.SqlClient.SqlCommand cmd = new System.Data.SqlClient.SqlCommand("spUpdateProgressMonitoring", conn);
        cmd.CommandType = System.Data.CommandType.StoredProcedure;
        Button btnSave = (Button)sender;
        DetailsView dv = (DetailsView)btnSave.NamingContainer;
        //Will Retain
        CheckBox cbWillRetain = (CheckBox)dv.FindControl("cbWillRetain");
        cmd.Parameters.AddWithValue("@WillRetain", cbWillRetain.Checked);
        //Will Pass
        CheckBox cbWillPass = (CheckBox)dv.FindControl("cbWillPass");
        cmd.Parameters.AddWithValue("@WillPass", cbWillPass.Checked);
        //Predicted Pass Year
        DropDownList ddlPredictedPassYear = (DropDownList)dv.FindControl("ddlPredictedPassYear");
        cmd.Parameters.AddWithValue("@PredictedPassYear", ddlPredictedPassYear.SelectedValue);
        //Competency
        DropDownList ddlCompetency = (DropDownList)dv.FindControl("ddlCompetency");
        cmd.Parameters.AddWithValue("@Competency", ddlCompetency.SelectedValue);
        //Knowledge
        DropDownList ddlKnowloedge = (DropDownList)dv.FindControl("ddlKnowledge");
        cmd.Parameters.AddWithValue("@Knoweldge", ddlKnowloedge.SelectedValue);
        //Employer Rights and Responsibilities
        DropDownList ddlEmployerRightsAndResponsibilities = (DropDownList)dv.FindControl("ddlEmployerRightsAndResponsibilities");
        cmd.Parameters.AddWithValue("@EmployerRightsandResponsibilities", ddlEmployerRightsAndResponsibilities.SelectedValue);
        //PLTS
        DropDownList ddlPLTS = (DropDownList)dv.FindControl("ddlPLTS");
        cmd.Parameters.AddWithValue("@PLTS", ddlPLTS.SelectedValue);
        //English and Maths
        DropDownList ddlEnglishAndMaths = (DropDownList)dv.FindControl("ddlEnglishAndMaths");
        cmd.Parameters.AddWithValue("@EnglishandMaths", ddlEnglishAndMaths.SelectedValue);
        //ICT
        DropDownList ddlICT = (DropDownList)dv.FindControl("ddlICT");
        cmd.Parameters.AddWithValue("@ICT", ddlICT.SelectedValue);
        //Behavious Issues
        CheckBox cbBehaviourIssues = (CheckBox)dv.FindControl("cbBehaviourIssues");
        cmd.Parameters.AddWithValue("@BehaviourIssues", cbBehaviourIssues.Checked);
        //Assessor Visits
        TextBox tbAssessorVisits = (TextBox)dv.FindControl("tbAssessorVisits");
        cmd.Parameters.AddWithValue("@AssessorVisits", tbAssessorVisits.Text);
        //Review Visits
        TextBox tbReviewVisits = (TextBox)dv.FindControl("tbReviewVisits");
        cmd.Parameters.AddWithValue("@ReviewVisits", tbReviewVisits.Text);
        //Awarding Body
        CheckBox cbRegisteredWithAwardingBody = (CheckBox)dv.FindControl("cbRegisteredWithAwardingBody");
        cmd.Parameters.AddWithValue("@RegisteredWithAwardingBody", cbRegisteredWithAwardingBody.Checked);
        //Timely
        CheckBox cbTimely = (CheckBox)dv.FindControl("cbTimely");
        cmd.Parameters.AddWithValue("@Timely", cbTimely.Checked);
        //Additional 20%
        CheckBox cbAdditionalTwentyPercentTraining = (CheckBox)dv.FindControl("cbAdditionalTwentyPercentTraining");
        cmd.Parameters.AddWithValue("@AdditionalTwentyPercentTraining", cbAdditionalTwentyPercentTraining.Checked);
        //ALS Capture
        CheckBox cbALSCapture = (CheckBox)dv.FindControl("cbALSCapture");
        cmd.Parameters.AddWithValue("@ALSCapture", cbALSCapture.Checked);
        //ALS Support Need
        CheckBox cbALSSupportNeed = (CheckBox)dv.FindControl("cbALSSupportNeed");
        cmd.Parameters.AddWithValue("@ALSSupportNeed", cbALSSupportNeed.Checked);
        //Learner Feedback
        DropDownList ddlLearnerFeedback = (DropDownList)dv.FindControl("ddlLearnerFeedback");
        cmd.Parameters.AddWithValue("@LearnerFeedback", ddlLearnerFeedback.SelectedValue);
        //Employer Feedback
        DropDownList ddlEmployerFeedback = (DropDownList)dv.FindControl("ddlEmployerFeedback");
        cmd.Parameters.AddWithValue("@EmployerFeedback", ddlEmployerFeedback.SelectedValue);
        //RAG Rating 
        DropDownList ddlRAGRating = (DropDownList)dv.FindControl("ddlRAGRating");
        cmd.Parameters.AddWithValue("@RAGRating", ddlRAGRating.SelectedValue);
        //Progress Monitoring ID
        HiddenField hfProgressMonitoringID = (HiddenField)dv.FindControl("hfProgressMonitoringID");
        cmd.Parameters.AddWithValue("@ProgressMontioringID", hfProgressMonitoringID.Value);
        //Notes
        TextBox tbNotes = (TextBox)dv.FindControl("tbNotes");
        cmd.Parameters.AddWithValue("@Notes", tbNotes.Text);
        //BelowMLP
        CheckBox cbBelowMLP = (CheckBox)dv.FindControl("cbBelowMLP");
        cmd.Parameters.AddWithValue("@BelowMLP", cbBelowMLP.Checked);
        //English
        DropDownList ddlEnglish = (DropDownList)dv.FindControl("ddlEnglish");
        cmd.Parameters.AddWithValue("@english", ddlEnglish.SelectedValue);
        //Maths
        DropDownList ddlMaths = (DropDownList)dv.FindControl("ddlMaths");
        cmd.Parameters.AddWithValue("@Maths", ddlMaths.SelectedValue);
        //AssessorInduction
        CheckBox cbAssessorInduction = (CheckBox)dv.FindControl("cbAssessorInduction");
        cmd.Parameters.AddWithValue("@AssessorInduction", cbAssessorInduction.Checked);
        //AssessorPercentComplete
        TextBox tbAssessorPercentComplete = (TextBox)dv.FindControl("tbAssessorPercentComplete");
        cmd.Parameters.AddWithValue("@AssessorPercentComplete",  tbAssessorPercentComplete.Text);
        //TargetAssessorVisits
        TextBox  tbTargetAssessorVisits = (TextBox)dv.FindControl("tbTargetAssessorVisits");
        cmd.Parameters.AddWithValue("@TargetAssessorVisits",   tbTargetAssessorVisits.Text);
        //User
        cmd.Parameters.AddWithValue("@UpdateBy", User.Identity.Name.ToString());
        //Behavious
        DropDownList ddlBehaviour = (DropDownList)dv.FindControl("tbBehaviour");
        cmd.Parameters.AddWithValue("@BehaviourDropdown", ddlBehaviour.SelectedValue);
         cmd.Parameters.AddWithValue("@Behaviour", "");
        //Action PM 1
        TextBox tbActionPM1 = (TextBox)dv.FindControl("tbActionPM1");
        cmd.Parameters.AddWithValue("@ActionPM1", tbActionPM1.Text);
        //Action PM 2
        TextBox  tbActionPM2 = (TextBox)dv.FindControl("tbActionPM2");
        cmd.Parameters.AddWithValue("@ActionPM2", tbActionPM2.Text);
        //Action PM 3
        TextBox  tbActionPM3 = (TextBox)dv.FindControl("tbActionPM3");
        cmd.Parameters.AddWithValue("@ActionPM3", tbActionPM3.Text);

        enable_next_button();

        try
        {
            conn.Open();
            cmd.ExecuteNonQuery();
            enable_next_button();
            lblMessage.Text = "<strong>Success!</strong>Record Saved";
            lblMessage.CssClass = "alert alert-success";
        }
        catch(Exception ex)
        {
            lblMessage.Text = ex.Message;
        }
        finally
        {
            conn.Dispose();
            conn.Close();
        }
    }

    public void enable_next_button()
    {
        if (btnPrev.Visible == true)
        {
            if (btnPrev.Enabled == false)
            {
                btnPrev.Enabled = true;
                btnprev = 1;
            }
        }

        if (btnNext.Visible == true)
        {
            if (btnNext.Enabled == false)
            {
                btnNext.Enabled = true;
                btnnext = 1;
            }
        }
    }
    protected void unenable_next(object sender, EventArgs e)
    {
        if (btnPrev.Visible == true)
        {
            if (btnPrev.Enabled == true)
            {
                btnPrev.Enabled = false;
                btnprev = 1;
            }
        }

        if (btnNext.Visible == true)
        {
            if (btnNext.Enabled == true)
            {
                btnNext.Enabled = false;
                btnnext = 1;
            }
        }
    }

    protected void unenable_next1(object sender, EventArgs e)
    {
        lblMessage.Text = "Entering unenable_next";
        if (btnPrev.Visible == true)
        {
            if (btnPrev.Enabled == true)
            {
                btnPrev.Enabled = false;
                btnprev = 1;
            }
        }

        if (btnNext.Visible == true)
        {
            if (btnNext.Enabled == true)
            {
                btnNext.Enabled = false;
                btnnext = 1;
            }
        }
    }

</script>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:UpdatePanel runat="server" ID="upPannel">
		<ContentTemplate>
			<div class="row">
				<div class="col-md-12">
					<hr />
					<div class="jumbotron" style="margin-left: auto; margin-right: auto; text-align: center;">
							<h2><asp:Label runat="server" ID="lblHeader" Width="100%" ></asp:Label></h2>
	
					</div>
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><asp:HyperLink runat="server" ID="hlHome" Text="Home" NavigateUrl="~/Default.aspx"></asp:HyperLink></li>
						<li class="breadcrumb-item"><asp:HyperLink runat="server" ID="hlArea" Text="Area"></asp:HyperLink></li>
						<li class="breadcrumb-item"><asp:HyperLink runat="server" ID="hlTeam" Text="Team"></asp:HyperLink></li>
						<li class="breadcrumb-item"><asp:HyperLink runat="server" ID="hlEnrolments" Text="Course"></asp:HyperLink></li>
						<li class="breadcrumb-item active"><asp:Label runat="server" ID="lblStudent"></asp:Label></li>
					</ol>
				</div>
			</div>
			<div class="row">
				<div class="col-md-6">
					<div class="panel panel-default">
						<div class="panel panel-heading">
							<h4>Student Details</h4>
						</div>
						<div class="panel-body">
							<div class="col-md-4 col-sm-12">
								<asp:Image runat="server" ID="imgStudent" Width="220px" Height="220px" class="img-responsive" />
							</div>
							<div class="col-md-7">
								<asp:DetailsView runat="server" ID="dvDetails" AutoGenerateRows="true" CssClass="table table-hover" GridLines="None"></asp:DetailsView>
							</div>
						</div>
					</div>
					<div class="panel panel-default">
						<div class="panel panel-heading">
							<h4>Enrolments (18/19)</h4>
						</div>
						<div class="panel-body">
							<asp:GridView runat="server" ID="gvEnrols" CssClass="table table-hover" AutoGenerateColumns="true" GridLines="None">
							</asp:GridView>
						</div>
					</div>
					<div class="panel panel-default">
						<div class="panel panel-heading">
							<h4>Funding</h4>
						</div>
						<div class="panel-body">
							<asp:GridView runat="server" ID="gvFunding" CssClass="table table-hover" AutoGenerateColumns="true" GridLines="None">
							</asp:GridView>
						</div>
					</div>
				</div>

				<div class="col-md-6">
					<div class="panel panel-primary">
						<div class="panel-heading">
							<h4><asp:Label runat="server" ID="lblSetName"></asp:Label></h4>
						</div>
						<div class="panel-body">
							<asp:DetailsView runat="server" ID="dvProgressMonitoring" AutoGenerateRows="False" DataKeyNames="Progress Monitoring ID" DataSourceID="sqlProgressReport"
								DefaultMode="Edit" GridLines="None" CssClass="table table-striped" ValidateRequestMode="Disabled" >
								<Fields>
									<asp:TemplateField ShowHeader="False">
										<EditItemTemplate>
											<div class="row">
												<div class="col-md-12" style="text-align:right">
													Hover mouse over <span class="glyphicon glyphicon glyphicon-info-sign text-info"></span> to see previous round value
												</div>
												
											</div>
										</EditItemTemplate>

									</asp:TemplateField>
									
									
									
									<asp:BoundField DataField="Progress Monitoring ID" HeaderText="Progress Monitoring ID" InsertVisible="False" ReadOnly="True" SortExpression="Progress Monitoring ID" Visible="False" />
									<asp:BoundField DataField="Enrolment ID" HeaderText="Enrolment ID" SortExpression="Enrolment ID" Visible="false" />
									<asp:BoundField DataField="Progress Monitoring Set ID" HeaderText="Progress Monitoring Set ID" SortExpression="Progress Monitoring Set ID" Visible="false" />
									
									
									<asp:TemplateField HeaderText="Competency/Skills" ValidateRequestMode="Disabled" >
										<EditItemTemplate>
											<div class="row">
												<div class="col-md-10">
											<asp:DropDownList runat="server" ID="ddlCompetency" DataSourceID="sqlAssessmentLookup"  OnSelectedIndexChanged="unenable_next" AutoPostBack =" true"  ToolTip='<%# Eval("[Previous Competency]") %>'
												DataTextField="Full Title"  DataValueField ="Lookup Value ID" SelectedValue='<%# Bind("Competency") %>' CssClass="form-control input-sm"  > 
											</asp:DropDownList>
													</div> 
												<div class="col-md-2">
											<asp:HiddenField runat="server" ID="hfProgressMonitoringID" Value='<%# Eval("Progress Monitoring ID") %>' />
													<asp:Label runat="server" Font-Size="Larger" CssClass="glyphicon glyphicon glyphicon-info-sign text-info" ToolTip='<%# Eval("[Previous Competency]") %>' Width="100%" />
													</div>
													</div>


										</EditItemTemplate>
									</asp:TemplateField>

									<asp:TemplateField HeaderText="Knowledge">
										<EditItemTemplate>
											<div class="row">
												<div class="col-md-10">
											<asp:DropDownList runat="server" ID="ddlKnowledge"  OnSelectedIndexChanged  ="unenable_next" DataSourceID="sqlAssessmentLookup" AutoPostBack =" true"  ToolTip='<%# Eval("[Previous Knowledge]") %>'
												DataTextField="Full Title" DataValueField="Lookup Value ID" SelectedValue='<%# Bind("Knoweldge") %>' CssClass="form-control input-sm">
											</asp:DropDownList>

											</div>
												<div class="col-md-2">
													<asp:Label runat="server" Font-Size="Larger" CssClass="glyphicon glyphicon glyphicon-info-sign text-info" ToolTip='<%# Eval("[Previous Knowledge]") %>' Width="100%" />
													</div>
													</div>
										</EditItemTemplate>
									</asp:TemplateField>


									<asp:TemplateField HeaderText="Employer Rights and Responsibilities">
										<EditItemTemplate>
											<div class="row">
												<div class="col-md-10">
											<asp:DropDownList runat="server" ID="ddlEmployerRightsAndResponsibilities"  OnSelectedIndexChanged ="unenable_next" DataSourceID="sqlAssessmentLookup" AutoPostBack =" true"  ToolTip='<%# Eval("[Previous Employer Rights and Responsibilities]") %>'
												DataTextField="Full Title" DataValueField="Lookup Value ID" SelectedValue='<%# Bind("[Employer Rights and Responsibilities]") %>' CssClass="form-control input-sm">
											</asp:DropDownList>
													</div>
												<div class="col-md-2">
													<asp:Label runat="server" Font-Size="Larger" CssClass="glyphicon glyphicon glyphicon-info-sign text-info" ToolTip='<%# Eval("[Previous Employer Rights and Responsibilities]") %>' Width="100%" />
													</div>
													</div>
										</EditItemTemplate>
									</asp:TemplateField>

                  						<asp:TemplateField HeaderText="Behaviour">
										<ItemTemplate>
											<div class="row">
												<div class="col-md-10">
                                           					<asp:DropDownList runat="server" ID="tbBehaviour" DataSourceID="sqlAssessmentLookup"  OnSelectedIndexChanged="unenable_next" AutoPostBack =" true"  ToolTip='<%# Eval("[Previous Behaviour]") %>'
									                    			DataTextField="Full Title"  DataValueField ="Lookup Value ID" SelectedValue='<%# Bind("Behaviourdropdown") %>' CssClass="form-control input-sm"  > 
										                	</asp:DropDownList>
          														</div>
													</div>
										</ItemTemplate>
									</asp:TemplateField>

									<asp:TemplateField HeaderText="Behaviour Issues">
										<ItemTemplate>
											<div class="row">
												<div class="col-md-10">
											<asp:CheckBox runat="server" ID="cbBehaviourIssues"  OnCheckedChanged="unenable_next" AutoPostBack =" true"   Checked ='<%# Eval("Behaviour Issues") == DBNull.Value ? false : Eval("Behaviour Issues") %>'  ToolTip='<%# Eval("[Previous Behaviour Issues]") %>'/> 
														</div>
												<div class="col-md-2">
													<asp:Label runat="server" Font-Size="Larger" CssClass="glyphicon glyphicon glyphicon-info-sign text-info" ToolTip='<%# Eval("[Previous Behaviour Issues]") %>' Width="100%" />
													</div>
													</div>
										</ItemTemplate>
									</asp:TemplateField>
								
									<asp:TemplateField HeaderText="PLTS">
										<EditItemTemplate>
											<div class="row">
												<div class="col-md-10">
											<asp:DropDownList runat="server" ID="ddlPLTS" DataSourceID="sqlAssessmentLookup" OnSelectedIndexChanged  = "unenable_next" AutoPostBack =" true"  ToolTip='<%# Eval("[Previous Employer Rights and Responsibilities]") %>'
												DataTextField="Full Title" DataValueField="Lookup Value ID" SelectedValue='<%# Bind("PLTS") %>' CssClass="form-control input-sm">
											</asp:DropDownList>
												</div>
												<div class="col-md-2">
													<asp:Label runat="server" Font-Size="Larger" CssClass="glyphicon glyphicon glyphicon-info-sign text-info" ToolTip='<%# Eval("[Previous Employer Rights and Responsibilities]") %>' Width="100%" />
													</div>
													</div>
										</EditItemTemplate>
									</asp:TemplateField>

									<asp:TemplateField HeaderText="English and Maths" Visible="false">
										<EditItemTemplate>
											
											<asp:DropDownList runat="server" ID="ddlEnglishAndMaths" DataSourceID="sqlAssessmentLookup" OnSelectedIndexChanged="unenable_next" AutoPostBack =" true" 
												DataTextField="Full Title" DataValueField="Lookup Value ID" SelectedValue='<%# Bind("[English and Maths]") %>' CssClass="form-control input-sm">
											</asp:DropDownList>
												

										</EditItemTemplate>
									</asp:TemplateField>


									<asp:TemplateField HeaderText="Maths">
										<EditItemTemplate>
											<div class="row">
												<div class="col-md-10">
											<asp:DropDownList runat="server" ID="ddlMaths" DataSourceID="sqlMathsEnglishLookup" OnSelectedIndexChanged="unenable_next" AutoPostBack =" true"  ToolTip='<%# Eval("[Previous Maths]") %>'
												DataTextField="Full Title" DataValueField="Lookup Value ID" SelectedValue='<%# Bind("[Maths]") %>' CssClass="form-control input-sm">
											</asp:DropDownList>
											</div>
												<div class="col-md-2">
													<asp:Label runat="server" Font-Size="Larger" CssClass="glyphicon glyphicon glyphicon-info-sign text-info" ToolTip='<%# Eval("[Previous Maths]") %>' Width="100%" />
													</div>
													</div>

										</EditItemTemplate>
									</asp:TemplateField>


									<asp:TemplateField HeaderText="English">
										<EditItemTemplate>
													<div class="row">
												<div class="col-md-10">
											<asp:DropDownList runat="server" ID="ddlEnglish" DataSourceID="sqlMathsEnglishLookup"  OnSelectedIndexChanged="unenable_next" AutoPostBack =" true" ToolTip='<%# Eval("[Previous English]") %>'
												DataTextField="Full Title" DataValueField="Lookup Value ID" SelectedValue='<%# Bind("[English]") %>' CssClass="form-control input-sm">
											</asp:DropDownList>
													</div>
												<div class="col-md-2">
													<asp:Label runat="server" Font-Size="Larger" CssClass="glyphicon glyphicon glyphicon-info-sign text-info" ToolTip='<%# Eval("[Previous English]") %>' Width="100%" />
													</div>
													</div>

										</EditItemTemplate>
									</asp:TemplateField>

									<asp:TemplateField HeaderText="ICT">
										<EditItemTemplate>
												<div class="row">
												<div class="col-md-10">
											<asp:DropDownList runat="server" ID="ddlICT" DataSourceID="sqlAssessmentLookup"  OnSelectedIndexChanged ="unenable_next" AutoPostBack =" true"  ToolTip='<%# Eval("[Previous ICT]") %>'
												DataTextField="Full Title" DataValueField="Lookup Value ID" SelectedValue='<%# Bind("ICT") %>' CssClass="form-control input-sm">
											</asp:DropDownList>
													</div>
												<div class="col-md-2">
													<asp:Label runat="server" Font-Size="Larger" CssClass="glyphicon glyphicon glyphicon-info-sign text-info" ToolTip='<%# Eval("[Previous ICT]") %>' Width="100%" />
													</div>
													</div>
										</EditItemTemplate>
									</asp:TemplateField>



									<asp:TemplateField HeaderText="Assessor Induction">
										<ItemTemplate>
											<div class="row">
												<div class="col-md-10">
											<asp:CheckBox runat="server" ID="cbAssessorInduction"  OnCheckedChanged="unenable_next" AutoPostBack =" true"   Checked  ='<%# Eval("Assessor Induction") == DBNull.Value ? false : Eval("Assessor Induction") %>' ToolTip='<%# Eval("[Previous Assessor Induction]") %>' /> 
															</div>
												<div class="col-md-2">
													<asp:Label runat="server" Font-Size="Larger" CssClass="glyphicon glyphicon glyphicon-info-sign text-info" ToolTip='<%# Eval("[Previous Assessor Induction]") %>' Width="100%" />
													</div>
													</div>
										</ItemTemplate>
									</asp:TemplateField>

									<asp:TemplateField HeaderText="Target Assessor Visits To Date">
										<ItemTemplate>
											<div class="row">
												<div class="col-md-10">
											<asp:TextBox runat="server" ID="tbTargetAssessorVisits" OnTextChanged="unenable_next" AutoPostBack =" true"  TextMode ="Number" Text='<%# Bind("[Target Assessor Visits]") %>' ToolTip='<%# Eval("[Previous Target Assessor Visits]") %>'
												CssClass="form-control input-sm"></asp:TextBox>
																</div>
												<div class="col-md-2">
													<asp:Label runat="server" Font-Size="Larger" CssClass="glyphicon glyphicon glyphicon-info-sign text-info" ToolTip='<%# Eval("[Previous Target Assessor Visits]") %>' Width="100%" />
													</div>
													</div>
										</ItemTemplate>
									</asp:TemplateField>

									<asp:TemplateField HeaderText="Actual Visits">
										<ItemTemplate>
											<div class="row">
												<div class="col-md-10">
											<asp:TextBox runat="server" ID="tbAssessorVisits"  OnTextChanged="unenable_next" AutoPostBack =" true"  TextMode  ="Number" Text='<%# Bind("[Assessor Visits]") %>'  ToolTip='<%# Eval("[Previous Assessor Visits]") %>'   CssClass="form-control input-sm"> </asp:TextBox>
													</div>
												<div class="col-md-2">
													<asp:Label runat="server" Font-Size="Larger" CssClass="glyphicon glyphicon glyphicon-info-sign text-info" ToolTip='<%# Eval("[Previous Assessor Visits]") %>' Width="100%" />
													</div>
													</div>
										</ItemTemplate>
									</asp:TemplateField>

								<asp:TemplateField HeaderText="Assessor % Complete" ValidateRequestMode="Disabled">
										<ItemTemplate>
											<div class="row">
												<div class="col-md-10">
											<asp:TextBox runat="server" ID="tbAssessorPercentComplete"   OnTextChanged="unenable_next" AutoPostBack =" true"  TextMode ="Number" Text='<%# Bind("[Assessor Percent Complete]") %>' ToolTip='<%# Eval("[Previous Assessor Percent Complete]") %>' CssClass="form-control input-sm"></asp:TextBox>
													</div>
												<div class="col-md-2">
													<asp:Label runat="server" Font-Size="Larger" CssClass="glyphicon glyphicon glyphicon-info-sign text-info" ToolTip='<%# Eval("[Previous Assessor Percent Complete]") %>' Width="100%" />
													</div>
													</div>
										</ItemTemplate>
									</asp:TemplateField>

									<asp:TemplateField HeaderText="Review Visits">
										<ItemTemplate>
											<div class="row">
												<div class="col-md-10">
											<asp:TextBox runat="server" ID="tbReviewVisits"  OnTextChanged ="unenable_next" AutoPostBack =" true"  TextMode  ="Number" Text='<%# Bind("[Review Visits]") %>' ToolTip='<%# Eval("[Previous Review Visits]") %>'  CssClass="form-control input-sm"></asp:TextBox>
													</div>
												<div class="col-md-2">
													<asp:Label runat="server" Font-Size="Larger" CssClass="glyphicon glyphicon glyphicon-info-sign text-info" ToolTip='<%# Eval("[Previous Review Visits]") %>' Width="100%" />
													</div>
													</div>
										</ItemTemplate>
									</asp:TemplateField>

									<asp:TemplateField HeaderText="Registered With Awarding Body">
										<ItemTemplate>
											<div class="row">
												<div class="col-md-10">
											<asp:CheckBox runat="server" ID="cbRegisteredWithAwardingBody" AutoPostBack =" true"  OnCheckedChanged ="unenable_next" Checked ='<%# Eval("Registered With Awarding Body") == DBNull.Value ? false : Eval("Registered With Awarding Body") %>' ToolTip='<%# Eval("[Previous Registered With Awarding Body]") %>'  />
													</div>
												<div class="col-md-2">
													<asp:Label runat="server" Font-Size="Larger" CssClass="glyphicon glyphicon glyphicon-info-sign text-info" ToolTip='<%# Eval("[Previous Registered With Awarding Body]") %>' Width="100%" />
													</div>
													</div>
										</ItemTemplate>
									</asp:TemplateField>

									<asp:TemplateField HeaderText="Additional Twenty Percent Training is being logged">
										<ItemTemplate>
											<div class="row">
												<div class="col-md-10">
											<asp:CheckBox runat="server" ID="cbAdditionalTwentyPercentTraining" AutoPostBack =" true"  OnCheckedChanged="unenable_next" Checked ='<%# Eval("Additional Twenty Percent Training") == DBNull.Value ? false : Eval("Additional Twenty Percent Training") %>' ToolTip='<%# Eval("[Previous Additional Twenty Percent Training]") %>'/>
														</div>
												<div class="col-md-2">
													<asp:Label runat="server" Font-Size="Larger" CssClass="glyphicon glyphicon glyphicon-info-sign text-info" ToolTip='<%# Eval("[Previous Additional Twenty Percent Training]") %>' Width="100%" />
													</div>
													</div>
										</ItemTemplate>
									</asp:TemplateField>
									<asp:TemplateField HeaderText="Additional Support Provided by tutor or assessor">
										<ItemTemplate>
											<div class="row">
												<div class="col-md-10">
											<asp:CheckBox runat="server" ID="cbALSCapture" AutoPostBack =" true"  OnCheckedChanged="unenable_next" Checked ='<%# Eval("ALS Capture") == DBNull.Value ? false : Eval("ALS Capture") %>'  ToolTip='<%# Eval("[Previous ALS Capture]") %>' />
															</div>
												<div class="col-md-2">
													<asp:Label runat="server" Font-Size="Larger" CssClass="glyphicon glyphicon glyphicon-info-sign text-info" ToolTip='<%# Eval("[Previous ALS Capture]") %>' Width="100%" />
													</div>
													</div>
										</ItemTemplate>
									</asp:TemplateField>
									<asp:TemplateField HeaderText="ALS Support Need" Visible="false">
										<ItemTemplate>
											
											<asp:CheckBox runat="server" ID="cbALSSupportNeed" AutoPostBack =" true"  OnCheckedChanged="unenable_next" Checked ='<%# Eval("ALS Support Need") == DBNull.Value ? false : Eval("ALS Support Need") %>'  ToolTip='<%# Eval("[Previous ALS Support Need]") %>'/>
													
										</ItemTemplate>
									</asp:TemplateField>

									<asp:TemplateField HeaderText="Learner Feedback">
										<ItemTemplate>
												<div class="row">
												<div class="col-md-10">
											<asp:DropDownList runat="server" ID="ddlLearnerFeedback" DataSourceID="sqlFeedbackLookup"
												DataTextField="Full Title" DataValueField="Lookup Value ID"  OnSelectedIndexChanged="unenable_next" AutoPostBack =" true"  SelectedValue='<%# Bind("[Learner Feedback]") %>'  ToolTip='<%# Eval("[Previous Learner Feedback]") %>' CssClass="form-control input-sm">
											</asp:DropDownList>
														</div>
												<div class="col-md-2">
													<asp:Label runat="server" Font-Size="Larger" CssClass="glyphicon glyphicon glyphicon-info-sign text-info" ToolTip='<%# Eval("[Previous Learner Feedback]") %>' Width="100%" />
													</div>
													</div>
										</ItemTemplate>
									</asp:TemplateField>
									<asp:TemplateField HeaderText="Employer Feedback">
										<ItemTemplate>
											<div class="row">
												<div class="col-md-10">
											<asp:DropDownList runat="server" ID="ddlEmployerFeedback" DataSourceID="sqlFeedbackLookup"
												DataTextField="Full Title" DataValueField="Lookup Value ID"  OnSelectedIndexChanged ="unenable_next" AutoPostBack =" true"  SelectedValue='<%# Bind("[Employer Feedback]") %>' ToolTip='<%# Eval("[Previous Employer Feedback]") %>'   CssClass="form-control input-sm">
											</asp:DropDownList>
											</div>
												<div class="col-md-2">
													<asp:Label runat="server" Font-Size="Larger" CssClass="glyphicon glyphicon glyphicon-info-sign text-info" ToolTip='<%# Eval("[Previous Employer Feedback]") %>' Width="100%" />
													</div>
													</div>
										</ItemTemplate>
									</asp:TemplateField>

									<asp:TemplateField HeaderText ="Disciplinary Stage">
										<ItemTemplate>
											<div class="row">
												<div class="col-md-10">
											<asp:DropDownList runat="server" ID="ddlDisciplinary" DataSourceID="sqlDisciplinaryLookup"
												DataTextField="Full Title" DataValueField="Lookup Value ID"  OnSelectedIndexChanged="unenable_next" AutoPostBack =" true"  SelectedValue='<%# Bind("[Disciplinary]") %>' ToolTip='<%# Eval("[Previous Disciplinary]") %>'  CssClass="form-control input-sm">
											</asp:DropDownList>
															</div>
												<div class="col-md-2">
													<asp:Label runat="server" Font-Size="Larger" CssClass="glyphicon glyphicon glyphicon-info-sign text-info" ToolTip='<%# Eval("[Previous Disciplinary]") %>' Width="100%" />
													</div>
													</div>
										</ItemTemplate>
									</asp:TemplateField>

									<asp:TemplateField HeaderText="Will Retain">
										
										<ItemTemplate>
											<div class="row">
												<div class="col-md-10">
											<asp:CheckBox runat="server" ID="cbWillRetain" AutoPostBack =" true"  OnCheckedChanged ="unenable_next" Checked ='<%# Eval("WillRetain") == DBNull.Value ? false : Eval("WillRetain") %>'  ToolTip='<%# Eval("[Previous WillRetain]") %>'/>
											</div>
												<div class="col-md-2">
											<asp:Label runat="server" Font-Size="Larger" CssClass="glyphicon glyphicon glyphicon-info-sign text-info" ToolTip='<%# Eval("[Previous WillRetain]") %>' Width="100%" />
													</div>
												</div>
										</ItemTemplate>
									</asp:TemplateField>

									<asp:TemplateField HeaderText="Will Pass">
										<ItemTemplate>					
											<div class="row">
												<div class="col-md-10">
												<asp:CheckBox runat="server" ID="cbWillPass" AutoPostBack =" true"  OnCheckedChanged="unenable_next" Checked ='<%# Eval("WillPass") == DBNull.Value ? false : Eval("WillPass") %>' ToolTip='<%# Eval("[Previous WillPass]") %>' />											
												</div>
												<div class="col-md-2">
											<asp:Label runat="server" Font-Size="Larger" CssClass="glyphicon glyphicon glyphicon-info-sign text-info" ToolTip='<%# Eval("[Previous WillPass]") %>' Width="100%" />
													</div>
												</div>
										</ItemTemplate>
									</asp:TemplateField>

									<asp:TemplateField HeaderText ="Year Will Pass">
										<ItemTemplate>
											<div class="row">
												<div class="col-md-10">
												<asp:DropDownList runat="server" ID="ddlPredictedPassYear" CssClass="form-control input-sm" Width="100%" AutoPostBack =" true"  OnSelectedIndexChanged="unenable_next" ToolTip='<%# Eval("[Previous PredictedPassYear]") %>' 
													DataSourceID="sqlPredictedPassYear" DataTextField="Full Title" DataValueField="Lookup Value ID"
													SelectedValue='<%# Eval("PredictedPassYear") %>'>
												</asp:DropDownList>
													</div>
												<div class="col-md-2">
											<asp:Label runat="server" Font-Size="Larger" CssClass="glyphicon glyphicon glyphicon-info-sign text-info" ToolTip='<%# Eval("[Previous PredictedPassYear]") %>' Width="100%" />
													</div>
												</div>
										</ItemTemplate>
									</asp:TemplateField>

									<asp:TemplateField >
										<HeaderTemplate>
											
											<asp:Label runat="server" Text="Timely" />
												
										</HeaderTemplate>
										<ItemTemplate>
											<div class="row">
												<div class="col-md-10">
											<asp:CheckBox runat="server" ID="cbTimely"  OnCheckedChanged="unenable_next" AutoPostBack =" true"  Checked ='<%# Eval("Timely") == DBNull.Value ? false : Eval("Timely") %>'  ToolTip='<%# Eval("[Previous Timely]") %>'/>
											</div>
												<div class="col-md-2">
											<asp:Label runat="server" Font-Size="Larger" CssClass="glyphicon glyphicon glyphicon-info-sign text-info" ToolTip='<%# Eval("[Previous Timely]") %>' Width="100%" />
													</div>
												</div>
										</ItemTemplate>
									</asp:TemplateField>


								 	<asp:TemplateField HeaderText="Risk of being below MLP" Visible="False">
								 		<ItemTemplate>
								 			<div class="row">
								 				<div class="col-md-10">
								 			<asp:CheckBox runat="server" ID="cbBelowMLP"  OnCheckedChanged="unenable_next" AutoPostBack =" true"  Checked='<%# Eval("Below MLP") == DBNull.Value ? false : Eval("Below MLP") %>'  ToolTip='<%# Eval("[Previous Below MLP]") %>'/>
								 					</div>
								 				<div class="col-md-2">
								 			<asp:Label runat="server" Font-Size="Larger" CssClass="glyphicon glyphicon glyphicon-info-sign text-info" ToolTip='<%# Eval("[Previous Below MLP]") %>' Width="100%" />
								 					</div>
								 				</div>
							  			</ItemTemplate>
							 		</asp:TemplateField>

									<asp:TemplateField HeaderText="RAG Rating">
										<ItemTemplate>
											<div class="row">
												<div class="col-md-10">
											<asp:DropDownList runat="server" ID="ddlRAGRating" DataSourceID="sqlRAGLookup"  AutoPostBack =" true"  OnTextChanged  ="unenable_next" ToolTip='<%# Eval("[Previous RAG Rating]") %>' 
												DataTextField="Full Title" DataValueField="Lookup Value ID" SelectedValue='<%# Bind("[RAG Rating]") %>' CssClass="form-control input-sm" Enabled="true">
											</asp:DropDownList>
													</div>
												<div class="col-md-2">
											<asp:Label runat="server" Font-Size="Larger" CssClass="glyphicon glyphicon glyphicon-info-sign text-info" ToolTip='<%# Eval("[Previous RAG Rating]") %>' Width="100%" />
													</div>
												</div>
										</ItemTemplate>
									</asp:TemplateField>

									<asp:TemplateField HeaderText="Notes"  >
										<ItemTemplate>
											<asp:TextBox runat="server" ID="tbNotes" Width="100%"   OnTextChanged="unenable_next" AutoPostBack =" true"  TextMode ="MultiLine" Text='<%# Eval("Notes") %>' Rows="6" Style="resize: none;" />
										</ItemTemplate>
									</asp:TemplateField>

       								<asp:TemplateField HeaderText="Action PM 1"  >
										<ItemTemplate>
											<asp:TextBox runat="server" ID="tbActionPM1" Width="100%"   OnTextChanged="unenable_next" AutoPostBack =" true"  TextMode ="MultiLine" Text='<%# Eval("ActionPM1") %>' Rows="6" Style="resize: none;"  ToolTip='<%# Eval("[PreviousActionPM1]") %>' />
										</ItemTemplate>
									</asp:TemplateField>
                    				<asp:TemplateField HeaderText="Action PM 2"  >
										<ItemTemplate>
											<asp:TextBox runat="server" ID="tbActionPM2" Width="100%"   OnTextChanged="unenable_next" AutoPostBack =" true"  TextMode ="MultiLine" Text='<%# Eval("ActionPM2") %>' Rows="6" Style="resize: none;" ToolTip='<%# Eval("[PreviousActionPM2]") %>'/>
										</ItemTemplate>
									</asp:TemplateField>
      								<asp:TemplateField HeaderText="Action PM 3"  >
										<ItemTemplate>
											<asp:TextBox runat="server" ID="tbActionPM3" Width="100%"   OnTextChanged="unenable_next" AutoPostBack =" true"  TextMode ="MultiLine" Text='<%# Eval("ActionPM3") %>' Rows="6" Style="resize: none;" ToolTip='<%# Eval("[PreviousActionPM3]") %>'/>
										</ItemTemplate>
									</asp:TemplateField>

									<asp:TemplateField ShowHeader="False">
										<EditItemTemplate>
											<div class="row">
												<div class="col-md-8">
												</div>

												<div class="col-md-2">
													<asp:HyperLink ID="lbtnCancelProgMon" runat="server" Text="Cancel" Height="100"  Width="200" style="font-size:20px" 
														CssClass="btn btn-sm btn-danger text-center"  NavigateUrl='<%# Eval("CourseURL") %>' />
													
												</div>
												
												<div class="col-md-2">
													<asp:Button ID="btnSaveProgMon" runat="server" CausesValidation="True" Text="Save Student Data"  style="font-size:20px"
														CssClass="btn btn-sm btn-success text-center" OnClick="btnSaveProgMon_Click"  Height="100"  Width="200" />
												</div>
											</div>
										</EditItemTemplate>

									</asp:TemplateField>

								</Fields>
							</asp:DetailsView>
							<asp:SqlDataSource ID="sqlProgressReport" runat="server" ConnectionString="<%$ ConnectionStrings:ApprenticeshipProgressMonitoringConnectionString %>"
								SelectCommand="spGetProgressMonitoringRecord"
								SelectCommandType="StoredProcedure" >
								<SelectParameters>
									<asp:QueryStringParameter Name="Progress_Monitoring_ID" QueryStringField="ID" Type="Int32" />
								</SelectParameters>

							</asp:SqlDataSource>
						</div>
						<div class="panel-footer">
							<div class="clearn-fix">
								<div class="row">
									<div class="col-md-2">
										<asp:Button runat="server" ID="btnPrev"  Text="Prev" CssClass="btn" ToolTip ="Previous Student" OnClick="btnPrev_Click" Enabled="false"  Height="100"  Width="200" />
									</div>
									<div class="col-md-8">
										<asp:Label runat="server" ID="lblMessage" Width="100%"></asp:Label>
									</div>
									<div class="col-md-2">
										<asp:Button runat="server" ID="btnNext"  Text="Next" CssClass="btn" ToolTip="Next Student" OnClick="btnNext_Click" Enabled="false" Height="100"  Width="200"/>
											
									</div>

								</div>
								
								
								
							</div>
							

							
						</div>
					</div>
				</div>
			</div>
	

			<asp:SqlDataSource ID="sqlAssessmentLookup" runat="server" ConnectionString="<%$ ConnectionStrings:ApprenticeshipProgressMonitoringConnectionString %>" SelectCommand="SELECT  [Lookup Value ID]
       ,[Full Title]
       ,[Sort Order]
FROM    dbo.LookupValue
WHERE   [Lookup Type] = 'Assessement'
        AND Active = 1
UNION
SELECT [Lookup Value ID], [Full Title], [Sort Order] FROM dbo.LookupValue WHERE [Lookup Type] = 'Blank'
ORDER BY [Sort Order]"></asp:SqlDataSource>

			<asp:SqlDataSource ID="sqlPredictedPassYear" runat="server"
				ConnectionString="<%$ ConnectionStrings:ApprenticeshipProgressMonitoringConnectionString %>"
				SelectCommand="SELECT  [Lookup Value ID]
       ,[Full Title]
       ,[Sort Order]
FROM    dbo.LookupValue
WHERE   [Lookup Type] = 'Predicted Pass Year'
        AND Active = 1
				UNION
SELECT [Lookup Value ID], [Full Title], [Sort Order] FROM dbo.LookupValue WHERE [Lookup Type] = 'Blank'
ORDER BY [Sort Order]"></asp:SqlDataSource>



			<asp:SqlDataSource ID="sqlFeedbackLookup" runat="server" ConnectionString="<%$ ConnectionStrings:ApprenticeshipProgressMonitoringConnectionString %>" SelectCommand="SELECT  [Lookup Value ID]
       ,[Full Title]
       ,[Sort Order]
FROM    dbo.LookupValue
WHERE   [Lookup Type] = 'Feedback'
        AND Active = 1
UNION
SELECT [Lookup Value ID], [Full Title], [Sort Order] FROM dbo.LookupValue WHERE [Lookup Type] = 'Blank'
ORDER BY [Sort Order]"></asp:SqlDataSource>


			<asp:SqlDataSource ID="sqlRAGLookup" runat="server" ConnectionString="<%$ ConnectionStrings:ApprenticeshipProgressMonitoringConnectionString %>" SelectCommand="SELECT  [Lookup Value ID]
       ,[Full Title]
       ,[Sort Order]
FROM    dbo.LookupValue
WHERE   [Lookup Type] = 'RAG Rating                                                                                          '
        AND Active = 1
UNION
SELECT [Lookup Value ID], [Full Title], [Sort Order] FROM dbo.LookupValue WHERE [Lookup Type] = 'Blank'
ORDER BY [Sort Order]"></asp:SqlDataSource>


				<asp:SqlDataSource ID="sqlMathsEnglishLookup" runat="server" ConnectionString="<%$ ConnectionStrings:ApprenticeshipProgressMonitoringConnectionString %>" SelectCommand="SELECT  [Lookup Value ID]
       ,[Full Title]
       ,[Sort Order]
FROM    dbo.LookupValue
WHERE   [Lookup Type] = 'Maths and English                                                                                   '
        AND Active = 1
UNION
SELECT [Lookup Value ID], [Full Title], [Sort Order] FROM dbo.LookupValue WHERE [Lookup Type] = 'Blank'
ORDER BY [Sort Order]"></asp:SqlDataSource>


			<asp:SqlDataSource ID="sqlDisciplinaryLookup" runat="server" ConnectionString="<%$ ConnectionStrings:ApprenticeshipProgressMonitoringConnectionString %>" 
				SelectCommand="SELECT  [Lookup Value ID]
       ,[Full Title]
       ,[Sort Order]
FROM    dbo.LookupValue
WHERE   [Lookup Type] = 'Disciplinary'
        AND Active = 1
UNION
SELECT [Lookup Value ID], [Full Title], [Sort Order] FROM dbo.LookupValue WHERE [Lookup Type] = 'Blank'
ORDER BY [Sort Order]"></asp:SqlDataSource>

		</ContentTemplate>
	</asp:UpdatePanel>
</asp:Content>
