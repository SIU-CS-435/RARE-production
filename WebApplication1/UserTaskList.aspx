﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UserTaskList.aspx.cs" Inherits="WebApplication1.WebForm2" EnableEventValidation="false" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="masthead">
	    <h3 class="text-muted">Manage Lists</h3>
	</div>
	
	<p>
        <asp:GridView ID="GridView1" CssClass="footable" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" HorizontalAlign="Center" AllowSorting="True" DataKeyNames="task" CellPadding="4" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="task" HeaderText="task" SortExpression="task" ReadOnly="True" />
                <asp:BoundField DataField="priority" HeaderText="priority" SortExpression="priority" />
                <asp:BoundField DataField="progress" HeaderText="progress" SortExpression="progress" />
                <asp:BoundField DataField="end" HeaderText="end" SortExpression="end" />
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            </Columns>
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Table]" ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [Table] WHERE [task] = @original_task AND (([priority] = @original_priority) OR ([priority] IS NULL AND @original_priority IS NULL)) AND (([progress] = @original_progress) OR ([progress] IS NULL AND @original_progress IS NULL)) AND (([end] = @original_end) OR ([end] IS NULL AND @original_end IS NULL)) AND (([userID] = @original_userID) OR ([userID] IS NULL AND @original_userID IS NULL))" InsertCommand="INSERT INTO [Table] ([task], [priority], [progress], [end], [userID]) VALUES (@task, @priority, @progress, @end, @userID)" OldValuesParameterFormatString="original_{0}" UpdateCommand="UPDATE [Table] SET [priority] = @priority, [progress] = @progress, [end] = @end, [userID] = @userID WHERE [task] = @original_task AND (([priority] = @original_priority) OR ([priority] IS NULL AND @original_priority IS NULL)) AND (([progress] = @original_progress) OR ([progress] IS NULL AND @original_progress IS NULL)) AND (([end] = @original_end) OR ([end] IS NULL AND @original_end IS NULL)) AND (([userID] = @original_userID) OR ([userID] IS NULL AND @original_userID IS NULL))">
            <DeleteParameters>
                <asp:Parameter Name="original_task" Type="String" />
                <asp:Parameter Name="original_priority" Type="Int32" />
                <asp:Parameter Name="original_progress" Type="Int32" />
                <asp:Parameter Name="original_end" Type="Int32" />
                <asp:Parameter Name="original_userID" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="task" Type="String" />
                <asp:Parameter Name="priority" Type="Int32" />
                <asp:Parameter Name="progress" Type="Int32" />
                <asp:Parameter Name="end" Type="Int32" />
                <asp:Parameter Name="userID" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="priority" Type="Int32" />
                <asp:Parameter Name="progress" Type="Int32" />
                <asp:Parameter Name="end" Type="Int32" />
                <asp:Parameter Name="userID" Type="String" />
                <asp:Parameter Name="original_task" Type="String" />
                <asp:Parameter Name="original_priority" Type="Int32" />
                <asp:Parameter Name="original_progress" Type="Int32" />
                <asp:Parameter Name="original_end" Type="Int32" />
                <asp:Parameter Name="original_userID" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </p>

    <!-- Button trigger modal -->
	<button class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModalNorm">
		+ Add a Task</button>

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
						  <p>Priority:</p><asp:DropDownList ID="priority" runat="server" class="btn btn-primary dropdown-toggle">
                                <asp:ListItem>Low</asp:ListItem>
                                <asp:ListItem>Normal</asp:ListItem>
                                <asp:ListItem>High</asp:ListItem></asp:DropDownList>
                        
						  <p>Current Progress:</p><asp:TextBox ID="curProg" runat="server" class="form-control" />
						  <p>End Progress:</p><asp:TextBox ID="endProg" runat="server" class="form-control" />
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
