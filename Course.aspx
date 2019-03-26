<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Course.aspx.cs" Inherits="ApprenticeshipProgressMonitoring.Course" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

	
    <div class="jumbotron">
        <h1>Apprenticeship Progress Monitoring</h1>
        
    </div>

	<ol class="breadcrumb">
			<li class="breadcrumb-item"><asp:HyperLink runat="server" ID="hlHome" Text="Home" NavigateUrl="~/Default.aspx"></asp:HyperLink></li>
			<li class="breadcrumb-item"><asp:HyperLink runat="server" ID="hlArea" Text="Area"></asp:HyperLink></li>
			<li class="breadcrumb-item"><asp:HyperLink runat="server" ID="hlTeam" Text="Team"></asp:HyperLink></li>
			<li class="breadcrumb-item active"><asp:Label runat="server" ID="lblCourse"></asp:Label></li>
	</ol>

	<asp:UpdatePanel runat="server" ID="upPan">
		<ContentTemplate>

			<div class="panel">
						<div class="panel-body">
	<div class="row">
		<div class="col-md-2">
			<h4>Monitoring Round</h4>
		</div>
		<div class="col-md-6">
			<asp:DropDownList runat="server" ID="ddlProgressMonitoringSet" CssClass="form-control" Width="100%" DataSourceID="sqlProgressmonitoringSets"
				DataTextField="Progress_Monitoring_Name" DataValueField="Progress_Monitoring_Set_ID" AutoPostBack="true">
			</asp:DropDownList>
			<asp:SqlDataSource ID="sqlProgressmonitoringSets" runat="server" ConnectionString="<%$ ConnectionStrings:ApprenticeshipProgressMonitoringConnectionString %>" SelectCommand="SELECT [Progress Monitoring Set ID] AS Progress_Monitoring_Set_ID, [Progress Monitoring Name] AS Progress_Monitoring_Name FROM [ProgressMonitoringSet] WHERE ([Academic Year] = @Academic_Year) ORDER BY [Set Start]">
				<SelectParameters>
					<asp:Parameter DefaultValue="2018" Name="Academic_Year" Type="Int32" />
				</SelectParameters>
			</asp:SqlDataSource>
		</div>
	</div>
			<br />


	<div class="row">
                <div class="col-md-12">
					
                    <asp:GridView runat="server" ID="gvEnrolments" GridLines="None" AutoGenerateColumns="False"
                        DataKeyNames="Enrolment ID" DataSourceID="sqlEnrolments"
                        CssClass="table table-sm table-hover table-responsive" OnRowCommand="gvEnrolments_RowCommand">

                        <Columns>
                          <asp:TemplateField HeaderText="Student">
								<ItemTemplate>
									<asp:LinkButton runat="server" ID="lbProgressReport"  Text='<%# Eval("StudentName")%>'
										 CommandName="OpenProgressReport" CommandArgument='<%# Eval("Enrolment ID")%>' />
								</ItemTemplate>
							</asp:TemplateField>
							  <asp:TemplateField HeaderText="RAG">
								<ItemTemplate>
									<asp:Label runat="server" ID="lblRAG" Text='<%# Eval("RAG") %>' Font-Size="Larger" CssClass='<%# Eval("[RAG CSS]") %>'></asp:Label>
								</ItemTemplate>
							</asp:TemplateField>
							<asp:TemplateField HeaderText="Progress Report" Visible="false">
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="tbProgressMonitoringStatus" Text='<%# Eval("ProgressMonitoringStatus") %>' Font-Size="Larger" CssClass='<%# Eval("[ProgressMonitoringStatus CSS]") %>'/>
                                </ItemTemplate>
                            </asp:TemplateField>
							<asp:TemplateField HeaderText="RAG (Previous)">
								<ItemTemplate>
									<asp:Label runat="server" ID="lblRAGP" Text='<%# Eval("RAGP") %>' Font-Size="Larger" CssClass='<%# Eval("[RAGP CSS]") %>'></asp:Label>
								</ItemTemplate>
							</asp:TemplateField>
							<asp:BoundField DataField="Progress Status" HeaderText="Progress Status" />
                            <asp:BoundField DataField="Frmwk Start Date" HeaderText="Start Date" SortExpression="Frmwk Start Date" DataFormatString="{0:dd/MM/yyyy}" HtmlEncode="false" />
                            <asp:BoundField DataField="Frmwk Planned End" HeaderText="Planned End" SortExpression="Frmwk Planned End" DataFormatString="{0:dd/MM/yyyy}" HtmlEncode="false" />
                            <asp:BoundField DataField="Frmwk Actual Date" HeaderText="Actual Date" SortExpression="Frmwk Actual Date" DataFormatString="{0:dd/MM/yyyy}" HtmlEncode="false" />
                            <asp:BoundField DataField="Frwk Achieve Date" HeaderText="Achieve Date" SortExpression="Frwk Achieve Date" DataFormatString="{0:dd/MM/yyyy}" HtmlEncode="false" />                            														
                        </Columns>

                    </asp:GridView>
                    <asp:SqlDataSource ID="sqlEnrolments" runat="server" ConnectionString="<%$ ConnectionStrings:ApprenticeshipProgressMonitoringConnectionString %>"
                        SelectCommand="spGetCourseStudents" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="CourseCode" QueryStringField="Course" Type="String" />
							<asp:ControlParameter ControlID="ddlProgressMonitoringSet" DefaultValue="1" Name="SetID" PropertyName="SelectedValue" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
					</div></div>

                </div>
            </div>
			</ContentTemplate>
		</asp:UpdatePanel>
</asp:Content>
