<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="list.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script src="js/list.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="masthead">
	    <h3 class="text-muted">Manage Lists</h3>
	</div>
	
    <!-- Button trigger modal -->
	<button class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModalNorm">
		+ Add a List
	</button>
	
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
</asp:Content>

