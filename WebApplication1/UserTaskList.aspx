﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UserTaskList.aspx.cs" Inherits="WebApplication1.WebForm2" EnableEventValidation="false" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="masthead">
	    <h3 class="text-muted">Manage Lists</h3>
	</div>
	
	<p>
        <asp:GridView ID="GridView1" CssClass="footable" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" HorizontalAlign="Center" AllowSorting="True" DataKeyNames="Id" OnRowDataBound="taskProgressColor">
            <Columns>
                <asp:BoundField DataField="task" HeaderText="Task" SortExpression="task" >
                <ControlStyle CssClass="form-control input-sm" />
                </asp:BoundField>
                <asp:TemplateField HeaderText="Priority" SortExpression="priority">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control" SelectedValue='<%# Bind("priority") %>'>
                            <asp:ListItem Value="0">Low</asp:ListItem>
                            <asp:ListItem Value="1">Normal</asp:ListItem>
                            <asp:ListItem Value="2">High</asp:ListItem>
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("priority") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="progress" HeaderText="Progress" SortExpression="progress" >
                <ControlStyle CssClass="form-control input-sm" />
                </asp:BoundField>
                <asp:BoundField DataField="end" HeaderText="End" SortExpression="end" >
                <ControlStyle CssClass="form-control input-sm" />
                </asp:BoundField>
                <asp:BoundField DataField="deadline" HeaderText="Deadline" SortExpression="deadline" >
                <ControlStyle CssClass="form-control input-sm" />
                </asp:BoundField>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" >
                <ControlStyle CssClass="btn btn-primary btn-sm" />
                </asp:CommandField>
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" 
            SelectCommand="SELECT * FROM [Table] WHERE ([userID] = @userID)" 
            DeleteCommand="DELETE FROM [Table] WHERE [Id] = @original_Id" 
            OldValuesParameterFormatString="original_{0}" 
            UpdateCommand="UPDATE [Table] SET [task] = @task, [priority] = @priority, [progress] = @progress, [end] = @end, [deadline] = @deadline, [userID] = @userID WHERE [Id] = @original_Id" 
            InsertCommand="INSERT INTO [Table] ([task], [priority], [progress], [end], [deadline], [userID]) VALUES (@task, @priority, @progress, @end, @deadline, @userID)">
            <DeleteParameters>
                <asp:Parameter Name="original_Id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="task" Type="String" />
                <asp:Parameter Name="priority" Type="String" />
                <asp:Parameter Name="progress" Type="Int32" />
                <asp:Parameter Name="end" Type="Int32" />
                <asp:Parameter Name="deadline" Type="String" />
                <asp:Parameter Name="userID" Type="String" />
                <asp:Parameter Name="listName" Type="String" />
            </InsertParameters>
            <SelectParameters>
	            <asp:Parameter Name="userID" Type="String" DefaultValue="Anonymous" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="task" Type="String" />
                <asp:Parameter Name="priority" Type="Int32" />
                <asp:Parameter Name="progress" Type="Int32" />
                <asp:Parameter Name="end" Type="Int32" />
                <asp:Parameter Name="userID" Type="String" DefaultValue="Anonymous" />
                <asp:Parameter Name="listName" Type="String" />
                <asp:Parameter Name="original_task" Type="String" />
                <asp:Parameter Name="original_priority" Type="Int32" />
                <asp:Parameter Name="original_progress" Type="Int32" />
                <asp:Parameter Name="original_Id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </p>

    <!-- Button trigger modal -->
	<button class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModalNorm">
		+ Add a Task</button>
    <asp:DropDownList ID="Scheme" runat="server" class="btn btn-primary dropdown-toggle" onchange="javascript:__doPostBack('ctl00$MainContent$GridView1','Cancel$0')">
        <asp:ListItem>Original</asp:ListItem>
        <asp:ListItem>Barbie</asp:ListItem>
        <asp:ListItem>Bacon</asp:ListItem></asp:DropDownList>

    <!-- Modal -->
	<div class="modal fade" id="myModalNorm" tabindex="-1" role="dialog" 
		 aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<!-- Modal Header -->
				<div class="modal-header">
                    <button type="button" class="close" 
					   data-dismiss="modal">
						   <span aria-hidden="true">&times;</span>
						   <span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">
						Add a New List
					</h4>
				</div>
				<!-- Modal Body -->
				<div class="modal-body">
					<form role="form">
					  <div class="form-group">
						  <p>Title:</p><asp:TextBox ID="taskTitle" runat="server" class="form-control" />
						  <p><br/>Priority:</p><asp:DropDownList ID="priority" runat="server" class="btn btn-primary dropdown-toggle">
                                <asp:ListItem>Low</asp:ListItem>
                                <asp:ListItem>Normal</asp:ListItem>
                                <asp:ListItem>High</asp:ListItem></asp:DropDownList>
						  <p><br/>Current Progress:</p><asp:TextBox ID="curProg" runat="server" class="form-control" />
						  <p><br/>End Progress:</p><asp:TextBox ID="endProg" runat="server" class="form-control" />
						  <p><br/>Days Left Until Deadline:</p><asp:TextBox ID="daysLeft" runat="server" class="form-control" />

					  </div>
					  <asp:Button ID="Button1" runat="server" OnClick="submitButton_Click" Text="Submit" class="btn btn-default" />
                    </form>
				</div>
			</div>
		</div>
	</div>
	<div id="listSection">
	</div>
    
    <link href="https://cdnjs.cloudflare.com/ajax/libs/jquery-footable/0.1.0/css/footable.min.css"
        rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery-footable/0.1.0/js/footable.min.js"></script>
    <script src="Scripts/list.js"></script>
    <script type="text/javascript">
        $(function () {
            $('[id*=GridView1]').footable();
        });
    </script>
</asp:Content>