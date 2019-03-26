<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CurriculumArea.aspx.cs" Inherits="ApprenticeshipProgressMonitoring.CurriculumArea" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
	  <div class="jumbotron">
        <h1>Apprenticeship Progress Monitoring</h1>
        
    </div>
	<asp:UpdatePanel runat="server" ID="upPan">
		<ContentTemplate>
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
					<asp:Parameter DefaultValue="2017" Name="Academic_Year" Type="Int32" />
				</SelectParameters>
			</asp:SqlDataSource>
		</div>
	</div>
			<br />
    <div class="row">
        <div class="col-md-12">

<asp:GridView runat="server" ID="gvSummary" Width="100%" AutoGenerateColumns="False" DataSourceID="sqlProgressMonitoringSummary" CssClass="table table-responsive" GridLines="None">

	<Columns>
		<%--<asp:BoundField DataField="Group Code" HeaderText="Group Code" ReadOnly="True" SortExpression="Group Code" />
		<asp:BoundField DataField="Group Name" HeaderText="Group Name" ReadOnly="True" SortExpression="Group Name" />--%>
		<asp:TemplateField>
			<ItemTemplate>
				<%--<asp:Label runat="server" ID="GroupName" Text='<%# Bind("[Group Name]") %>'></asp:Label>--%>
				<asp:HyperLink runat="server" ID="btnOpenArea" CssClass="Label" Text='<%# Bind("[Group Name]") %>' NavigateUrl='<%#Bind("[Navigate URL]") %>' />
			</ItemTemplate>
		</asp:TemplateField>
		<asp:BoundField DataField="Courses" HeaderText="Courses" ReadOnly="True" SortExpression="Courses" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" />
		<asp:BoundField DataField="Students" HeaderText="Students" ReadOnly="True" SortExpression="Students"  HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" />
		<asp:BoundField DataField="Complete" HeaderText="Complete" ReadOnly="True" SortExpression="Complete" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" />
		<asp:BoundField DataField="Green" HeaderText="Green" ReadOnly="True" SortExpression="Green" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" ItemStyle-CssClass="lablel label-lg label-success" HeaderStyle-CssClass="lablel label-lg label-success" />
		<asp:BoundField DataField="Amber" HeaderText="Amber" ReadOnly="True" SortExpression="Amber" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" ItemStyle-CssClass="lablel label-lg label-warning" HeaderStyle-CssClass="lablel label-lg label-warning"/>
		<asp:BoundField DataField="Red" HeaderText="Red" ReadOnly="True" SortExpression="Red" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" ItemStyle-CssClass="lablel label-lg label-danger" HeaderStyle-CssClass="lablel label-lg label-danger" />
		<asp:BoundField DataField="Previous Complete" HeaderText="Last Round Complete" ReadOnly="True" SortExpression="Previous Complete" HeaderStyle-HorizontalAlign="Justify" ItemStyle-HorizontalAlign="Center"/>
		<asp:BoundField DataField="Previous Green" HeaderText="Last Round Green" ReadOnly="True" SortExpression="Previous Green" HeaderStyle-HorizontalAlign="Justify" ItemStyle-HorizontalAlign="Center" ItemStyle-CssClass="lablel label-lg label-success" HeaderStyle-CssClass="lablel label-lg label-success" />
		<asp:BoundField DataField="Previous Amber" HeaderText="Last Round Amber" ReadOnly="True" SortExpression="Previous Amber" HeaderStyle-HorizontalAlign="Justify" ItemStyle-HorizontalAlign="Center" ItemStyle-CssClass="lablel label-lg label-warning" HeaderStyle-CssClass="lablel label-lg label-warning" />
		<asp:BoundField DataField="Previous Red" HeaderText="Last Round Red" ReadOnly="True" SortExpression="Previous Red"  HeaderStyle-HorizontalAlign="Justify" ItemStyle-HorizontalAlign="Center" ItemStyle-CssClass="lablel label-lg label-danger" HeaderStyle-CssClass="lablel label-lg label-danger" />
	</Columns>

</asp:GridView>


        	<asp:SqlDataSource ID="sqlProgressMonitoringSummary" runat="server" ConnectionString="<%$ ConnectionStrings:ApprenticeshipProgressMonitoringConnectionString %>" SelectCommand="getSummaryData" SelectCommandType="StoredProcedure">
				<SelectParameters>
					<asp:ControlParameter ControlID="ddlProgressMonitoringSet" Name="SetID" PropertyName="SelectedValue" Type="Int32" />
					<asp:QueryStringParameter DefaultValue="2" Name="LevelType" QueryStringField="LT" Type="Int32" />
					<asp:QueryStringParameter DefaultValue="%" Name="Filter" QueryStringField="SF" Type="String" />
				</SelectParameters>
			</asp:SqlDataSource>


        </div>
    </div>
		</ContentTemplate>
	</asp:UpdatePanel>

</asp:Content>
