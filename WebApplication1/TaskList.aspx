<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TaskList.aspx.cs" Inherits="WebApplication1.TaskList" EnableEventValidation="false" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="masthead">
	    <h3 class="text-muted">Manage Lists</h3>
	</div>
	
    <!-- Button trigger modal -->
	<button class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModalNorm">
		+ Add a List
	</button>
	<p>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" HorizontalAlign="Center" AllowSorting="True">
            <Columns>
                <asp:BoundField DataField="task" HeaderText="Task" SortExpression="task" />
                <asp:BoundField DataField="priority" HeaderText="Priority" SortExpression="priority" />
                <asp:BoundField DataField="progress" HeaderText="Progress" SortExpression="progress" />
                <asp:BoundField DataField="end" HeaderText="End" SortExpression="end" />
            </Columns>
            <HeaderStyle BackColor="#666666" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [task], [priority], [progress], [end] FROM [d498c91f-2784-4943-b30c-a0db86dfe897]"></asp:SqlDataSource>
    </p>

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
						  <input type="text" class="form-control"
						  id="listTitle" placeholder="Enter New List Title Here"/>
					  </div>
					  <button type="button" onclick="addList()" class="btn btn-default">Create</button>
					</form>
				</div>
			</div>
		</div>
	</div>
	<div id="listSection">
	</div>
    <script src="../Scripts/list.js"></script>
</asp:Content>
