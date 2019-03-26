<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ApprenticeshipProgressMonitoring._Default" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<script runat="server">
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
             ddlProgressMonitoringSet.SelectedIndex = 0;
        }
    }


    </script>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1>Apprenticeship Progress Monitoring</h1>
        
      </div>
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
                DataTextField="Progress_Monitoring_Name" DataValueField="Progress_Monitoring_Set_ID"  AutoPostBack="true"  AppendDataBoundItems="true" > 
            </asp:DropDownList>
			<asp:SqlDataSource ID="sqlProgressmonitoringSets" runat="server" ConnectionString="<%$ ConnectionStrings:ApprenticeshipProgressMonitoringConnectionString %>" SelectCommand="SELECT [Progress Monitoring Set ID] AS Progress_Monitoring_Set_ID, [Progress Monitoring Name] AS Progress_Monitoring_Name FROM [ProgressMonitoringSet] WHERE ([Academic Year] = @Academic_Year)  ORDER BY [SortOrder]  ASC ">

				<SelectParameters>
					<asp:Parameter DefaultValue="2018" Name="Academic_Year" Type="Int32" />
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
		<asp:BoundField DataField="Complete" HeaderText="Rag Rating Complete" ReadOnly="True" SortExpression="Complete" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" />
		<asp:BoundField DataField="Green" HeaderText="Green" ReadOnly="True" SortExpression="Green" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" ItemStyle-CssClass="lablel label-lg label-success" HeaderStyle-CssClass="lablel label-lg label-success" />
		<asp:BoundField DataField="Amber" HeaderText="Amber" ReadOnly="True" SortExpression="Amber" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" ItemStyle-CssClass="lablel label-lg label-warning" HeaderStyle-CssClass="lablel label-lg label-warning"/>
		<asp:BoundField DataField="Red" HeaderText="Red" ReadOnly="True" SortExpression="Red" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" ItemStyle-CssClass="lablel label-lg label-danger" HeaderStyle-CssClass="lablel label-lg label-danger" />
		<asp:BoundField DataField="Black" HeaderText="Black" ReadOnly="True" SortExpression="Black" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" ItemStyle-CssClass="lablel label-lg " HeaderStyle-CssClass="lablel label-lg " />
        <asp:BoundField DataField="Previous Complete" HeaderText="Prev Complete" ReadOnly="True" SortExpression="Previous Complete" ItemStyle-HorizontalAlign="Center" ItemStyle-CssClass="lablel label-lg alert-info" HeaderStyle-CssClass="lablel label-lg alert-info centerHeaderText"/>
		<asp:BoundField DataField="Previous Green" HeaderText="Prev Green" ReadOnly="True" SortExpression="Previous Green" HeaderStyle-HorizontalAlign="Justify" ItemStyle-HorizontalAlign="Center" ItemStyle-CssClass="lablel label-lg alert-success" HeaderStyle-CssClass="lablel label-lg alert-success" />
		<asp:BoundField DataField="Previous Amber" HeaderText="Prev Amber" ReadOnly="True" SortExpression="Previous Amber" HeaderStyle-HorizontalAlign="Justify" ItemStyle-HorizontalAlign="Center" ItemStyle-CssClass="lablel label-lg alert-warning" HeaderStyle-CssClass="lablel label-lg alert-warning" />
		<asp:BoundField DataField="Previous Red" HeaderText="Prev Red" ReadOnly="True" SortExpression="Previous Red"  HeaderStyle-HorizontalAlign="Justify" ItemStyle-HorizontalAlign="Center" ItemStyle-CssClass="lablel label-lg alert-danger" HeaderStyle-CssClass="lablel label-lg alert-danger" />
        <asp:BoundField DataField="Previous Black" HeaderText="Prev Black" ReadOnly="True" SortExpression="Previous Black"  HeaderStyle-HorizontalAlign="Justify" ItemStyle-HorizontalAlign="Center" ItemStyle-CssClass="lablel label-lg " HeaderStyle-CssClass="lablel label-lg" />
	</Columns>

</asp:GridView>
			<asp:SqlDataSource ID="sqlProgressMonitoringSummary" runat="server" ConnectionString="<%$ ConnectionStrings:ApprenticeshipProgressMonitoringConnectionString %>" SelectCommand="getSummaryData" SelectCommandType="StoredProcedure">
				<SelectParameters>
					<asp:ControlParameter ControlID="ddlProgressMonitoringSet" Name="SetID" PropertyName="SelectedValue" Type="Int32" />
					<asp:QueryStringParameter DefaultValue="1" Name="LevelType" QueryStringField="LT" Type="Int32" />
					<asp:QueryStringParameter DefaultValue="%" Name="Filter" QueryStringField="SF" Type="String" />
				</SelectParameters>
			</asp:SqlDataSource>
        </div>
    </div>
			</div></div>
		</ContentTemplate>
	</asp:UpdatePanel>

</asp:Content>
