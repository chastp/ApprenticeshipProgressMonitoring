<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EnrolmentList.aspx.cs" Inherits="ApprenticeshipProgressMonitoring.EnrolmentList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:UpdatePanel runat="server" ID="upPanel">
        <ContentTemplate>
            <div class="jumbotron">
                <h2>Apprenticeship Progress Monitoring</h2>
                </div>
            <div class="jumbotron">
                <div class="row">
                  
					<div class="col-md-1">
						<asp:DropDownList runat="server" ID="ddlArea" AutoPostBack="True" Width="100%" CssClass="form-control" DataSourceID="sqlAreas" DataTextField="AreaName" DataValueField="Curriculum_Area_Code"></asp:DropDownList>
						<asp:SqlDataSource ID="sqlAreas" runat="server" ConnectionString="<%$ ConnectionStrings:ApprenticeshipProgressMonitoringConnectionString %>" SelectCommand="SELECT DISTINCT [Curriculum Area Code]  AS Curriculum_Area_Code,
[Curriculum Area Code] AreaName
 FROM [Enrolment] 
WHERE [Curriculum Area Code] LIKE '%'
UNION
SELECT 'AAAA', '...Area...'
ORDER BY [Curriculum Area Code]"></asp:SqlDataSource>
					</div>


					
					<div class="col-md-1">
						<asp:DropDownList runat="server" ID="ddlTeam" AutoPostBack="True" Width="100%" CssClass="form-control" DataSourceID="sqlTeams" DataTextField="TeamName" DataValueField="TeamCode"></asp:DropDownList>
						<asp:SqlDataSource ID="sqlTeams" runat="server" ConnectionString="<%$ ConnectionStrings:ApprenticeshipProgressMonitoringConnectionString %>" SelectCommand="SELECT DISTINCT [Curriculum Team Code]  AS TeamCode,
[Curriculum Team Code] TeamName
 FROM [Enrolment] 
WHERE [Curriculum Area Code] LIKE @Area
UNION
SELECT 'AAAA', '...Team...'
ORDER BY 1">
							<SelectParameters>
								<asp:ControlParameter ControlID="ddlArea" Name="Area" PropertyName="SelectedValue" />
							</SelectParameters>
						</asp:SqlDataSource>
					</div>

					<div class="col-md-4">
						<asp:DropDownList runat="server" ID="ddlCourse" AutoPostBack="True" Width="100%" CssClass="form-control" DataSourceID="sqlCourse" DataTextField="CourseTitle" 
							 OnSelectedIndexChanged ="ddlCourse_SelectedIndexChanged"
							DataValueField="CourseID"></asp:DropDownList>

						<asp:SqlDataSource ID="sqlCourse" runat="server" ConnectionString="<%$ ConnectionStrings:ApprenticeshipProgressMonitoringConnectionString %>" SelectCommand="SELECT DISTINCT [Course ID] CourseID,
[Course Code] + ' | ' + [Course Title] CourseTitle
 FROM [Enrolment] 
WHERE [Curriculum Area Code] LIKE CASE WHEN @Area = 'AAAA' THEN '%' ELSE @Area END
AND [Curriculum Team Code] LIKE CASE WHEN @Team = 'AAAA' THEN '%' ELSE @Team END
							AND [Course Title] NOT LIKE '%functional%'
							AND [Enrolment Order Number] = 1
UNION
SELECT 0, '...Select Course...'

ORDER BY 2">
							<SelectParameters>
								<asp:ControlParameter ControlID="ddlArea" Name="Area" PropertyName="SelectedValue" />
								<asp:ControlParameter ControlID="ddlTeam" Name="Team" PropertyName="SelectedValue" />

								

							</SelectParameters>
						</asp:SqlDataSource>

					</div>
                    <div class="col-md-4">
                        <asp:DropDownList runat="server" ID="ddlProgressMonitoringSet" 
                            CssClass="form-control" AutoPostBack="True" DataSourceID="sqlProgressMonitoringSet" 
                            DataTextField="Progress_Monitoring_Name" 
                            Width="100%"
                            DataValueField="Progress_Monitoring_Set_ID"></asp:DropDownList>
                        <asp:SqlDataSource ID="sqlProgressMonitoringSet" runat="server" ConnectionString="<%$ ConnectionStrings:ApprenticeshipProgressMonitoringConnectionString %>" SelectCommand="SELECT [Progress Monitoring Set ID] AS Progress_Monitoring_Set_ID, [Progress Monitoring Name] AS Progress_Monitoring_Name FROM [ProgressMonitoringSet] ORDER BY [Set Start]"></asp:SqlDataSource>
                    </div>
              <div class="col-md-1">
					<asp:Button runat="server" ID="btnEnrolmentProgressMonitoring" Visible="true" Enabled="false" ToolTip="Click to enter Progress Monitoring for all the student on selected course" 
						Text="Class Monitoring" CssClass="btn btn-primary" OnClick="btnEnrolmentProgressMonitoring_Click"></asp:Button>
				</div>
				</div>
			</div>
            <br />
            <div class="row">
                <div class="col-md-12">
                    <asp:GridView runat="server" ID="gvEnrolments" GridLines="None" AutoGenerateColumns="False"
                        DataKeyNames="Enrolment ID" DataSourceID="sqlEnrolments"
                        CssClass="table table-sm table-hover table-responsive" OnRowCommand="gvEnrolments_RowCommand">

                        <Columns>
                            <asp:BoundField DataField="StudentName" HeaderText="Student" ReadOnly="True" SortExpression="StudentName" />
							<asp:BoundField DataField="Course Code"  HeaderText ="Course" SortExpression="Course Code" />
                            <asp:BoundField DataField="Frmwk Start Date" HeaderText="Start Date" SortExpression="Frmwk Start Date" DataFormatString="{0:dd/MM/yyyy}" HtmlEncode="false" />
                            <asp:BoundField DataField="Frmwk Planned End" HeaderText="Planned End" SortExpression="Frmwk Planned End" DataFormatString="{0:dd/MM/yyyy}" HtmlEncode="false" />
                            <asp:BoundField DataField="Frmwk Actual Date" HeaderText="Actual Date" SortExpression="Frmwk Actual Date" DataFormatString="{0:dd/MM/yyyy}" HtmlEncode="false" />
                            <asp:BoundField DataField="Frwk Achieve Date" HeaderText="Achieve Date" SortExpression="Frwk Achieve Date" DataFormatString="{0:dd/MM/yyyy}" HtmlEncode="false" />
                            <asp:TemplateField HeaderText="RAG">
								<ItemTemplate>
									<asp:Label runat="server" ID="lblRAG" Text='<%# Eval("RAG") %>'></asp:Label>
								</ItemTemplate>
							</asp:TemplateField>
							<asp:TemplateField HeaderText="Progress Report">
                                <ItemTemplate>
                                    <asp:Button runat="server" ID="btnProgressReport" CssClass="btn btn-xs btn-primary" Text="Open"
                                        CommandName="OpenProgressReport" CommandArgument='<%# Eval("Enrolment ID")%>' />
									<asp:Label runat="server" ID="tbProgressMonitoringStatus" Text='<%# Eval("ProgressMonitoringStatus") %>'/>
                                </ItemTemplate>
                            </asp:TemplateField>
							
                        </Columns>

                    </asp:GridView>
                    <asp:SqlDataSource ID="sqlEnrolments" runat="server" ConnectionString="<%$ ConnectionStrings:ApprenticeshipProgressMonitoringConnectionString %>"
                        SelectCommand="SELECT  E.[Enrolment ID]
      , E.[Student ID]
      , S.Surname + ', ' + S.Forename + ' (' + CAST(E.[Student ID] AS VARCHAR(10)) + ')' StudentName
      , E.[Course Code]
      , E.[Pathway Name]
      , E.[Frmwk Start Date]
      , E.[Frmwk Planned End]
      , E.[Frwk Achieve Date]
      , E.[Frmwk Actual Date]
      , ISNULL(PM.[Progress Monitoring ID], 0) [Progress Monitoring ID]
      , CASE WHEN PM.UpdatedBy IS NULL THEN ''
             ELSE 'Complete!'
        END ProgressMonitoringStatus
      , ISNULL(RAG.[Full Title], '-') RAG
FROM    dbo.Enrolment E
        LEFT JOIN dbo.Student S ON S.[Student ID] = E.[Student ID]
        LEFT JOIN dbo.ProgressMonitoring PM ON PM.[Enrolment ID] = E.[Enrolment ID]
                                               AND PM.[Progress Monitoring Set ID] = @ProgressMonitoringSetID
        LEFT JOIN dbo.LookupValue RAG ON RAG.[Lookup Value ID] = PM.[RAG Rating]
                                         AND RAG.[Lookup Type] = 'RAG Rating                                                                                          '
WHERE   E.[Enrolment Order Number] = 1
        AND [Course ID] = @CourseID
ORDER BY StudentName">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="ddlProgressMonitoringSet" Name="ProgressMonitoringSetID" PropertyName="SelectedValue" />
                            <asp:ControlParameter ControlID="ddlCourse" Name="CourseID" PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:SqlDataSource>


                </div>
            </div>
			
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
