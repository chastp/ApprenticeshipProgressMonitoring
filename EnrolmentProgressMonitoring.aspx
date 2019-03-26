<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EnrolmentProgressMonitoring.aspx.cs" Inherits="ApprenticeshipProgressMonitoring.EnrolmentProgressMonitoring" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
	<asp:UpdatePanel runat="server" ID="up">
		<ContentTemplate>
			<br />
			<div class="row">
				<div class="col-md-6">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h4>Enrolments</h4>
						</div>
						<div class="panel-body">
							<asp:GridView runat="server" ID="gvEnrols" CssClass="table table-hover" GridLines="None" Width="100%" 
								AutoGenerateColumns="False" DataKeyNames="Enrolment ID"
								DataSourceID="sqlEnrols" OnSelectedIndexChanged="gvEnrols_SelectedIndexChanged">
								<Columns>
									
									<asp:TemplateField HeaderText="Students">
										<ItemTemplate>
											<asp:Label runat="server" ID="lblStudent" Text='<%# Eval("StudentName") %>' />
											<asp:HiddenField runat="server" ID="hfProgressMonitoringID" Value='<%# Eval("ProgressMonitoringID") %>' />
											<asp:HiddenField runat="server" ID="hfEnrolmentID" Value='<%# Eval("Enrolment ID") %>' />
										</ItemTemplate>
									</asp:TemplateField>
									<asp:TemplateField HeaderText="RAG">
										<ItemTemplate>
											<asp:Label runat="server" ID="lblRAG" Text='<%# Eval("RAG") %>' />
										</ItemTemplate>
									</asp:TemplateField>
									<asp:CommandField ShowSelectButton="True" />
								</Columns>
							</asp:GridView>
							<asp:SqlDataSource ID="sqlEnrols" runat="server" ConnectionString="<%$ ConnectionStrings:ApprenticeshipProgressMonitoringConnectionString %>" SelectCommand="SELECT  E.[Enrolment ID]
       ,E.[Student ID]
       ,S.Surname + ', ' + S.Forename + ' (' + CAST(E.[Student ID] AS VARCHAR(10)) + ')' StudentName
       ,E.[Course Code]
       ,ISNULL(PM.[Progress Monitoring ID], 0) ProgressMonitoringID,
	   CAST(E.[Framework Or Standard Code] AS NVARCHAR(5)) + '.' + e.[Prog Type Code] App_Type_Code,
		ISNULL(RAG.[Full Title], '-') RAG
FROM    dbo.Enrolment E
        LEFT JOIN dbo.Student S ON S.[Student ID] = E.[Student ID]
        LEFT JOIN dbo.ProgressMonitoring PM ON PM.[Enrolment ID] = E.[Enrolment ID]
                                               AND PM.[Progress Monitoring Set ID] = 1 
		LEFT JOIN dbo.LookupValue RAG ON RAG.[Lookup Value ID] = PM.[RAG Rating]
                                         AND RAG.[Lookup Type] = 'RAG Rating'
WHERE   E.[Enrolment Order Number] = 1
        AND [Course ID] = @ID 
ORDER BY StudentName">
								<SelectParameters>
									<asp:QueryStringParameter Name="ID" QueryStringField="ID" Type="String" />
								</SelectParameters>

							</asp:SqlDataSource>
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<asp:DropDownList runat="server" ID="ddlProgressMonitoringSet" CssClass="form-control" AutoPostBack="true"
						Width="100%" DataSourceID="sqlProgressMonitorSet" DataTextField="Progress_Monitoring_Name" 
						DataValueField="Progress_Monitoring_Set_ID" OnSelectedIndexChanged="ddlProgressMonitoringSet_SelectedIndexChanged"></asp:DropDownList>
					<br />
					<asp:SqlDataSource ID="sqlProgressMonitorSet" runat="server" ConnectionString="<%$ ConnectionStrings:ApprenticeshipProgressMonitoringConnectionString %>" SelectCommand="SELECT [Progress Monitoring Set ID] AS Progress_Monitoring_Set_ID, [Progress Monitoring Name] AS Progress_Monitoring_Name FROM [ProgressMonitoringSet] ORDER BY [Set Start]"></asp:SqlDataSource>
					<div class="panel panel-primary">
						<div class="panel-heading">

							<h4 class="panel-title pull-left">
Progress Monitoring
            </h4>
<asp:HyperLink runat="server" ID="hlStudent" Text="Open" CssClass="btn btn-default btn-sm pull-right" OnClick="btnOpen_Click" Enabled="false" />
        <div class="clearfix">
				
							
									</div>
								</div>
							
						
						<div class="panel-body">
					<asp:DetailsView runat="server" ID="dvDetails" AutoGenerateRows="False" DataKeyNames="Progress Monitoring ID" 
                                DefaultMode="Edit" GridLines="None" CssClass="table table-striped">
                                <Fields>
                                    <asp:BoundField DataField="Progress Monitoring ID" HeaderText="Progress Monitoring ID" InsertVisible="False" ReadOnly="True" SortExpression="Progress Monitoring ID" Visible="false" />
                                    <asp:BoundField DataField="Enrolment ID" HeaderText="Enrolment ID" SortExpression="Enrolment ID" Visible="false" />
                                    <asp:BoundField DataField="Progress Monitoring Set ID" HeaderText="Progress Monitoring Set ID" SortExpression="Progress Monitoring Set ID" Visible="false" />
                                    <asp:TemplateField HeaderText="Will Retain">
										<ItemTemplate>
											<asp:CheckBox runat="server" ID="cbWillRetain" Checked='<%# Eval("WillRetain") == DBNull.Value ? false : Eval("WillRetain") %>' />
										</ItemTemplate>
                                    </asp:TemplateField>

									<asp:TemplateField HeaderText="Will Pass">
										<ItemTemplate>
										<table>
												<tr>
													<td>
												<asp:CheckBox runat="server" ID="cbWillPass" Checked='<%# Eval("WillPass") == DBNull.Value ? false : Eval("WillPass") %>' />
											</td>
													<td>
											
												<asp:DropDownList runat="server" ID="ddlPredictedPassYear" CssClass="form-control input-sm"
													DataSourceID="sqlPredictedPassYear" DataTextField="Full Title" DataValueField="Lookup Value ID"
													SelectedValue='<%# Eval("PredictedPassYear") %>'>
												</asp:DropDownList>
														</td>
													</tr>
											</table>
										</ItemTemplate>
                                    </asp:TemplateField>

									
									<asp:TemplateField HeaderText="Competency">
                                        <EditItemTemplate>
                                            <asp:DropDownList runat="server" ID="ddlCompetency" DataSourceID="sqlAssessmentLookup"
                                                DataTextField="Full Title" DataValueField="Lookup Value ID" SelectedValue='<%# Bind("Competency") %>' CssClass="form-control input-sm">
                                            </asp:DropDownList>
                                            <asp:HiddenField runat="server" ID="hfProgressMonitoringID" Value='<%# Eval("Progress Monitoring ID") %>' />
                                        </EditItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Knowledge">
                                        <EditItemTemplate>
                                            <asp:DropDownList runat="server" ID="ddlKnowledge" DataSourceID="sqlAssessmentLookup"
                                                DataTextField="Full Title" DataValueField="Lookup Value ID" SelectedValue='<%# Bind("Knoweldge") %>' CssClass="form-control input-sm">
                                            </asp:DropDownList>

                                        </EditItemTemplate>
                                    </asp:TemplateField>


                                    <asp:TemplateField HeaderText="Employer Rights and Responsibilities">
                                        <EditItemTemplate>
                                            <asp:DropDownList runat="server" ID="ddlEmployerRightsAndResponsibilities" DataSourceID="sqlAssessmentLookup"
                                                DataTextField="Full Title" DataValueField="Lookup Value ID" SelectedValue='<%# Bind("[Employer Rights and Responsibilities]") %>' CssClass="form-control input-sm">
                                            </asp:DropDownList>

                                        </EditItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="PLTS">
                                        <EditItemTemplate>
                                            <asp:DropDownList runat="server" ID="ddlPLTS" DataSourceID="sqlAssessmentLookup"
                                                DataTextField="Full Title" DataValueField="Lookup Value ID" SelectedValue='<%# Bind("PLTS") %>' CssClass="form-control input-sm">
                                            </asp:DropDownList>

                                        </EditItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="English and Maths">
                                        <EditItemTemplate>
                                            <asp:DropDownList runat="server" ID="ddlEnglishAndMaths" DataSourceID="sqlAssessmentLookup"
                                                DataTextField="Full Title" DataValueField="Lookup Value ID" SelectedValue='<%# Bind("[English and Maths]") %>' CssClass="form-control input-sm">
                                            </asp:DropDownList>

                                        </EditItemTemplate>
                                    </asp:TemplateField>


                                    <asp:TemplateField HeaderText="ICT">
                                        <EditItemTemplate>
                                            <asp:DropDownList runat="server" ID="ddlICT" DataSourceID="sqlAssessmentLookup"
                                                DataTextField="Full Title" DataValueField="Lookup Value ID" SelectedValue='<%# Bind("ICT") %>' CssClass="form-control input-sm">
                                            </asp:DropDownList>

                                        </EditItemTemplate>
                                    </asp:TemplateField>


                                    
                                    <asp:TemplateField HeaderText="Behaviour Issues">
                                        <ItemTemplate>
                                            <asp:CheckBox runat="server" ID="cbBehaviourIssues" Checked='<%# Eval("Behaviour Issues") == DBNull.Value ? false : Eval("Behaviour Issues") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Assessor Visits">
                                        <ItemTemplate>
                                            <asp:TextBox runat="server" ID="tbAssessorVisits" TextMode="Number" Text='<%# Bind("[Assessor Visits]") %>' CssClass="form-control input-sm"></asp:TextBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Review Visits">
                                        <ItemTemplate>
                                            <asp:TextBox runat="server" ID="tbReviewVisits" TextMode="Number" Text='<%# Bind("[Review Visits]") %>' CssClass="form-control input-sm"></asp:TextBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>


                                    <asp:TemplateField HeaderText="Registered With Awarding Body">
                                        <ItemTemplate>
                                                 <asp:CheckBox runat="server" ID="cbRegisteredWithAwardingBody" Checked='<%# Eval("Registered With Awarding Body") == DBNull.Value ? false : Eval("Registered With Awarding Body") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Timely">
                                        <ItemTemplate>
                                                 <asp:CheckBox runat="server" ID="cbTimely" Checked='<%# Eval("Timely") == DBNull.Value ? false : Eval("Timely") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Additional Twenty Percent Training">
                                        <ItemTemplate>
                                                 <asp:CheckBox runat="server" ID="cbAdditionalTwentyPercentTraining" Checked='<%# Eval("Additional Twenty Percent Training") == DBNull.Value ? false : Eval("Additional Twenty Percent Training") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="ALS Capture">
                                        <ItemTemplate>
                                                 <asp:CheckBox runat="server" ID="cbALSCapture" Checked='<%# Eval("ALS Capture") == DBNull.Value ? false : Eval("ALS Capture") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="ALS Support Need">
                                        <ItemTemplate>
                                                 <asp:CheckBox runat="server" ID="cbALSSupportNeed" Checked='<%# Eval("ALS Support Need") == DBNull.Value ? false : Eval("ALS Support Need") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Learner Feedback">
                                        <ItemTemplate>
                                            <asp:DropDownList runat="server" ID="ddlLearnerFeedback" DataSourceID="sqlFeedbackLookup"
                                                DataTextField="Full Title" DataValueField="Lookup Value ID" SelectedValue='<%# Bind("[Learner Feedback]") %>' CssClass="form-control input-sm">
                                            </asp:DropDownList>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Employer Feedback">
                                        <ItemTemplate>
                                            <asp:DropDownList runat="server" ID="ddlEmployerFeedback" DataSourceID="sqlFeedbackLookup"
                                                DataTextField="Full Title" DataValueField="Lookup Value ID" SelectedValue='<%# Bind("[Employer Feedback]") %>' CssClass="form-control input-sm">
                                            </asp:DropDownList>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="RAG Rating">
                                        <ItemTemplate>
                                            <asp:DropDownList runat="server" ID="ddlRAGRating" DataSourceID="sqlRAGLookup"
                                                DataTextField="Full Title" DataValueField="Lookup Value ID" SelectedValue='<%# Bind("[RAG Rating]") %>' CssClass="form-control input-sm">
                                            </asp:DropDownList>
                                        </ItemTemplate>
                                    </asp:TemplateField>

									<asp:TemplateField HeaderText="Notes">
										<ItemTemplate>
											<asp:TextBox runat="server" ID="tbNotes" Width="100%" TextMode="MultiLine" Text='<%# Eval("Notes") %>' Rows="6" Style="resize:none;" CssClass="form-control" />
										</ItemTemplate>
									</asp:TemplateField>


                                    <asp:TemplateField ShowHeader="False">
                                        <EditItemTemplate>
                                            <div class="row">
                                                <div class="col-md-10">
                                                    
                                                </div>
								
                                                <div class="col-md-2">

                                            <asp:Button ID="btnSaveProgMon" runat="server" CausesValidation="True" Text="Save" 
												CssClass="btn btn-sm btn-success" OnClick="btnSaveProgMon_Click" Width="100%"/>
                                           
                                                    </div>
                                                </div>
                                        </EditItemTemplate>
                                        
                                    </asp:TemplateField>


                                </Fields>
                            </asp:DetailsView>
                           
							
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
		</ContentTemplate>
	</asp:UpdatePanel>

	  <asp:UpdateProgress id="updateProgress" runat="server">
    <ProgressTemplate>
        <div style="position: fixed; text-align: center; height: 100%; width: 100%; top: 0; right: 0; left: 0; z-index: 9999999; background-color: #000000; opacity: 0.7;">
            <span style="border-width: 0px; position: fixed; padding: 50px; background-color: #FFFFFF; font-size: 36px; left: 40%; top: 40%;">Please Wait</span>
        </div>
    </ProgressTemplate>
    </asp:UpdateProgress>



</asp:Content>
