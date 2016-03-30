<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UserTaskList.aspx.cs" Inherits="WebApplication1.WebForm2" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="masthead">
	    <h3 class="text-muted">Manage Lists</h3>
	</div>
	
	<p>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" HorizontalAlign="Center" AllowSorting="True">
            <Columns>
                <asp:BoundField DataField="task" HeaderText="Task" SortExpression="task" />
                <asp:BoundField DataField="priority" HeaderText="Priority" SortExpression="priority" />
                <asp:BoundField DataField="progress" HeaderText="Progress" SortExpression="progress" />
                <asp:BoundField DataField="end" HeaderText="End" SortExpression="end" />
                <asp:CommandField ShowEditButton="True" />
                <asp:CommandField ShowDeleteButton="True" />
            </Columns>
            <HeaderStyle BackColor="#000000" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [task], [priority], [progress], [end] FROM [d498c91f-2784-4943-b30c-a0db86dfe897]"></asp:SqlDataSource>
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
    <script src="Scripts/list.js"></script>
</asp:Content>
